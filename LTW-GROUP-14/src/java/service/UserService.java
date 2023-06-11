package service;

import dao.UserDAO;
import entity.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import utils.Utils;

public class UserService {
    private final UserDAO userDAO = new UserDAO();
    
    public User findByEmailAndPassword(HttpServletRequest request){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        password = Utils.encodeMD5(password);
        System.out.println(password);
        User user = userDAO.findByEmailAndPassword(email, password);
        return user;
    }
    
    public User findByEmail(String email){
        return userDAO.findByEmail(email);
    }
    
    public List<User> pagingUser(HttpServletRequest request){
        Integer size = userDAO.countUser();
        Integer totalPage = size/5 + (size % 5 == 0 ? 0:1);
        request.setAttribute("totalPage", totalPage);
        String pageNumber = request.getParameter("page");
        if(pageNumber == null) pageNumber = "1";
        Integer currentPage = Integer.valueOf(pageNumber);
        request.setAttribute("currentPage", currentPage);
        return userDAO.pagingUser(currentPage);
    }
    
    public void save(HttpServletRequest request){
        String email = request.getParameter("email");
        String password = Utils.encodeMD5(request.getParameter("password"));
        userDAO.save(email, password);
    }
    
    public void changePassword(HttpServletRequest request){
        String email = request.getParameter("email");
        String password = Utils.encodeMD5(request.getParameter("password"));
        userDAO.changePassword(email, password);
    }
}
