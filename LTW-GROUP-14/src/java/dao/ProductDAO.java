/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBConnect;
import entity.Product;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DAO{
    public ProductDAO(){}
    public List<Product>findAll(){
        List<Product>list=new ArrayList<>();
        String query="select * from product";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getInt(1),rs.getString(4),
                                    rs.getString(5),rs.getInt(6),rs.getString(7),
                                    rs.getString(8),rs.getString(9),
                                    rs.getTimestamp(10).toLocalDateTime(),
                                    rs.getTimestamp(11).toLocalDateTime()));
            }
        }catch(Exception e){
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
                return new Product(rs.getInt(1),rs.getString(4),
                                    rs.getString(5),rs.getInt(6),rs.getString(7),
                                    rs.getString(8),rs.getString(9),
                                    rs.getTimestamp(10).toLocalDateTime(),
                                    rs.getTimestamp(11).toLocalDateTime());
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
                return new Product(rs.getInt(1),rs.getString(4),
                                    rs.getString(5),rs.getInt(6),rs.getString(7),
                                    rs.getString(8),rs.getString(9),
                                    rs.getTimestamp(10).toLocalDateTime(),
                                    rs.getTimestamp(11).toLocalDateTime());
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
    public List<Product>findByPattern(String pattern){
        List<Product>list=new ArrayList<>();
        String query="select * from product where name like ?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, "%"+pattern+"%");
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getInt(1),rs.getString(4),
                                    rs.getString(5),rs.getInt(6),rs.getString(7),
                                    rs.getString(8),rs.getString(9),
                                    rs.getTimestamp(10).toLocalDateTime(),
                                    rs.getTimestamp(11).toLocalDateTime()));
            }
        }catch(Exception e){
        }
        return list;
    }
    public List<Product>pagningProduct(Integer id){
        List<Product>list=new ArrayList<>();
        String query="select * from product order by id limit 3 offset ?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, (id-1)*3);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getInt(1),rs.getString(4),
                                    rs.getString(5),rs.getInt(6),rs.getString(7),
                                    rs.getString(8),rs.getString(9),
                                    rs.getTimestamp(10).toLocalDateTime(),
                                    rs.getTimestamp(11).toLocalDateTime()));
            }
        }catch(Exception e){
        }
        return list;
    }
    public int countProduct() {
        String query="select count(*) from product";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        }catch(Exception e){
        }
        return 0;
    }
}
