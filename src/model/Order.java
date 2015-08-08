package model;

public class Order {
	private int index;
	private int memberID;
	private int OrderNum;
	private String orderdate;
	private String name;
	private String contact;
	private String email;
	private String address;
	private String creditcard;
	private String cardtype;
	private String exmonth;
	private String exyear;
	private String cvc;
	private int productID;
	private int totalprice;
	private int quantity;
	private int amount;
	
	
	
	
	
	
	
	
	public Order(int productID, int amount) {
		super();
		this.productID = productID;
		this.amount = amount;
	}
	public Order(int index, int memberID, int orderNum, String orderdate,
			String name, String contact, String email, String address,
			String creditcard, String cardtype, String exmonth, String exyear,
			String cvc, int productID, int totalprice, int quantity) {
		super();
		this.index = index;
		this.memberID = memberID;
		OrderNum = orderNum;
		this.orderdate = orderdate;
		this.name = name;
		this.contact = contact;
		this.email = email;
		this.address = address;
		this.creditcard = creditcard;
		this.cardtype = cardtype;
		this.exmonth = exmonth;
		this.exyear = exyear;
		this.cvc = cvc;
		this.productID = productID;
		this.totalprice = totalprice;
		this.quantity = quantity;
	}
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public int getOrderNum() {
		return OrderNum;
	}
	public void setOrderNum(int orderNum) {
		OrderNum = orderNum;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCreditcard() {
		return creditcard;
	}
	public void setCreditcard(String creditcard) {
		this.creditcard = creditcard;
	}
	public String getCardtype() {
		return cardtype;
	}
	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	public String getExmonth() {
		return exmonth;
	}
	public void setExmonth(String exmonth) {
		this.exmonth = exmonth;
	}
	public String getExyear() {
		return exyear;
	}
	public void setExyear(String exyear) {
		this.exyear = exyear;
	}
	public String getCvc() {
		return cvc;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
