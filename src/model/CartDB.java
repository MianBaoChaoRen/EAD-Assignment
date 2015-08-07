package model;
import java.util.*;
import java.sql.*;

public class CartDB {
	public ArrayList<Cart> addToCart(String id, ArrayList<Cart> al){
		try{
			Connection conn=connDB.getConnectionDB();
			String sqlStr = "Select * from product where ProductID LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int productID = rs.getInt("ProductID");
				String shortDesc = rs.getString("ShortDesc");
				int price = rs.getInt("Price");
				String imagePath = rs.getString("ImagePath");
				String desc = rs.getString("Desc");
				
				Cart c = new Cart(productID, shortDesc, price, imagePath, desc, 0, 1, 0);
				al.add(c);
				
				
			}
			conn.close();
			return al;
		}catch(Exception e){
			System.out.println(e);
			return null;			
		}
		
	}
	

	public ArrayList<Cart> confirmCart(ArrayList<Cart> al, int quantity, int total, int i){
		Cart c = al.get(i);

		int productID = c.getProductID();
		String shortDesc = c.getShortDesc();
		int price = c.getPrice();
		String imagePath = c.getImagePath();
		String desc = c.getDesc();
			
		Cart d = new Cart(productID, shortDesc, price, imagePath, desc, 0, quantity, total);

		al.set(i, d);
		
		return al;
	}
}
