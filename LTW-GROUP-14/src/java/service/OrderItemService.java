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
        request.setAttribute("totalProduct", size);
        String pageNumber = request.getParameter("page");
        if(pageNumber == null) {
            pageNumber = "1";
            request.getSession().removeAttribute("filterBy");
            request.getSession().removeAttribute("sortBy");
        }
        Integer currentPage = Integer.valueOf(pageNumber);
        
        String filterBy = request.getParameter("filterBy");
        String sortBy = request.getParameter("sortBy");
        if(filterBy == null) 
            filterBy = (String)request.getSession().getAttribute("filterBy");
        if(sortBy == null) 
            sortBy = (String)request.getSession().getAttribute("sortBy");
        System.out.println(filterBy + sortBy);
        if(filterBy != null || sortBy != null){
            request.getSession().setAttribute("filterBy", filterBy);    
            request.getSession().setAttribute("sortBy", sortBy);
            return orderItemDAO.pagningOrderItem(filterBy, sortBy, currentPage);
        }
        return orderItemDAO.pagningOrderItem(currentPage);
    }
    
    public OrderItem findById(HttpServletRequest request){
        Integer id = Integer.valueOf(request.getParameter("id"));
        return orderItemDAO.findById(id);
    }
    
    public OrderItem update(HttpServletRequest request){
        Integer id = Integer.valueOf(request.getParameter("id"));
        String status = request.getParameter("statusActive");
        
        OrderItem orderItem = orderItemDAO.findById(id);
        orderItem.setOrderStatus(status);
        
        orderItemDAO.update(orderItem);
        return orderItem;
    }
    
}
