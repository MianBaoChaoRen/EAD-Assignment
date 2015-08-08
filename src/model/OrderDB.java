package model;
import java.util.*;
import java.sql.*;


public class OrderDB {

	public ArrayList<Order> top10(String firstdate, String seconddate){
		try{
			Connection conn=connDB.getConnectionDB();
			
			ArrayList<Order> al = new ArrayList<Order>();
			
			String sqlstr = "select `index`,`memberID`, `orderNum`,`orderdate`,`name`,`contact`,`email`,`address`,`creditcard`,`cardtype`,`exmonth`,`exyear`,`cvc`,`productID`,`totalprice`,`quantity`, COUNT(`orderNum`) AS `top` from `order` where orderdate between ? and ? group by `productID` ORDER by 16 DESC LIMIT 10";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlstr);
			
			pstmt.setString(1, firstdate);
			pstmt.setString(2, seconddate);
			
			ResultSet rs=pstmt.executeQuery();
			
			while (rs.next()){
				int productid = rs.getInt("productID");
				int amount = rs.getInt("top");
				
				Order o = new Order(productid, amount);
				
				al.add(o);
			}
			
			return al;
		}catch (Exception e){
			System.out.println(e);
			return null;
		}
	}
	
	public String top10productname(int productid){
		try{
			Connection conn=connDB.getConnectionDB();
			
			String sqlstr = "select * from product where ProductID =?";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlstr);
			
			pstmt.setInt(1, productid);
			
			ResultSet rs=pstmt.executeQuery();
			String shortdesc="";
			while (rs.next()){
				shortdesc = rs.getString("ShortDesc");
				System.out.println(shortdesc);
			}
			
			return shortdesc;
		}catch (Exception e){
			System.out.println(e);
			return null;
		}
	}
}
