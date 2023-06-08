/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Checkout;

import dao.CartItemDAO;
import dao.OrderAddressDAO;
import dao.OrderDAO;
import dao.UserDAO;
import dao.VoucherDAO;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private CartItemDAO cartItemDAO=new CartItemDAO();
    private VoucherDAO voucherDAO=new VoucherDAO();
    private OrderDAO orderDAO=new OrderDAO();
    private OrderAddressDAO orderAddressDAO=new OrderAddressDAO();
    private UserDAO userDAO=new UserDAO();

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
        int cartId=2;
        User user=userDAO.findById(cartId);
        List<CartItem>cartItems=cartItemDAO.findByCartID(cartId);
        request.setAttribute("id", cartId);
        request.setAttribute("items", cartItems);
        request.setAttribute("name", user.getName());
        request.setAttribute("email", user.getEmail());
        String code=request.getParameter("voucherCode");
        if(code==null){ 
            request.setAttribute("discount", 0);
        }
        else{
            request.setAttribute("discount", voucherDAO.findByCode(cartId ,code));
        }
        request.getRequestDispatcher("FE/Checkout/checkout.jsp").forward(request, response);
        
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
        int cartId=2;
        User user=userDAO.findById(cartId);
        List<CartItem>cartItems=cartItemDAO.findByCartID(cartId);
        request.setAttribute("items", cartItems);
        request.setAttribute("id", cartId);
        request.setAttribute("name", user.getName());
        request.setAttribute("email", user.getEmail());
        String code=request.getParameter("voucherCode");
        if(code==null){
            request.setAttribute("discount", 0);
        }
        else{
            request.setAttribute("discount", voucherDAO.findByCode(cartId, code));
        }
        request.getRequestDispatcher("FE/Checkout/checkout.jsp").forward(request, response);
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
        int cartId=2;
        User user=userDAO.findById(cartId);
        List<CartItem>cartItems=cartItemDAO.findByCartID(cartId);
        request.setAttribute("id", cartId);
        request.setAttribute("items", cartItems);
        request.setAttribute("name", user.getName());
        request.setAttribute("email", user.getEmail());
        String code=request.getParameter("voucherCode");
        if(code==null){ 
            request.setAttribute("discount", 0);
        }
        else{
            request.setAttribute("discount", voucherDAO.findByCode(cartId ,code));
        }
        request.getRequestDispatcher("FE/Checkout/checkout.jsp").forward(request, response);
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
