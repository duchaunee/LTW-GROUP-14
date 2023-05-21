package entity;

import java.time.LocalDateTime;

public class Cart {
    private Integer id;
    private User user;
    private LocalDateTime creatAt;

    public Cart() {
    }

    public Cart(Integer id, User user, LocalDateTime creatAt) {
        this.id = id;
        this.user = user;
        this.creatAt = creatAt;
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

    public LocalDateTime getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(LocalDateTime creatAt) {
        this.creatAt = creatAt;
    }
    
}
