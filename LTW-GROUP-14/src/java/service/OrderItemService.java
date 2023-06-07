package service;

import dao.OrderItemDAO;
import entity.OrderItem;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class OrderItemService {
    private OrderItemDAO orderItemDAO = new OrderItemDAO();
    
    public List<OrderItem> pagingOrderItem(HttpServletRequest request){
        String pageNumber = request.getParameter("page");
        if(pageNumber == null) pageNumber = "1";
        Integer page = Integer.valueOf(pageNumber);
        return orderItemDAO.pagningOrderItem(page);
    }
}
