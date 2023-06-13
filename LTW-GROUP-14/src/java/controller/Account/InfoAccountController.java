/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Account;

import dao.UserDAO;
import dao.VoucherDAO;
import entity.User;
import entity.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "InfoAccountController", urlPatterns = {"/profile"})
public class InfoAccountController extends HttpServlet {
    private VoucherDAO voucherDAO=new VoucherDAO();
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InfoAccountController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InfoAccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        User currentUser=Utils.getUserInSession(request);
        if(currentUser == null){
            Utils.setLastRequest(request, "/profile");
            response.sendRedirect("/login");
        }
        else if(!currentUser.getRole().equals("USER")){
            response.sendRedirect("/access-denied");
        }
        else{
            List<Voucher>list=voucherDAO.findByUserId(currentUser.getId());
            request.setAttribute("items", list);
            request.setAttribute("provider", currentUser.getProvider());
            request.setAttribute("user", currentUser);
            String name=request.getParameter("name");
            String avatar=request.getParameter("imgAvatar");
            String password=request.getParameter("password");
            String newPassword=request.getParameter("newPassword");
            String newPassword2=request.getParameter("newPassword2");
            if(name==null&&newPassword==null&&avatar==null&&password==null&&newPassword2==null){
                request.getRequestDispatcher("FE/infoAccount/infoAccount.jsp").forward(request, response);
            }
            if(password!=null&&!Utils.encodeMD5(password).equals(currentUser.getPassword())){
                System.err.println(password);
            }
            else if(!newPassword.equals(newPassword2)){
                System.err.println(newPassword);
            }
            else{
                userDAO.update(currentUser.getId(), name, Utils.encodeMD5(newPassword), avatar);
            }
            request.getRequestDispatcher("FE/infoAccount/infoAccount.jsp").forward(request, response);
        }
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
        User currentUser=Utils.getUserInSession(request);
        if(currentUser == null){
            Utils.setLastRequest(request, "/profile");
            response.sendRedirect("/login");
        }
        else if(!currentUser.getRole().equals("USER")){
            response.sendRedirect("/access-denied");
        }
        else{
            List<Voucher>list=voucherDAO.findByUserId(currentUser.getId());
            request.setAttribute("items", list);
            request.setAttribute("provider", currentUser.getProvider());
            request.setAttribute("user", currentUser);
            String name=request.getParameter("name");
            String avatar=request.getParameter("imgAvatar");
            String password=request.getParameter("password");
            String newPassword=request.getParameter("newPassword");
            String newPassword2=request.getParameter("newPassword2");
            if(name==null&&newPassword==null&&avatar==null&&password==null&&newPassword2==null){
                request.getRequestDispatcher("FE/infoAccount/infoAccount.jsp").forward(request, response);
            }
            if(password!=null&&!Utils.encodeMD5(password).equals(currentUser.getPassword())){
                System.err.println(password);

            }
            else if(!newPassword.equals(newPassword2)){
                System.err.println(newPassword);
            }
            else{
                userDAO.update(currentUser.getId(), name, Utils.encodeMD5(newPassword), avatar);
            }
            request.getRequestDispatcher("FE/infoAccount/infoAccount.jsp").forward(request, response);
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
