/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Product;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DAO{
    public ProductDAO(){}
    public List<Product>findAll(){
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try{
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getInt(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime(),
                                    rs.getTimestamp(9).toLocalDateTime()));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    public Product findById(Integer Id) throws Exception{
        String query="select * from product where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new Product(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getInt(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime(),
                                    rs.getTimestamp(9).toLocalDateTime());
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
    public Product findByName(String name) throws Exception{
        String query="select * from product where name=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, name);
            rs=ps.executeQuery();
            if(rs.next()){
                return new Product(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getInt(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime(),
                                    rs.getTimestamp(9).toLocalDateTime());
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
    public void deleteById(Integer Id) throws Exception {
        try {
            conn = new DBConnect().getConnection();
            String query = "DELETE FROM product WHERE id = ?";
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }
    
   
}