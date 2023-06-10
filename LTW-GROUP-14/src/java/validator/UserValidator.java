package validator;

import com.sun.net.httpserver.HttpServer;
import dao.UserDAO;
import entity.User;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import service.UserService;

public class UserValidator {
    private final UserService userService = new UserService();
    
    public Map<String, String> validate(HttpServletRequest request){
        Map<String, String> error = new HashMap<>();
        String email = request.getParameter("email");
        User user = userService.findByEmail(email);
        if(user != null) error.put("email", "Email đã được sử dụng");
        return error;
    }
    
}
