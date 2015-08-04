package model;
import java.util.*;
import java.sql.*;

public class CartDB {
	public Connection getConnDB() throws Exception{
		//Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		//Step2: Define connection URL
		String connURL = "jdbc:mysql://localhost/onlineshop?user=root&password=fush29";

		//Step3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);
		return conn;
	}
	
	public ArrayList<Cart> addToCart(int id){
		try{
			Connection conn = getConnDB();
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
