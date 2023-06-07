/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Order;
import entity.OrderItem;
import entity.Product;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderItemDAO extends DAO{
    private OrderDAO oDAO=  new OrderDAO();
    private ProductDAO pDAO = new ProductDAO();
    public OrderItemDAO(){}
    public List<OrderItem>findAll(){
        List<OrderItem>list=new ArrayList<>();
        String query="select * from order_item";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new OrderItem(rs.getInt(1),oDAO.findById(rs.getInt(3)),
                                    pDAO.findById(rs.getInt(2)),rs.getString(4),rs.getInt(5)));
            }
        }catch(Exception e){
        }
        return list;
    }
    public List<OrderItem>pagningOrderItem(Integer id){
        List<OrderItem>list=new ArrayList<>();
        String query="select * from order_item order by id limit 5 offset ?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, (id-1)*5);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new OrderItem(rs.getInt(1),oDAO.findById(rs.getInt(3)),
                                    pDAO.findById(rs.getInt(2)),rs.getString(4),rs.getInt(5)));
            }
        }catch(Exception e){
        }
        return list;
    }
    public int countOrderItem(){
        String query="select count(*) from order_item";
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
    public OrderItem findById(Integer Id) throws Exception{
        String query="select * from order_item where id=?";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, Id);
            rs=ps.executeQuery();
            if(rs.next()){
                return new OrderItem(rs.getInt(1),oDAO.findById(rs.getInt(3)),
                                    pDAO.findById(rs.getInt(2)),rs.getString(4),rs.getInt(5));
            }
            else{
            }
        }catch(Exception e){
        }
        return null;
    }
    
    //Write by Devper315
    public List<OrderItem> findByProduct(Integer product_id){
        String query = "SELECT * FROM order_item where product_id = ?";
        List<OrderItem> orderItemList = new ArrayList<>();
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, product_id);
            rs = ps.executeQuery();
            while(rs.next()){
                Order order = new OrderDAO().findById(rs.getInt("order_id"));
                Product product = new ProductDAO().findById(rs.getInt("product_id"));
                OrderItem orderItem = new OrderItem(rs.getInt("id"),
                                                    order,
                                                    product,
                                                    rs.getString("order_status"),
                                                    rs.getInt("quantity"));
                orderItemList.add(orderItem);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return orderItemList;
    }
    
    public List<OrderItem> findByOrder(Integer order_id){
        String query = "SELECT * FROM order_item where order_id = ?";
        List<OrderItem> orderItemList = new ArrayList<>();
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, order_id);
            rs = ps.executeQuery();
            while(rs.next()){
                Order order = new OrderDAO().findById(rs.getInt("order_id"));
                Product product = new ProductDAO().findById(rs.getInt("product_id"));
                OrderItem orderItem = new OrderItem(rs.getInt("id"),
                                                    order,
                                                    product,
                                                    rs.getString("order_status"),
                                                    rs.getInt("quantity"));
                orderItemList.add(orderItem);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return orderItemList;
    }
}
