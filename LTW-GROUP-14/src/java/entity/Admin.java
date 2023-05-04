package entity;

import java.time.LocalDate;

public class Admin {
	private String fullName;
	private String address;
	private LocalDate birthday;
	private int accountId;
	private String role;
	public Admin() {
	}
	
	public Admin(String fullName, String address, LocalDate birthday, int accountId, String role) {
		this.fullName = fullName;
		this.address = address;
		this.birthday = birthday;
		this.accountId = accountId;
		this.role = role;
	}

	@Override
	public String toString() {
		return "Admin [fullName=" + fullName + ", address=" + address + ", birthday=" + birthday + ", accountId="
				+ accountId + ", role=" + role + "]";
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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
	public LocalDate getBirthday() {
		return birthday;
	}
	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	
	
}
