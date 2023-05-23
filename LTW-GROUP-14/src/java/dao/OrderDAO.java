/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Order;
import entity.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DAO{
    private UserDAO udao=new UserDAO();
    private OrderAddressDAO oDao=new OrderAddressDAO();
    public OrderDAO(){}
    public List<Order>findAll(){
        List<Order>list=new ArrayList<>();
        String query="select * from purchase_order";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new Order(rs.getInt(1),
                        udao.findById(rs.getInt(3)),
                                    oDao.findById(rs.getInt(2))
                        ,rs.getInt(4),rs.getInt(5),
                                    rs.getInt(6),rs.getTimestamp(7).toLocalDateTime(),rs.getInt(8),
                                    rs.getTimestamp(9).toLocalDateTime()));
            }
        }catch(Exception e){
        }
        return list;
    }
    public Order findById(Integer Id) throws Exception{
        String query="select * from purchase_order where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new Order(rs.getInt(1),
                        udao.findById(rs.getInt(3)),
                                    oDao.findById(rs.getInt(2))
                        ,rs.getInt(4),rs.getInt(5),
                                    rs.getInt(6),rs.getTimestamp(7).toLocalDateTime(),rs.getInt(8),
                                    rs.getTimestamp(9).toLocalDateTime());
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
   
}
