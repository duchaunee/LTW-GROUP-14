/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Checkout;

import dao.CartDAO;
import dao.CartItemDAO;
import dao.OrderAddressDAO;
import dao.OrderDAO;
import dao.OrderItemDAO;
import dao.ProductDAO;
import dao.UserDAO;
import entity.CartItem;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckoutSuccessController", urlPatterns = {"/CheckoutSuccessController"})
public class CheckoutSuccessController extends HttpServlet {
    private OrderAddressDAO orderAddressDAO=new OrderAddressDAO();
    private CartDAO cartDAO=new CartDAO();
    private CartItemDAO cartItemDAO=new CartItemDAO();
    private UserDAO userDAO=new UserDAO();
    private OrderDAO orderDAO=new OrderDAO();
    private OrderItemDAO orderItemDAO=new OrderItemDAO();
    private ProductDAO productDAO=new ProductDAO();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String city=request.getParameter("city");
        String district=request.getParameter("district");
        String ward=request.getParameter("wards");
        String phone=request.getParameter("phoneNumber");
        String address=request.getParameter("address");
        String note=request.getParameter("note");
        String paymentMethod=request.getParameter("paymentMethod");
        Integer total=Integer.parseInt(request.getParameter("total"));
        Integer discount=Integer.parseInt(request.getParameter("discount"));
        int cartId=Integer.parseInt(request.getParameter("cartId"));
        List<CartItem>cartItems=cartItemDAO.findByCartID(cartId);
        request.setAttribute("items", cartItems);
        request.setAttribute("discount", discount);
        request.setAttribute("city", city);
        request.setAttribute("district", district);
        request.setAttribute("ward", ward);
        request.setAttribute("phone", phone);
        request.setAttribute("note", note);
        request.setAttribute("address", address);
        request.setAttribute("name", userDAO.findById(cartId).getName());
        request.setAttribute("email", userDAO.findById(cartId).getEmail());
        request.setAttribute("time", LocalDateTime.now());
        int orderAddressId=orderAddressDAO.save(city, district, ward, address, phone, note, paymentMethod);
        int orderId=orderDAO.save(orderAddressId, cartId, 30000, discount, total, LocalDateTime.now(), cartItems.size(), LocalDateTime.now());
        for(CartItem x:cartItems){
            orderItemDAO.save(x.getProduct().getId(), orderId, "Processing", x.getQuantity());
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
        request.getRequestDispatcher("FE/checkoutSuccess/checkoutSuccess.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        processRequest(request, response);
        request.getRequestDispatcher("FE/checkoutSuccess/checkoutSuccess.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
