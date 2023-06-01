package service;

import dao.ProductDAO;
import entity.Product;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public class ProductService {
    
    private final ProductDAO productDAO = new ProductDAO();
    
    public List<Product> findAll(){
        List<Product> productList = productDAO.findAll();
        return productList;
    }
    
    public void save(HttpServletRequest request, Integer image_id){
        productDAO.save(request, image_id);
    }
    
    public void update(HttpServletRequest request){
        productDAO.update(request);
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
