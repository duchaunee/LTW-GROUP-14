package entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Order {
    private Integer id;
    private User user;
    private OrderAddress orderAddress;
    private Integer deliveryfee;
    private Integer discount;
    private Integer totalPayment;
    private LocalDateTime orderTime;
    private Integer amount;
    private String phoneNumber;
    private LocalDateTime createAt;
    private List<OrderItem> orderItemList = new ArrayList<>();
    
    public String displayOrderTime(){
        return this.orderTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public Order() {
    }

    public Order(Integer id, User user, OrderAddress orderAddress, Integer deliveryfee, Integer discount, Integer totalPayment, LocalDateTime orderTime, Integer amount, LocalDateTime createAt) {
        this.id = id;
        this.user = user;
        this.orderAddress = orderAddress;
        this.deliveryfee = deliveryfee;
        this.discount = discount;
        this.totalPayment = totalPayment;
        this.orderTime = orderTime;
        this.amount = amount;
        this.createAt = createAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public OrderAddress getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(OrderAddress orderAddress) {
        this.orderAddress = orderAddress;
    }

    public Integer getDeliveryfee() {
        return deliveryfee;
    }

    public void setDeliveryfee(Integer deliveryfee) {
        this.deliveryfee = deliveryfee;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getTotalPayment() {
        return totalPayment;
    }

    public void setTotalPayment(Integer totalPayment) {
        this.totalPayment = totalPayment;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }
    
}
