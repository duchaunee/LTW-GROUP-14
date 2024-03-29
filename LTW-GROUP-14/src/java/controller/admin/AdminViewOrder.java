/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import entity.OrderItem;
import entity.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.OrderItemService;
import utils.Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminViewOrder", urlPatterns = {"/admin-vieworder"})
public class AdminViewOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User user = Utils.getUserInSession(request);
        if(user == null){
            Utils.setLastRequest(request, "/admin-vieworder");
            response.sendRedirect("/login");
        }
        else if(!user.getRole().equals("ADMIN")){
            response.sendRedirect("/access-denied");
        }
        else{
            List<OrderItem> orderItemList = new OrderItemService().pagingOrderItem(request);
            request.setAttribute("orderItemList", orderItemList);
            request.getSession().setAttribute("global", "Phan thi");
            request.getRequestDispatcher("FE/Admin/viewOrder/viewOrder.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        List<OrderItem> orderItemList = new OrderItemService().pagingOrderItem(request);
        request.setAttribute("orderItemList", orderItemList);
        request.getSession().setAttribute("global", "Phan thi");
        request.getRequestDispatcher("FE/Admin/viewOrder/viewOrder.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

}
