package authentication;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registrationServlet
 */
@WebServlet("/register")
public class registrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Cpassword = request.getParameter("Cpassword");
		String email = request.getParameter("email"); 
		String password = request.getParameter("password"); 
		RequestDispatcher dispatcher = null;
		Connection con = null;
			
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoesdatabase?useSSL=false","root","1234");
			PreparedStatement pst = con.prepareStatement("insert into user(name,email,password) value(?,?,?)");
			if(password == null ? Cpassword == null : password.equals(Cpassword)){
                        pst.setString(1, "user");
                            pst.setString(2, email);
                            pst.setString(3, password);
                        }
                            
   
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("login.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			}
			else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			
		}
		catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
