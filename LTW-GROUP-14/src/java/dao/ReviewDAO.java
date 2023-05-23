/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Product;
import entity.Review;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ReviewDAO extends DAO{
    public List<Review>findAll(){
        List<Review>list=new ArrayList<>();
        String query="select * from review";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            list.add(new Review(rs.getInt(1), product, orderItem, user, query, query, LocalDateTime.MAX))
        }catch(Exception e){
        }
        return list;
    }
}
