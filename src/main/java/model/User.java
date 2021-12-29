package model;

import java.sql.Date;

public class User {
	private int accountId;
	private String email;
	private String avatar;
	private String password;
	private int admin;
	private String phoneNumber;
	private int gender;
	private String lastName;
	private String firstName;
	private String address;
	private Date registerdate;
	private int status;

	public User() {
		super();
	}

	public User(String email, String avatar, String password, int admin, String phoneNumber,
			String lastName, String firstName, String address, Date registerdate, int status) {
		super();
		this.email = email;
		this.avatar = avatar;
		this.password = password;
		this.admin = admin;
		this.phoneNumber = phoneNumber;
		this.lastName = lastName;
		this.firstName = firstName;
		this.address = address;
		this.registerdate = registerdate;
		this.status = status;
	}
	
	public User(int accountId, String email, String avatar, String password, int admin, String phoneNumber, int gender,
			String lastName, String firstName, String address, Date registerdate, int status) {
		super();
		this.accountId = accountId;
		this.email = email;
		this.avatar = avatar;
		this.password = password;
		this.admin = admin;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.lastName = lastName;
		this.firstName = firstName;
		this.address = address;
		this.registerdate = registerdate;
		this.status = status;
	}
	

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [accountId=" + accountId + ", email=" + email + ", avatar=" + avatar + ", password=" + password
				+ ", admin=" + admin + ", phoneNumber=" + phoneNumber + ", gender=" + gender + ", lastName=" + lastName
				+ ", firstName=" + firstName + ", address=" + address + ", registerdate=" + registerdate + "]";
	}

}
