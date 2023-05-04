package entity;

import java.util.List;

public class Shoes {
    private String name;
    private String imgage;
    private int remaining;
    private int producerId;
    private int price;
    private List<Style>styles;
    private List<Type>types;
	@Override
	public String toString() {
		return "Shoes [name=" + name + ", imgage=" + imgage + ", remaining=" + remaining + ", producerId=" + producerId
				+ ", price=" + price + ", styles=" + styles + ", types=" + types + "]";
	}
	public Shoes() {
	}
	public Shoes(String name, String imgage, int remaining, int producerId, int price, List<Style> styles,
			List<Type> types) {
		this.name = name;
		this.imgage = imgage;
		this.remaining = remaining;
		this.producerId = producerId;
		this.price = price;
		this.styles = styles;
		this.types = types;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgage() {
		return imgage;
	}
	public void setImgage(String imgage) {
		this.imgage = imgage;
	}
	public int getRemaining() {
		return remaining;
	}
	public void setRemaining(int remaining) {
		this.remaining = remaining;
	}
	public int getProducerId() {
		return producerId;
	}
	public void setProducerId(int producerId) {
		this.producerId = producerId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public List<Style> getStyles() {
		return styles;
	}
	public void setStyles(List<Style> styles) {
		this.styles = styles;
	}
	public List<Type> getTypes() {
		return types;
	}
	public void setTypes(List<Type> types) {
		this.types = types;
	}
	
    
}
