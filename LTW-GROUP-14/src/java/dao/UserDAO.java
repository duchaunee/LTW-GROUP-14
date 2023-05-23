/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Product;
import entity.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAO extends DAO{
    public UserDAO(){}
    public List<User>findAll(){
        List<User>list=new ArrayList<>();
        String query="select * from user";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new User(rs.getInt(1),rs.getString(2),
                                    rs.getString(3),rs.getString(4),rs.getString(5),
                                    rs.getString(6),rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime()));
            }
        }catch(Exception e){
        }
        return list;
    }
    public User findById(Integer Id) throws Exception{
        String query="select * from user where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new User(rs.getInt(1),rs.getString(2),
                                    rs.getString(3),rs.getString(4),rs.getString(5),
                                    rs.getString(6),rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime());
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
   
    public void deleteById(Integer Id) throws  Exception {
        try {
            conn = new DBConnect().getConnection();
            String query = "DELETE FROM user WHERE id = ?";
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }
}
