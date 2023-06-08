package service;

import dao.UserDAO;
import entity.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class UserService {
    private final UserDAO userDAO = new UserDAO();
    
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
}
