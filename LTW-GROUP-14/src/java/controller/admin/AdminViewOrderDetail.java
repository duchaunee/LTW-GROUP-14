package controller.admin;

import entity.OrderItem;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.OrderItemService;

@WebServlet(name="AdminViewOrderDetail", urlPatterns={"/view-orderdetail"})
public class AdminViewOrderDetail extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            OrderItem orderItem = new OrderItemService().findById(request);
            String[] statusList = {"Đang xử lý", "Vận chuyển", "Đang giao", "Hoàn thành"};
            request.setAttribute("statusList", statusList);
            request.setAttribute("orderItem", orderItem);
        } catch (Exception ex) {
            Logger.getLogger(AdminViewOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("FE/Admin/orderDetail/orderDetail.jsp").forward(request, response);
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
        OrderItem orderItem = new OrderItemService().update(request);
        response.sendRedirect("/view-orderdetail?id=" + orderItem.getId());
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
