package model;

import java.util.*;
import java.sql.*;

import javax.servlet.http.HttpSession;

public class memberDB {
	public static Connection getConnectionDB() throws Exception{
		// Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");
		// Step 2: Define Connection URL
		String connURL ="jdbc:mysql://localhost/assignment_spit?user=root&password=1234";
		// Step 3 : Establish connection URL
		Connection conn = DriverManager.getConnection(connURL);
		return conn;
	}
	
	public boolean insertMember(member mem){
		try {
			
			Connection conn=getConnectionDB();

			String registersql="insert into member (name,contact,dob,address,email,password)" +
					" Values(?,?,?,?,?,?)";
			
			PreparedStatement pstmt=conn.prepareStatement(registersql);
			
			pstmt.setString(1,mem.getName());
			pstmt.setString(2, mem.getContact());
			pstmt.setString(3,mem.getDob());
			pstmt.setString(4,mem.getAddress());
			pstmt.setString(5,mem.getAddress());
			pstmt.setString(6,mem.getPassword());
			
			int count= pstmt.executeUpdate();
			
			if (count ==0){
				return false;
			}else{
				return true;
			}
			
		}catch (Exception e) {
			System.out.println(e);
			return false;
			//return null;
		}
	}
}
