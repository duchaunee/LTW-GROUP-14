package entity;

import java.time.LocalDateTime;
import org.apache.tomcat.jni.Local;

public class CartItem {
    private Integer id;
    private Product product;
    private Cart cart;
    private Integer quantity;
    private LocalDateTime createAt;

    public CartItem() {
    }

    public CartItem(Integer id, Product product, Cart cart, Integer quantity, LocalDateTime createAt) {
        this.id = id;
        this.product = product;
        this.cart = cart;
        this.quantity = quantity;
        this.createAt = createAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }
    
}
