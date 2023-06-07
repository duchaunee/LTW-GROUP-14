/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnect;
import entity.Order;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DAO{
    private UserDAO udao=new UserDAO();
    private OrderAddressDAO oDao=new OrderAddressDAO();
    
    private final UserDAO userDAO = new UserDAO();
    
    private final OrderAddressDAO orderAddressDAO = new OrderAddressDAO();
    
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
    
    public List<Order> pagingOrder(Integer page){
        String query = "SELECT * FROM purchase_order LIMIT 5 OFFSET ?";
        List<Order> orderList = new ArrayList<>();
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (page - 1) * 5);
            rs = ps.executeQuery();
            while(rs.next()){
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setOrderAddress(orderAddressDAO.findById(rs.getInt("order_address_id")));
                order.setUser(userDAO.findById(rs.getInt("user_id")));
                order.setDeliveryfee(rs.getInt("deliveryfee"));
                order.setDiscount(rs.getInt("discount"));
                order.setTotalPayment(rs.getInt("total_payment"));
                order.setOrderTime(rs.getTimestamp("order_time").toLocalDateTime());
                order.setAmount(rs.getInt("order_amount"));
                order.setPhoneNumber(rs.getString("phone_number"));
                order.setCreateAt(rs.getTimestamp("create_at").toLocalDateTime());
                order.setOrderItemList(new OrderItemDAO().findByOrder(rs.getInt("id")));
                orderList.add(order);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return orderList;
    }
}
