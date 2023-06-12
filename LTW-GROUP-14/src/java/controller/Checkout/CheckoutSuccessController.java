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
import entity.User;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CheckoutService;
import utils.Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckoutSuccessController", urlPatterns = {"/checkout-success"})
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
        User currentUser=Utils.getUserInSession(request);
        if(currentUser == null){
            Utils.setLastRequest(request, "/checkout-success");
            response.sendRedirect("/login");
        }
        else if(!currentUser.getRole().equals("USER")){
            response.sendRedirect("/access-denied");
        }
        else{
            new CheckoutService().save(request, currentUser);
            request.getRequestDispatcher("FE/checkoutSuccess/checkoutSuccess.jsp").forward(request, response);
        }
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
