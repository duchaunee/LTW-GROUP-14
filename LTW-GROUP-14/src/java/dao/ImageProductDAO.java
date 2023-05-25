/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.ImageProduct;
import java.io.InputStream;

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
    
    public void save(InputStream[] image){
        String query = "INSERT INTO image_product (img, img_preview1, img_preview2, img_preview3, img_preview4) "
                     + "VALUES(?, ?, ?, ?, ?)";
        try{
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            for (int i = 0; i < image.length; i++){
                ps.setBlob(i + 1, image[i]);
            }
            ps.executeUpdate();
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}
