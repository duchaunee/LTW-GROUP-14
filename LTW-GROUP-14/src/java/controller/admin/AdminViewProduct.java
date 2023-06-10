package controller.admin;

import dao.ProductDAO;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="AdminShowProduct", urlPatterns={"/admin-viewproduct"})
public class AdminViewProduct extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();
   
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
        int size = productDAO.countProduct();
        int page = size/3 + (size%3 == 0 ? 0:1);
        String indexPage = request.getParameter("index");
        if(indexPage == null) indexPage="1";
        int index = Integer.parseInt(indexPage);
        List<Product>productList = productDAO.pagningProduct(index);
        request.setAttribute("productList", productList);
        request.setAttribute("page", page);
        request.setAttribute("size", size);
        request.setAttribute("current", index);
        request.getRequestDispatcher("FE/Admin/viewProduct/viewProduct.jsp").forward(request, response);
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
