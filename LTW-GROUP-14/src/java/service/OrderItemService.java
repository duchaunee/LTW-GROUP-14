package service;

import dao.OrderItemDAO;
import entity.OrderItem;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class OrderItemService {
    private final OrderItemDAO orderItemDAO = new OrderItemDAO();
    
    public List<OrderItem> pagingOrderItem(HttpServletRequest request){
        Integer size = orderItemDAO.countOrderItem();
        Integer totalPage = size/5 + (size % 5 == 0 ? 0:1);
        request.setAttribute("totalPage", totalPage);
        String pageNumber = request.getParameter("page");
        if(pageNumber == null) pageNumber = "1";
        Integer currentPage = Integer.valueOf(pageNumber);
        return orderItemDAO.pagningOrderItem(currentPage);
    }
    
    public OrderItem findById(HttpServletRequest request){
        Integer id = Integer.valueOf(request.getParameter("id"));
        return orderItemDAO.findById(id);
    }
}
