/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Cart;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CartDAO extends DAO{
    private UserDAO udao=new UserDAO();
    public CartDAO(){}
    public List<Cart>findAll(){
        List<Cart>list=new ArrayList<>();
        String query="select * from cart";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new Cart(rs.getInt(1),udao.findById(rs.getInt(2)),
                                    rs.getTimestamp(3).toLocalDateTime()));
            }
        }catch(Exception e){
        }
        return list;
    }
    public Cart findById(Integer Id){
        String query="select * from cart where id=?";
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
