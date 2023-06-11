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
        String query = "SELECT ot.id, ot.product_id, ot.order_id, ot.order_status, ot.quantity \n" +
                        "FROM order_item as ot LEFT JOIN purchase_order as po\n" +
                        "ON ot.order_id = po.id\n" +
                        "ORDER BY po.order_time\n" +
                        "limit 5 offset ?";
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
            System.out.println(e);
        }
        return list;
    }
    
    public List<OrderItem>pagningOrderItem(String filterBy, String sortBy, Integer currentPage){
        List<OrderItem>list=new ArrayList<>();
        String query = "SELECT ot.id, ot.product_id, ot.order_id, ot.order_status, ot.quantity \n" +
                        "FROM order_item as ot LEFT JOIN purchase_order as po\n" +
                        "ON ot.order_id = po.id\n" +
                        "-- filterBy\n" +
                        "ORDER BY po.order_time -- sortBy\n" +
                        "limit 5 offset ?";
        if(filterBy != null && !filterBy.equals("Tất cả")) 
            query = query.replace("-- filterBy", "WHERE order_status = '" +  filterBy + "'");
        if(sortBy != null && sortBy.equals("Mới nhất")) 
            query = query.replace("-- sortBy", "DESC");
        System.out.println(query);
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, (currentPage - 1)*5);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new OrderItem(rs.getInt(1),
                                       oDAO.findById(rs.getInt(3)),
                                       pDAO.findById(rs.getInt(2)),
                                       rs.getString(4),
                                       rs.getInt(5)));
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return list;
    }
    public int countOrderItem(){
        String query="select count(id) from order_item";
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
    public OrderItem findById(Integer Id){
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
    
    public void update(OrderItem orderItem){
        String query = "UPDATE order_item SET order_status = ? where id = ?";
        System.out.println(orderItem.getOrderStatus());
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderItem.getOrderStatus());
            ps.setInt(2, orderItem.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void save(Integer productId, Integer orderId, String orderStatus, Integer quantity ){
        String query="insert into order_item (product_id, order_id, order_status, quantity)\n" +
"values (?, ?, ?, ?)";
        try{
            conn = new DBConnect().getConnection();
            ps=conn.prepareStatement(query);
            ps.setInt(1, productId);
            ps.setInt(2, orderId);
            ps.setString(3, orderStatus);
            ps.setInt(4, quantity);;
            int rowsAffected = ps.executeUpdate();
        }catch(Exception e){
        }
    }
}
