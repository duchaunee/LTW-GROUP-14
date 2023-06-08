/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.OrderAddress;
import entity.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderAddressDAO extends DAO{
    public OrderAddressDAO(){}
    public List<OrderAddress>findAll(){
        List<OrderAddress>list=new ArrayList<>();
        String query="select * from order_address";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new OrderAddress(rs.getInt(1),rs.getString(2),
                                    rs.getString(3),rs.getString(4),rs.getString(5),
                                    rs.getString(6),rs.getString(7),
                                    rs.getString(8)));
            }
        }catch(Exception e){
        }
        return list;
    }
    public OrderAddress findById(Integer Id) throws Exception{
        String query="select * from order_address where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new OrderAddress(rs.getInt(1),rs.getString(2),
                                    rs.getString(3),rs.getString(4),rs.getString(5),
                                    rs.getString(6),rs.getString(7),
                                    rs.getString(8));
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
    public int save(String city, String district, String ward, String address, String phoneNumber, String note, String paymentMethod){
        String query="insert into order_address (city, district, ward, address, phone_number, note, paymentMethod)\n" +
"values (?, ?, ?, ?, ?, ?, ?)";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, city);
            ps.setString(2, district);
            ps.setString(3, ward);
            ps.setString(4, address);
            ps.setString(5, phoneNumber);
            ps.setString(6, note);
            ps.setString(7, paymentMethod);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    return generatedId;
                }
            }
        }catch(Exception e){
        }
        return 1;
    }
}
