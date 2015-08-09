<!-- 
		ST0291 ENTERPRISE APPLICATION DEVELOPMENT
				2015/2016 SEMESTER 1
					ASSIGNMENT 1
	
	Class DISM/FT/2A/02
	Marcus Tan 		- 1448892
	Theodoric Lim 	- 1431223
	William Tay 	- 1455656


 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>verifyuser</title>
<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
</head>
<body>
	<%
		try{
			String userid=request.getParameter("userid");
			String password=request.getParameter("password");
			
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL ="jdbc:mysql://localhost/assignment_spit?user=root&password=1234";
			// Step 3 : Establish connection URL
			Connection conn = DriverManager.getConnection(connURL);
	
			Statement stmt= conn.createStatement();
			
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
					
			
			conn.close();
			
		} catch(Exception e){
			
			out.println(e);
		}
	
	
	
	%>
</body>
</html>