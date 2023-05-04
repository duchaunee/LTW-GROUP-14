package entity;

import java.util.List;

public class Producer {
	private String name;
	private List<Shoes>shoesList;
	public Producer(String name, List<Shoes> shoesList) {
		this.name = name;
		this.shoesList = shoesList;
	}

	public Producer() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Shoes> getShoesList() {
		return shoesList;
	}

	public void setShoesList(List<Shoes> shoesList) {
		this.shoesList = shoesList;
	}

	@Override
	public String toString() {
		return "Producer [name=" + name + ", shoesList=" + shoesList + "]";
	}
	
}
