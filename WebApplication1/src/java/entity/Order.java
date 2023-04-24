package entity;

import java.util.List;

public class Order {
	private int amount;
	private int customerId;
	private List<OrderLine>orderLines;
	public Order() {
	}
	public Order(int amount, int customerId, List<OrderLine> orderLines) {
		this.amount = amount;
		this.customerId = customerId;
		this.orderLines = orderLines;
	}
	@Override
	public String toString() {
		return "Order [amount=" + amount + ", customerId=" + customerId + ", orderLines=" + orderLines + "]";
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public List<OrderLine> getOrderLines() {
		return orderLines;
	}
	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}
	
}
