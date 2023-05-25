package controller;

import dao.ImageProductDAO;
import entity.ImageProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="productImage", urlPatterns={"/productImage"})
public class productImage extends HttpServlet {
   
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
        int image_id = Integer.parseInt(request.getParameter("imgId"));
        int number = Integer.parseInt(request.getParameter("number"));
        try {
            ImageProduct imageProduct = new ImageProductDAO().findById(image_id);
            if (imageProduct != null){
                if (number == 0 && imageProduct.getImg()!= null) {
                response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
                response.getOutputStream().write(imageProduct.getImg());
                }
                if (number == 1 && imageProduct.getImgPreview1()!= null) {
                response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
                response.getOutputStream().write(imageProduct.getImgPreview1());
                }
                if (number == 2 && imageProduct.getImgPreview2()!= null) {
                response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
                response.getOutputStream().write(imageProduct.getImgPreview2());
                }
                if (number == 3 && imageProduct.getImgPreview3()!= null) {
                response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
                response.getOutputStream().write(imageProduct.getImgPreview3());
                }
                if (number == 4 && imageProduct.getImgPreview1()!= null) {
                response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
                response.getOutputStream().write(imageProduct.getImgPreview4());
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(productImage.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.getOutputStream().close();
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
