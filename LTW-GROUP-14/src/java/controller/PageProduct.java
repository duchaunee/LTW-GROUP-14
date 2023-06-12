package controller;

import dao.ProductDAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PageProductController", urlPatterns = {"/san-pham"})
public class PageProduct extends HttpServlet {

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
    request.getRequestDispatcher("FE/PageProduct/pageProduct.jsp").forward(request, response);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String category = request.getParameter("category"); //get param in url
    String brand = request.getParameter("brand"); //get param in url
    String order = request.getParameter("order"); //get param in url
    //
    String page_raw = request.getParameter("page"); //chi integer moi co "null", int khong co
    int page;
    //
    String from = request.getParameter("from"); //get param in url
    String to = request.getParameter("to"); //get param in url

    // solve field brand
    if (brand == null) {
      brand = "default";
    }

    // solve field order
    if (order == null) {
      order = "create_at desc"; //mac dinh la sap xep "Moi nhat"
    }

    if (page_raw == null) {
      page = 1; //mac dinh la trang thu 1
    } else {
      page = Integer.parseInt(page_raw);
    }

    // from, to check ben DAO
    ProductDAO pd = new ProductDAO();
    // lay ra 5 san pham moi nhat --> TAB LEFT "SAN PHAM"
    List<Product> listN = pd.getNewestProduct(category, 5);

    int numPerPage = 8;
    int size = pd.getSizeByFields(category, brand, from, to);
    int totalPage = size % numPerPage == 0 ? size / numPerPage : size / numPerPage + 1;

    // list nay tra ve danh sach phan trang tu mang goc
    List<Product> list = pd.paginationByPage(category,
                         brand,
                         from, to,
                         numPerPage,
                         page,
                         order);

    request.setAttribute("listN", listN); //danh sach sp moi nhat
    request.setAttribute("list", list); //danh sach sp
    request.setAttribute("size", size); //tong so sp
    request.setAttribute("brand", brand); //brand
    request.setAttribute("order", order); //order
    request.setAttribute("from", from); //from price
    request.setAttribute("to", to); //to price
    request.setAttribute("categoryUTF8", solveCategory(category)); //tieng viet -> de hien thi o title
    request.setAttribute("categoryQuery", category);
    request.setAttribute("totalPage", totalPage); //tong so trang de phan trang
    request.setAttribute("currentPage", page); //trang hien tai la trang nao
    request.getRequestDispatcher("pageProduct.jsp").forward(request, response);
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

  public String solveCategory(String category) {
    switch (category) {
      case "giay nam":
        return "Nam";
      case "giay nu":
        return "Nữ";
      case "giay tre em":
        return "Trẻ em";
      default:
        throw new AssertionError();
    }
  }
;

}
