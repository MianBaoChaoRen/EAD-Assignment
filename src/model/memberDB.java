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
			
			String verifymembersql="select * from member where email=? and password=?";
			String verifyadminsql="select * from member where email = ? and password = ? and admin=1";
			String verifybansql="select * from member where email = ? and password = ? and ban=1 ";
			
			PreparedStatement verifymemberpstmt=conn.prepareStatement(verifymembersql);
			PreparedStatement verifyadminpstmt=conn.prepareStatement(verifyadminsql);
			PreparedStatement verifybanpstmt=conn.prepareStatement(verifybansql);
			
			verifymemberpstmt.setString(1, mem.getEmail());
			verifymemberpstmt.setString(2, mem.getPassword());
			verifyadminpstmt.setString(1, mem.getEmail());
			verifyadminpstmt.setString(2, mem.getPassword());
			verifybanpstmt.setString(1, mem.getEmail());
			verifybanpstmt.setString(2, mem.getPassword());
			
			ResultSet verifymemberrs= verifymemberpstmt.executeQuery();
			ResultSet verifyadminrs= verifyadminpstmt.executeQuery();
			ResultSet verifybanrs= verifybanpstmt.executeQuery();
			
			if (verifyadminrs.next() ) {
   				return 1;
   			} else if (verifymemberrs.next()){
   				return 2;
   			} else if (verifybanrs.next()){
   				return 3;
   			} else {
   				return 4;
   			}
   				
			
		} catch (Exception e){
			System.out.println(e);
			return 4;
		}
		
		
		
	}
	
	public boolean updatemember(member mem){
		try{
			Connection conn=connDB.getConnectionDB();
   			
			String updatemembersql="update member SET name=?, contact=?, address=?, password=?where memberID=?";
			
			PreparedStatement updatememberpstmt=conn.prepareStatement(updatemembersql);
   			
   			updatememberpstmt.setString(1, mem.getName());
   			updatememberpstmt.setString(2, mem.getContact());
   			updatememberpstmt.setString(3, mem.getAddress());
   			updatememberpstmt.setString(4, mem.getPassword());
   			updatememberpstmt.setInt(5, mem.getMemberID());
			
   			int updatememberrec=updatememberpstmt.executeUpdate();
   			
   			if (updatememberrec ==1){
   				return true;
   			} else {
   				return false;
   			}
			
		} catch (Exception e){
			System.out.println(e);
			return false;
		}
		
	}
}









