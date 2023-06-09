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
    
    public Integer getAmount(){
        return this.getProduct().getPrice() * this.quantity;
    }
    
    public String displayAmount(){
        
        return Utils.formatCurrency(Long.valueOf(getAmount()));
    }
    
    public Long getDiscount(){
        Integer discountPercent = getOrder().getDiscount();
        Long discount = Math.round(getProduct().getPrice() * getQuantity() * discountPercent / 100.0);
        return discount;
    }
    
    public String displayDiscount(){
        return Utils.formatCurrency(this.getDiscount());
    }
    
    public String displayTotal(){
        Long total = getAmount() + getDiscount() + getOrder().getDeliveryfee();
        return Utils.formatCurrency(total);
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
