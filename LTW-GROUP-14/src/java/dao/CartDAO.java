/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Cart;
import entity.User;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CartDAO extends DAO {

  private UserDAO udao = new UserDAO();

  public CartDAO() {
  }

  public Cart getCartByUser(User user) throws Exception {
    String query = "select * from cart where user_id=?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setInt(1, user.getId());
      rs = ps.executeQuery();

      //Nếu có Cart chỉ việc return cái cart đó
      if (rs.next()) {
        Cart cart = new Cart(rs.getInt(1),
                user,
                (LocalDateTime) rs.getObject(3));
        return cart;
      } //Nếu chưa có Cart thì tạo mới Cart luôn
      else {
        String query1 = "insert into cart (user_id, create_at) values(?, ?)"; //create_at
        ps = conn.prepareStatement(query1);
        ps.setInt(1, user.getId());
        ps.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) { //insert thanh cong
          ps = conn.prepareStatement(query); //thuc hien lai query de lay ra Cart vua insert
          ps.setInt(1, user.getId());
          rs = ps.executeQuery();
          if (rs.next()) {
            Cart cart = new Cart(rs.getInt(1),
                    user,
                    (LocalDateTime) rs.getObject(3));
            return cart;
          } else {
            return null;
          }
        }
      }
    } catch (Exception e) {
    }
    return null;
  }

  public void addToCart(Integer product_id, Integer cart_id, Integer quantity) {
    System.out.println("product_id: " + product_id);
    System.out.println("cart_id: " + cart_id);
    System.out.println("quantity: " + quantity);
    String query1 = "select * from cart_item where cart_id = ? and product_id = ?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query1);
      ps.setInt(1, cart_id);
      ps.setInt(2, product_id);
      rs = ps.executeQuery();

      // Nếu cartItem đã tồn tại --> Chỉ update quantity
      if (rs.next()) {
        String query2 = "update cart_item set quantity = ? "
                + "where cart_id = ? and product_id = ?";
        ps = conn.prepareStatement(query2);
        ps.setInt(1, rs.getInt(4) + quantity);
        ps.setInt(2, cart_id);
        ps.setInt(3, product_id);
        ps.executeUpdate();
      } // Nếu cartItem 0 tồn tại --> insert cart_item
      else {
        System.out.println("here is go");
        String query3 = "insert into cart_item (product_id, cart_id, quantity, create_at)"
                + "values (?, ?, ?, ?)";
        ps = conn.prepareStatement(query3);
        ps.setInt(1, product_id);
        ps.setInt(2, cart_id);
        ps.setInt(3, quantity);
        ps.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
        ps.executeUpdate();
      }
    } catch (Exception e) {
    }
  }

  public List<Cart> findAll() {
    List<Cart> list = new ArrayList<>();
    String query = "select * from cart";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        list.add(new Cart(rs.getInt(1), udao.findById(rs.getInt(2)),
                rs.getTimestamp(3).toLocalDateTime()));
      }
    } catch (Exception e) {
    }
    return list;
  }

  public Cart findById(Integer Id) {
    String query = "select * from cart where id=?";
    try {
      conn = new DBConnect().getConnection();
      ps = conn.prepareStatement(query);
      ps.setInt(1, Id);
      rs = ps.executeQuery();
      if (rs.next()) {
        return new Cart(rs.getInt(1), udao.findById(rs.getInt(2)),
                rs.getTimestamp(3).toLocalDateTime());
      } else {
      }
    } catch (Exception e) {
    }
    return null;
  }
  public Cart findByUserId(Integer Id){
        String query="select * from cart where user_id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new Cart(rs.getInt(1),udao.findById(rs.getInt(2)),
                                    rs.getTimestamp(3).toLocalDateTime());
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
}
