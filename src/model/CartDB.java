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
	
	public int recordCart(String name, String contact, String email,  String address, String creditcard,
				String cardtype, String exmonth, String exyear, String cvc, ArrayList<Cart> Al){
		try{
			Connection conn = connDB.getConnectionDB();
			ArrayList<Cart> al = Al;
				int orderID = 0;
				int memberID = 0;
				String orderid = "select orderid from ordercart";
				
				String memberid = "select memberID from member where email = ? && contact = ?";
				
				String sql = "insert into ordercart (orderid, memberid, name, contact, email, address, creditcard, cardtype, exmonth, exyear, cvc, productID, quantity, totalprice)" + 
						" Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				
				
				PreparedStatement pstmt = conn.prepareStatement(orderid);
				PreparedStatement pstmt2 = conn.prepareStatement(sql);
				PreparedStatement pstmt3 = conn.prepareStatement(memberid);
				
				pstmt3.setString(1, email);
				pstmt3.setString(2, contact);
				
				ResultSet rs = pstmt.executeQuery();
				ResultSet rs2 = pstmt3.executeQuery();
				
				while(rs.next()){
					orderID = rs.getInt("orderid");
				}
				
					if(orderID == 0){
						orderID = 1;
					}else{
						orderID++;
					}
				
				while(rs2.next()){
					memberID = rs2.getInt("memberID");
				}
			
				pstmt2.setInt(1, orderID);	
				pstmt2.setInt(2, memberID);				
				pstmt2.setString(3, name);
				pstmt2.setString(4, contact);
				pstmt2.setString(5, email);
				pstmt2.setString(6, address);
				pstmt2.setString(7, creditcard);
				pstmt2.setString(8, cardtype);
				pstmt2.setString(9, exmonth);
				pstmt2.setString(10, exyear);
				pstmt2.setString(11, cvc);
				
				for(Cart c: al){
					pstmt2.setInt(12, c.getProductID());
					pstmt2.setInt(13, c.getQuantity());
					pstmt2.setInt(14, c.getTotalPrice());					
					pstmt2.executeUpdate();
				}	
				return orderID;

		}catch (Exception e) {
			System.out.println(e);
			return 0;
		}
	}
}
