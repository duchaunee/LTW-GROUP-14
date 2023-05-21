package entity;

import java.time.LocalDateTime;

public class Review {
    private Integer id;
    private Product product;
    private OrderItem orderItem;
    private User user;
    private String rate;
    private String typeReview;
    private LocalDateTime createAt;

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

    public OrderItem getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItem orderItem) {
        this.orderItem = orderItem;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getTypeReview() {
        return typeReview;
    }

    public void setTypeReview(String typeReview) {
        this.typeReview = typeReview;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public Review(Integer id, Product product, OrderItem orderItem, User user, String rate, String typeReview, LocalDateTime createAt) {
        this.id = id;
        this.product = product;
        this.orderItem = orderItem;
        this.user = user;
        this.rate = rate;
        this.typeReview = typeReview;
        this.createAt = createAt;
    }

    public Review() {
    }

}
