package model;
import java.util.*;
import java.sql.*;

public class CartDB {
	public ArrayList<Cart> addToCart(int id){
		try{
			Connection conn=connDB.getConnectionDB();
			String sqlStr = "Select * from product where ProductID LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, id);
						
			ArrayList<Cart> al = new ArrayList<Cart>();
			ResultSet rs = pstmt.executeQuery(); 
			
			while(rs.next()){
				int productID = rs.getInt("ProductID");
				String shortDesc = rs.getString("ShortDesc");
				int price = rs.getInt("Price");
				String imagePath = rs.getString("ImagePath");
				Cart c = new Cart(productID, shortDesc, price, imagePath);
				
				al.add(c);
			}
			
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
		return null;
	}
}
