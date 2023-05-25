package service;

import dao.ProductDAO;
import entity.Product;
import java.util.List;

public class ProductService {
    public List<Product> findAll(){
        List<Product> productList = new ProductDAO().findAll();
        return productList;
    }
}
