/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.ImageProduct;
import entity.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ImageProductDAO extends DAO{
    public ImageProductDAO(){}
    public List<ImageProduct>findAll(){
        List<ImageProduct>list=new ArrayList<>();
        String query="select * from image_product";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new ImageProduct(rs.getInt(1),rs.getString(2),
                                    rs.getString(3),rs.getString(4),rs.getString(5),
                                    rs.getString(6)));
            }
        }catch(Exception e){
        }
        return list;
    }
    public ImageProduct findById(Integer Id) throws Exception{
        String query="select * from image_product where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new ImageProduct(rs.getInt(1),rs.getString(2),
                                    rs.getString(3),rs.getString(4),rs.getString(5),
                                    rs.getString(6));
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
}
