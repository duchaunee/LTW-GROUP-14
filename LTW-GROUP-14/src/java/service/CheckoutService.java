/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.CartDAO;
import dao.CartItemDAO;
import dao.OrderAddressDAO;
import dao.OrderDAO;
import dao.OrderItemDAO;
import dao.ProductDAO;
import entity.Cart;
import entity.CartItem;
import entity.User;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Admin
 */
public class CheckoutService {
    private CartItemDAO cartItemDAO=new CartItemDAO();
    private OrderAddressDAO orderAddressDAO=new OrderAddressDAO();
    private OrderItemDAO orderItemDAO=new OrderItemDAO();
    private OrderDAO orderDAO=new OrderDAO();
    private ProductDAO productDAO=new ProductDAO();
    private CartDAO cartDAO=new CartDAO();
    public void save(HttpServletRequest request, User currentUser){
        String city=request.getParameter("city");
            String district=request.getParameter("district");
            String ward=request.getParameter("wards");
            String phone=request.getParameter("phoneNumber");
            String address=request.getParameter("address");
            String note=request.getParameter("note");
            String paymentMethod=request.getParameter("paymentMethod");
            Integer total=Integer.parseInt(request.getParameter("total"));
            Integer discount=Integer.parseInt(request.getParameter("discount"));
            Cart cart=cartDAO.findByUserId(currentUser.getId());
            List<CartItem>cartItems=cartItemDAO.findByCartID(cart.getId());
            request.setAttribute("items", cartItems);
            request.setAttribute("discount", discount);
            request.setAttribute("city", city);
            request.setAttribute("district", district);
            request.setAttribute("ward", ward);
            request.setAttribute("phone", phone);
            request.setAttribute("note", note);
            request.setAttribute("address", address);
            request.setAttribute("name", currentUser.getName());
            request.setAttribute("email", currentUser.getEmail());
            request.setAttribute("time", LocalDateTime.now());
            int orderAddressId=orderAddressDAO.save(city, district, ward, address, phone, note, paymentMethod);
            int orderId=orderDAO.save(orderAddressId, cart.getId(), 30000, discount, total, LocalDateTime.now(), cartItems.size(), LocalDateTime.now());
            for(CartItem x:cartItems){
                orderItemDAO.save(x.getProduct().getId(), orderId, "Đang xử lý", x.getQuantity());
            }
            for(CartItem x:cartItems){
                productDAO.updateQuantity(x.getProduct().getId(), x.getProduct().getInventory()-x.getQuantity());
                cartItemDAO.deleteById(x.getId());
            }
            if(paymentMethod.equals("cash")){
                request.setAttribute("payment", "Trả tiền mặt khi nhận hàng");
            }
            else{
                request.setAttribute("payment", "Thanh toán online");
            }
    }
}
