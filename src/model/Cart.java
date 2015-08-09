package model;

public class Cart {
	private int productID;
	private String shortDesc;
	private int price;
	private String imagePath;
	private String desc;
	private int count;
	private int quantity;
	private int totalPrice;
	
	private Cart(){
		super();
	}
	
	
	
	
	public int getTotalPrice() {
		return totalPrice;
	}




	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}




	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getShortDesc() {
		return shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}




	public Cart(int productID, String shortDesc, int price, String imagePath,
			String desc, int count, int quantity, int totalPrice) {
		super();
		this.productID = productID;
		this.shortDesc = shortDesc;
		this.price = price;
		this.imagePath = imagePath;
		this.desc = desc;
		this.count = count;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

	
	
	
}