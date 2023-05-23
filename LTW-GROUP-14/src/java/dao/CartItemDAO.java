/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.CartItem;
import entity.Product;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CartItemDAO extends DAO{
    private ProductDAO pDAO=new ProductDAO();
    private CartDAO cDAO=new CartDAO();
    public CartItemDAO(){}
    public List<CartItem>findAll(){
        List<CartItem>list=new ArrayList<>();
        String query="select * from cart_item";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new CartItem(rs.getInt(1), pDAO.findById(rs.getInt(2)), cDAO.findById(rs.getInt(3)) , 
                        rs.getInt(4),rs.getTimestamp(5).toLocalDateTime()));
            }
        }catch(Exception e){
        }
        return list;
    }
    public CartItem findById(Integer Id) throws Exception{
        String query="select * from cart where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new CartItem(rs.getInt(1), pDAO.findById(rs.getInt(2)), cDAO.findById(rs.getInt(3)) , 
                        rs.getInt(4),rs.getTimestamp(5).toLocalDateTime());
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
}
