package entity;

import utils.Utils;

public class OrderItem {
    private Integer id;
    private Order order;
    private Product product;
    private String orderStatus;
    private Integer quantity;

    public OrderItem() {
    }

    public OrderItem(Integer id, Order order, Product product, String orderStatus, Integer quantity) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.orderStatus = orderStatus;
        this.quantity = quantity;
    }
    
    public String displayAmount(){
        Integer amount = this.getProduct().getPrice() * this.quantity;
        return Utils.formatCurrency(amount);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
    
}
