package service;

import dao.OrderDAO;
import entity.Order;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class OrderService {
    private final OrderDAO orderDAO = new OrderDAO();
    
    public List<Order> pagingOrder(HttpServletRequest request){
        String pageNumber = request.getParameter("page");
        if(pageNumber == null) pageNumber = "1";
        Integer page = Integer.valueOf(pageNumber);
        return orderDAO.pagingOrder(page);
    }
}
