package entity;

public class OrderLine {
	private int quantity;
	private int amount;
	private int orderId;
	private int shoesId;
	public OrderLine() {
	}
	public OrderLine(int quantity, int amount, int orderId, int shoesId) {
		this.quantity = quantity;
		this.amount = amount;
		this.orderId = orderId;
		this.shoesId = shoesId;
	}
	@Override
	public String toString() {
		return "OrderLine [quantity=" + quantity + ", amount=" + amount + ", orderId=" + orderId + ", shoesId="
				+ shoesId + "]";
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getShoesId() {
		return shoesId;
	}
	public void setShoesId(int shoesId) {
		this.shoesId = shoesId;
	}
	
}
