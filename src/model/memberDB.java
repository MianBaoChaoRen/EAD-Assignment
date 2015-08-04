package model;

import java.util.*;
import java.sql.*;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class memberDB {
	
	
	public boolean insertMember(member mem){
		try {
			
			Connection conn=connDB.getConnectionDB();

			String registersql="insert into member (name,contact,dob,address,email,password)" +
					" Values(?,?,?,?,?,?)";
			
			PreparedStatement pstmt=conn.prepareStatement(registersql);
			
			pstmt.setString(1,mem.getName());
			pstmt.setString(2, mem.getContact());
			pstmt.setString(3,mem.getDob());
			pstmt.setString(4,mem.getAddress());
			pstmt.setString(5,mem.getEmail());
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
	
	public boolean verifyMember(member mem){
		try{
			Connection conn=connDB.getConnectionDB();
			
			String verifyadminsql="select * from admin where userid = ? and password = ? and ban=0";
			String verifybanadminsql="select * from admin where userid = ? and password = ? and ban=1 ";
			
			PreparedStatement verifyadminpstmt=conn.prepareStatement(verifyadminsql);
			PreparedStatement verifybanadminpstmt=conn.prepareStatement(verifybanadminsql);
			
			verifyadminpstmt.setString(1, userid);
			verifyadminpstmt.setString(2, password);
			verifybanadminpstmt.setString(1, userid);
			verifybanadminpstmt.setString(2, password);
			
			ResultSet verifyadminrs= verifyadminpstmt.executeQuery();
			ResultSet verifybanadminrs= verifybanadminpstmt.executeQuery();
			
			if (verifybanadminrs.next() ) {
   					out.println("Your Account has been suspended. Please Contact the Head Admin to verify.");
   			} else if (verifyadminrs.next()){
   					response.sendRedirect("../admin/dashboard.jsp");
   				} else {
   			
   				response.sendRedirect("login.html");
   				}
			
		} catch (Exception e){
			System.out.println(e);
			return false;
		}
		
		
		
	}
}









