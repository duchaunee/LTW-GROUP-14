package entity;

import java.time.LocalDateTime;
import java.util.List;

public class User {
    private Integer id;
    private String name;
    private String email;
    private String password;
    private byte[] avatar;
    private String provider;
    private String role;
    private LocalDateTime createAt;
    //OneToMany
    private List<Order> orderList;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte [] avatar) {
        this.avatar = avatar;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public List<Order> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }
    

    public User(Integer id, String name, String email, String password, byte [] avatar, String provider, String role, LocalDateTime createAt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        this.provider = provider;
        this.role = role;
        this.createAt = createAt;
    }

    public User() {
    }
    

            
}
