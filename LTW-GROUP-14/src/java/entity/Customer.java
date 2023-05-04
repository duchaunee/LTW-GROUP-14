package entity;

import java.time.LocalDate;
import java.util.List;

public class Customer{
	private String fullName;
	private String address;
	private LocalDate birthday;
	private List<Order>orders;
	private int accountId;
	private String role;
	public Customer() {
	}
	public Customer(String fullName, String address, LocalDate birthday, List<Order> orders,
			String role, int accountId) {
		this.fullName = fullName;
		this.address = address;
		this.birthday = birthday;
		this.orders = orders;
		this.accountId = accountId;
		this.role = role;
	}
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}



	@Override
	public String toString() {
		return "Customer [fullName=" + fullName + ", address=" + address + ", birthday=" + birthday + ", orders="
				+ orders + ", accountId=" + accountId + ", role=" + role + "]";
	}

	

	
}
