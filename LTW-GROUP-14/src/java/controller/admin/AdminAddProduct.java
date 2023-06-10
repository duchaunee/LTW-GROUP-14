package controller.admin;
import dao.ImageProductDAO;
import entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ProductService;
import utils.Utils;

@WebServlet("/admin-addproduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
       maxFileSize = 1024 * 1024 * 10, // 10MB
       maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminAddProduct extends HttpServlet {
   private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = Utils.getUserInSession(request);
        if(user == null){
            Utils.setLastRequest(request, "/admin-addproduct");
            response.sendRedirect("/login");
        }
        else if(!user.getRole().equals("ADMIN")){
            response.sendRedirect("/access-denied");
        }
        else{
            Utils.removeLastRequest(request);
            request.getRequestDispatcher("FE/Admin/addProduct/addProduct.jsp").forward(request, response);
        }

    }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Integer image_id = new ImageProductDAO().save(request);
        new ProductService().save(request, image_id);
        response.sendRedirect("/admin-viewproduct");
    }
}
