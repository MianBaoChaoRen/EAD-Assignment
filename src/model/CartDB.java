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
	
	public ArrayList<Cart> deleteFromCart(int itemID, ArrayList<Cart> al){
		al.remove(itemID);
		return al;
	}
	
	public ArrayList<Cart> confirmCart(ArrayList<Cart> al, int quantity, int total){
		
		return al;
	}
	
}
