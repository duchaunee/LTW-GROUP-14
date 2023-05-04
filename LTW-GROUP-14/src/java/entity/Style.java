package entity;

import java.util.List;

public class Style {
	private List<Shoes> shoes;
	private String name;
	public List<Shoes> getShoes() {
		return shoes;
	}
	public void setShoes(List<Shoes> shoes) {
		this.shoes = shoes;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Style() {
	}
	public Style(List<Shoes> shoes, String name) {
		this.shoes = shoes;
		this.name = name;
	}
	@Override
	public String toString() {
		return "Style [shoes=" + shoes + ", name=" + name + "]";
	}
}
