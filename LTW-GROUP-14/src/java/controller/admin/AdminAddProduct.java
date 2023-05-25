package controller.admin;
import dao.ImageProductDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/admin-addproduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
       maxFileSize = 1024 * 1024 * 10, // 10MB
       maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminAddProduct extends HttpServlet {
   private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("FE/Admin/addProduct/addProduct.jsp").forward(request, response);

    }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       try {
           InputStream[] image = new InputStream[5];
           int n = 0;
           for (Part part : request.getParts()) {
               String fileName = extractFileName(part);
               if (fileName != null && fileName.length() > 0) {
                   image[n] = part.getInputStream();
                   n += 1;
               }
           }
           new ImageProductDAO().save(image);
           new ProductDAO().save(request);
            response.sendRedirect("/admin-viewproduct");
       } catch (IOException | ServletException e) {
           System.out.println(e);
        }
   }

   private String extractFileName(Part part) {
       String contentDisp = part.getHeader("content-disposition");
       String[] items = contentDisp.split(";");
       for (String s : items) {
           if (s.trim().startsWith("filename")) {
               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
               clientFileName = clientFileName.replace("\\", "/");
               int i = clientFileName.lastIndexOf('/');
               return clientFileName.substring(i + 1);
           }
       }
       return null;
   }


}
