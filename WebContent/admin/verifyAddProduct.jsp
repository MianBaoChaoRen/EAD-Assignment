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
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>verifyAddProduct</title>
</head>
<body>
	<%
		try{
			String CategoryType=request.getParameter("CategoryType");
			String Brand=request.getParameter("Brand");
			String shortDesc=request.getParameter("shortDesc");
			String spec=request.getParameter("spec");
			String Price=request.getParameter("Price");
			
			
			 // Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL ="jdbc:mysql://localhost/assignment_spit?user=root&password=1234";
			// Step 3 : Establish connection URL
			Connection conn = DriverManager.getConnection(connURL);	     
			
			//Statement stmt= conn.createStatement();
			
			
			String AddProductsql="Insert into product (CategoryID, BrandID, shortDesc, spec, Price) values(?,?,?,?,?)";
   			
   			PreparedStatement AddProductpstmt=conn.prepareStatement(AddProductsql);
   			
   			AddProductpstmt.setInt(1,Integer.parseInt(CategoryType));
   			AddProductpstmt.setInt(2,Integer.parseInt(Brand));
   			AddProductpstmt.setString(3,shortDesc);
   			AddProductpstmt.setString(4,spec);
   			AddProductpstmt.setFloat(5, Float.parseFloat(Price));
   			
			
   			int AddProductrec=AddProductpstmt.executeUpdate();
   			
   			if (AddProductrec == 1) {
   				response.sendRedirect("viewallproduct.jsp");
   			} else {
   				response.sendRedirect("addproduct.jsp");
   			}
   			
			conn.close();
			
		} catch(Exception e){
			
			out.println(e);
		}
	
	
	
	%>
</body>
</html>