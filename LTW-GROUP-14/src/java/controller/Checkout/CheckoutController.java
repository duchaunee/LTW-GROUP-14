/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Checkout;

import dao.CartDAO;
import dao.CartItemDAO;
import dao.OrderAddressDAO;
import dao.OrderDAO;
import dao.UserDAO;
import dao.VoucherDAO;
import entity.Cart;
import entity.CartItem;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {

    private CartItemDAO cartItemDAO=new CartItemDAO();
    private VoucherDAO voucherDAO=new VoucherDAO();
    private OrderDAO orderDAO=new OrderDAO();
    private OrderAddressDAO orderAddressDAO=new OrderAddressDAO();
    private UserDAO userDAO=new UserDAO();
    private CartDAO cartDAO=new CartDAO();

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        User currentUser=Utils.getUserInSession(request);
        if(currentUser == null){
            Utils.setLastRequest(request, "/cart");
            response.sendRedirect("/login");
        }
        else if(!currentUser.getRole().equals("USER")){
            response.sendRedirect("/access-denied");
        }
        else{
            Cart cart=cartDAO.findByUserId(currentUser.getId());
            List<CartItem>cartItemList=cartItemDAO.findByCartID(cart.getId());
            request.setAttribute("items", cartItemList);
            request.setAttribute("id", currentUser.getId());
            request.setAttribute("name", currentUser.getName());
            request.setAttribute("email", currentUser.getEmail());
            String code=request.getParameter("voucherCode");
            if(code==null){
                request.setAttribute("discount", 0);
            }
            else{
                request.setAttribute("discount", voucherDAO.findByCode(currentUser.getId(), code));
            }
            request.getRequestDispatcher("FE/Checkout/checkout.jsp").forward(request, response);
        }
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
