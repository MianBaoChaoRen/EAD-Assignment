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
	
	public int verifyMember(member mem){
		try{
			Connection conn=connDB.getConnectionDB();
			
			String verifyadminsql="select * from member where email = ? and password = ? and admin=1";
			String verifybansql="select * from member where email = ? and password = ? and ban=1 ";
			
			PreparedStatement verifyadminpstmt=conn.prepareStatement(verifyadminsql);
			PreparedStatement verifybanpstmt=conn.prepareStatement(verifybansql);
			
			verifyadminpstmt.setString(1, mem.getEmail());
			verifyadminpstmt.setString(2, mem.getPassword());
			verifybanpstmt.setString(1, mem.getEmail());
			verifybanpstmt.setString(2, mem.getPassword());
			
			ResultSet verifyadminrs= verifyadminpstmt.executeQuery();
			ResultSet verifybanrs= verifybanpstmt.executeQuery();
			
			if (verifybanrs.next() ) {
   					return 1;
   					
   			} else if (verifyadminrs.next()){
   					return 2;
   			} else {
   					return 3;
   			}
			
		} catch (Exception e){
			System.out.println(e);
			return 1;
		}
		
		
		
	}
}









