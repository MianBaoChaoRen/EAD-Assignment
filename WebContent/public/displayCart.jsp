<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "model.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP IT! TM | Index Page</title>
</head>
<body>
<table border = '1'>
<tr bgcolor='yellow'>
<td>Brand</td>
<% 
ArrayList<Cart> al = (ArrayList<Cart>)session.getAttribute("cartadd");

if( al!= null){
	for (Cart c: al){
		
		out.println("<tr>");
		out.println("<td>" + c.getShortDesc() + "</td>");
		out.println("</tr>");
		out.println("</table>");
	}
}

%>
</body>
</html>