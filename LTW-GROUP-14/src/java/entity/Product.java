package entity;

import dao.OrderItemDAO;
import java.time.LocalDateTime;
import java.util.List;

public class Product {
    private Integer id;
    private String name;
    private Integer price;
    private Integer inventory;
    private String category;
    private String brand;
    private String description;
    private LocalDateTime createAt;
    private LocalDateTime updateAt;
    private Integer image_id;

    public Integer countNumberOfOrderDetail(){
        List<OrderItem> orderItemList = new OrderItemDAO().findByProduct(this.id);
        return orderItemList.size();
    }
    
    public Integer getImage_id() {
        return image_id;
    }

    public void setImage_id(Integer image_id) {
        this.image_id = image_id;
    }

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

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public LocalDateTime getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(LocalDateTime updateAt) {
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", inventory=" + inventory + ", category=" + category + ", brand=" + brand + ", description=" + description + ", createAt=" + createAt + ", updateAt=" + updateAt + '}';
    }
    
    public Product(Integer id, String name, Integer price, Integer inventory, String category, String brand, String description, LocalDateTime createAt, LocalDateTime updateAt) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.inventory = inventory;
        this.category = category;
        this.brand = brand;
        this.description = description;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public Product() {
    }
    
}
