package entity;

public class Voucher {
    private Integer id;
    private User user;
    private String name;
    private Integer value;

    public Voucher() {
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public Voucher(Integer id, User user, String name, Integer value) {
        this.id = id;
        this.user = user;
        this.name = name;
        this.value = value;
    }
    
    
}
