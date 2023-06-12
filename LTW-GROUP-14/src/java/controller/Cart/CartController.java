/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Cart;

import dao.CartDAO;
import dao.CartItemDAO;
import dao.VoucherDAO;
import entity.Cart;
import entity.CartItem;
import entity.User;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CartService;
import utils.Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {
    private CartDAO cartDAO=new CartDAO();
    private CartItemDAO cartItemDAO=new CartItemDAO();
    private VoucherDAO voucherDAO=new VoucherDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User currentUser=Utils.getUserInSession(request);
        if(currentUser == null){
            Utils.setLastRequest(request, "/cart");
            response.sendRedirect("/login");
        }
        else if(!currentUser.getRole().equals("USER")){
            response.sendRedirect("/access-denied");
        }
        else{
            new CartService().showCart(request, currentUser);
            request.getRequestDispatcher("FE/Cart/cart.jsp").forward(request, response);
        }
    } 
    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
