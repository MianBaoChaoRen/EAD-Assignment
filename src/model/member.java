package model;

public class member {
	private int memberID;
	private String name;
	private String contact;
	private String dob;
	private String address;
	private String email;
	private String password;
	
	public member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public member(int memberID, String name, String contact, String dob,
			String address, String email, String password) {
		super();
		this.memberID = memberID;
		this.name = name;
		this.contact = contact;
		this.dob = dob;
		this.address = address;
		this.email = email;
		this.password = password;
	}
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
