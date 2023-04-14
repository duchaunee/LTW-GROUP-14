package entity;

public class Shoes {
    private Integer id;
    private String name;
    private Integer remaining;
    private Integer price;
    private String image;
    private String material;
    private String gender;
    private String description;

    public Shoes() {
    }

    public Shoes(Integer id, String name, Integer remaining, Integer price, String image, String material, String gender, String description) {
        this.id = id;
        this.name = name;
        this.remaining = remaining;
        this.price = price;
        this.image = image;
        this.material = material;
        this.gender = gender;
        this.description = description;
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

    public Integer getRemaining() {
        return remaining;
    }

    public void setRemaining(Integer remaining) {
        this.remaining = remaining;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Shoes{" + "id=" + id + ", name=" + name + ", remaining=" + remaining + ", price=" + price + ", material=" + material + ", gender=" + gender + ", description=" + description + '}';
    }
        
    
}
