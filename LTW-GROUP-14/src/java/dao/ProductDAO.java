/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Product;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DAO{
    public ProductDAO(){
    
    }
    
    public List<Product>findAll(){
        List<Product>list=new ArrayList<>();
        String query="select * from product";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                Product product = new Product(rs.getInt(1),
                                            rs.getString(2),
                                            rs.getInt(3),
                                            rs.getInt(4),
                                            rs.getString(5),
                                            rs.getString(6),
                                            rs.getString(7),
                                            rs.getTimestamp(8).toLocalDateTime(),
                                            rs.getTimestamp(9).toLocalDateTime());
                product.setImage_id(rs.getInt("image_id"));
                list.add(product);
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
                Product product = new Product(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getInt(3),
                                    rs.getInt(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime(),
                                    rs.getTimestamp(9).toLocalDateTime());
                product.setImage_id(rs.getInt("image_id"));
                return product;
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
    public Product findByName(String name) throws Exception{
        String query="select * from product where name = ?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, name);
            rs=ps.executeQuery();
            if(rs.next()){
                Product product = new Product(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getInt(3),
                                    rs.getInt(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime(),
                                    rs.getTimestamp(9).toLocalDateTime());
                product.setImage_id(rs.getInt("image_id"));
                return product;
            }
            else{
            }
        }catch(Exception e){
            System.out.println(e);
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
                list.add(new Product(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getInt(3),
                                    rs.getInt(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getString(7),
                                    rs.getTimestamp(8).toLocalDateTime(),
                                    rs.getTimestamp(9).toLocalDateTime()));
            }
        }catch(Exception e){
        }
        return list;
    }
    
    public void save(HttpServletRequest request, Integer image_id){
        String query = "INSERT INTO product(name, price, inventory, category, brand, description, create_at, update_at, image_id)"
                      + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("price"));
            ps.setString(3, request.getParameter("inventory"));
            ps.setString(4, request.getParameter("category"));
            ps.setString(5, request.getParameter("brand"));
            ps.setString(6, request.getParameter("desc"));
            ps.setTimestamp(7, Timestamp.valueOf(LocalDateTime.now()));
            ps.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now()));
            ps.setInt(9, image_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void update(HttpServletRequest request){
        String query = "UPDATE product SET name = ?, price = ?,"
                     + "inventory = ?, category = ?, brand = ?, description = ?,"
                     + "update_at = ? WHERE id = ?";
        Integer id = Integer.valueOf(request.getParameter("id"));
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("price"));
            ps.setString(3, request.getParameter("inventory"));
            ps.setString(4, request.getParameter("category"));
            ps.setString(5, request.getParameter("brand"));
            ps.setString(6, request.getParameter("desc"));
            ps.setTimestamp(7, Timestamp.valueOf(LocalDateTime.now()));
            ps.setInt(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
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
                Product product = new Product(rs.getInt(1),
                                            rs.getString(2),
                                            rs.getInt(3),
                                            rs.getInt(4),
                                            rs.getString(5),
                                            rs.getString(6),
                                            rs.getString(7),
                                            rs.getTimestamp(8).toLocalDateTime(),
                                            rs.getTimestamp(9).toLocalDateTime());
                product.setImage_id(rs.getInt("image_id"));
                list.add(product);
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
    public void updateQuantity(Integer id, Integer newQuantity){
        String query = "UPDATE product SET inventory =  ? WHERE id = ?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, newQuantity);
            ps.setInt(2, id);
            ps.executeUpdate();
        }catch(Exception e){
        }
        
    }
    public void deleteById(Integer id){
        String query = "DELETE FROM product where id = ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareCall(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
