/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package api;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.CartDAO;
import entity.Cart;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DUC HAU
 */
@WebServlet(name = "addToCart", urlPatterns = {"/api/addtocart"})
public class addToCart extends HttpServlet {

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
      out.println("<title>Servlet addToCart</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet addToCart at " + request.getContextPath() + "</h1>");
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
    processRequest(request, response);
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
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
//    response.setContentType("application/json");
//    response.setContentType("text/plain");
//    PrintWriter out = response.getWriter();
//    out.print("da them vao gio hang");
//    out.flush();

//    BufferedReader reader = request.getReader();
//    StringBuilder requestBody = new StringBuilder();
//    String line;
//    while ((line = reader.readLine()) != null) {
//      requestBody.append(line);
//    }
//    String json = requestBody.toString();
    User user = (User) request.getSession().getAttribute("user");
    if (user == null) {
      //den login
    } else {
      // Trích xuất dữ liệu từ request body
      String id_product = "";
      String quantity = "";
      String requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));

      JsonElement jsonElement = JsonParser.parseString(requestBody);
      if (jsonElement.isJsonObject()) {
        JsonObject jsonObject = jsonElement.getAsJsonObject();

        if (jsonObject.has("id_product")) {
          id_product = jsonObject.get("id_product").getAsString();
        }
        if (jsonObject.has("quantity")) {
          quantity = jsonObject.get("quantity").getAsString();
        }
      }

      CartDAO cd = new CartDAO();
      try {
        System.out.println(user.getName());
        //
        Cart cart = cd.getCartByUser(user); //user get from session
        cd.addToCart(Integer.parseInt(id_product), cart.getId(), Integer.parseInt(quantity));
        //
      } catch (Exception ex) {
        Logger.getLogger(addToCart.class.getName()).log(Level.SEVERE, null, ex);
      }
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
