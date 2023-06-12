/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.CartDAO;
import dao.CartItemDAO;
import entity.Cart;
import entity.CartItem;
import entity.User;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Admin
 */
public class CartService {
    private CartDAO cartDAO=new CartDAO();
    private CartItemDAO cartItemDAO=new CartItemDAO();
    public void showCart(HttpServletRequest request, User currentUser){
        Cart cart=cartDAO.findByUserId(currentUser.getId());
        List<CartItem>cartItemList=cartItemDAO.findByCartID(cart.getId());
        LocalDate currentDate = LocalDate.now();
        LocalDate deliveryDate = currentDate.plusDays(4);
        request.setAttribute("now", currentDate);
        request.setAttribute("deli", deliveryDate);
        request.setAttribute("items", cartItemList);
        request.setAttribute("id", currentUser.getId());
        request.setAttribute("discount", 0);
    }
}
