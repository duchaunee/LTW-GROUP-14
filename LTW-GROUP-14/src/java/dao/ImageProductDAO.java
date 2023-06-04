/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.ImageProduct;
import java.io.InputStream;
import java.sql.Statement;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class ImageProductDAO extends DAO{
    public ImageProductDAO(){}
    
    public ImageProduct findById(Integer Id) throws Exception{
        String query="select * from image_product where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs = ps.executeQuery();
            if(rs.next()){
                return new ImageProduct(rs.getInt("id"),
                                        rs.getBytes("img"),
                                        rs.getBytes("img_preview1"),
                                        rs.getBytes("img_preview2"),
                                        rs.getBytes("img_preview3"),
                                        rs.getBytes("img_preview4"));
                                    
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
    
    public Integer save(HttpServletRequest request){
        List<InputStream> image = Utils.processImage(request);
        String query = "INSERT INTO image_product (img";
        String value = ")VALUES(?";
        if(image.isEmpty()) return null;
        for(int i = 1; i < image.size(); i++){
            query += ", img_preview" + i;
            value += ", ?";
        }
        query += value + ")";
        try{
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < image.size(); i++){
                ps.setBlob(i + 1, image.get(i));
            }
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if(rs.next()){
                return rs.getInt(1);
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    
    public void update(HttpServletRequest request){
        Integer id = Integer.valueOf(request.getParameter("image_id"));
        List<InputStream> image = Utils.processImage(request);
        String query = "UPDATE image_product SET img = ?";
        if(image.isEmpty()) return;
        for(int i = 1; i < image.size(); i++){
            query += ", img_preview" + i + " = ?";
        }
        query += "WHERE id = ?";
        try{
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < image.size(); i++){
                ps.setBlob(i + 1, image.get(i));
            }
            ps.setInt(image.size() + 1, id);
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}
