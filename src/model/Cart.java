package model;

public class Cart {
	private int productID;
	private String shortDesc;
	private int price;
	private String imagePath;
	
	private Cart(){
		super();
	}
	
	public Cart(int productID, String shortDesc, int price, String imagePath) {
		super();
		this.productID = productID;
		this.shortDesc = shortDesc;
		this.price = price;
		this.imagePath = imagePath;
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
	
	
}
