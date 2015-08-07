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
	
	public boolean recordCart(String name, String contact, String email,  String address, String creditcard,
				String cardtype, String exmonth, String exyear, String cvc, ArrayList<Cart> Al){
		try{
			Connection conn = connDB.getConnectionDB();
			ArrayList<Cart> al = Al;
			int i = 0;
			for(Cart c: al){
				
				String sql = "insert into ordercart (memberID, mailingaddress, email, contact, creditcard, exmonth, exyear, cvc, name, cardtype, productID, quantity, totalprice)" + 
						" Values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
				PreparedStatement pstmt = conn.prepareStatement(sql);
		
				pstmt.setInt(1, i);
				pstmt.setString(2, address);
				pstmt.setString(3, email);
				pstmt.setString(4, contact);
				pstmt.setString(5, creditcard);
				pstmt.setString(6, exmonth);
				pstmt.setString(7, exyear);
				pstmt.setString(8, cvc);
				pstmt.setString(9, name);
				pstmt.setString(10, cardtype);
				pstmt.setInt(11, c.getProductID());
				pstmt.setInt(12, c.getQuantity());
				pstmt.setInt(13, c.getTotalPrice());
				
				int success = pstmt.executeUpdate();
				i++;
				if(success == 0){
					return false;
				}else
					return true;
				
			}
			conn.close();
			return false;
			
		}catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
