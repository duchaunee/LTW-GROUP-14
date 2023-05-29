package service;

import dao.OrderItemDAO;
import dao.ProductDAO;
import entity.OrderItem;
import entity.Product;
import java.util.List;

public class ProductService {
    
    private final ProductDAO productDAO = new ProductDAO();
    
    public List<Product> findAll(){
        List<Product> productList = productDAO.findAll();
        return productList;
    }
    
    public void deleteById(Integer id){
        productDAO.deleteById(id);
    }
    
    public String validate(Product product) throws Exception{
        Product oldProduct = productDAO.findByName(product.getName());
        if(oldProduct != null){
            return "Tên sản phẩm đã được sử dụng";
        }
        return null;
    }
}
