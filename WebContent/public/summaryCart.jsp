<!-- 
		ST0291 ENTERPRISE APPLICATION DEVELOPMENT
				2015/2016 SEMESTER 1
					ASSIGNMENT 1
	
	Class DISM/FT/2A/02
	Marcus Tan 		- 1448892
	Theodoric Lim 	- 1431223
	William Tay 	- 1455656\


 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SP IT! TM | Index Page</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/cart.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">SP IT! TM</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="../login/login.html">Login</a></li>
					<li><a href="../login/register.html">Register</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<%String orderid = String.valueOf(session.getAttribute("orderid"));%>
	<h1>Summary</h1>
	<h2>Transaction <%=orderid %></h2>

	<div class="shopping-cart">

		<div class="column-labels">
			<label class="product-image">Image</label> <label
				class="product-details">Product</label> <label class="product-price">Price</label>
			<label class="product-quantity">Quantity</label> <label
				class="product-line-price">Total</label>
		</div>
		<%
			ArrayList<Cart> al = (ArrayList<Cart>) session.getAttribute("cart");
			String[] userdetails = (String[]) session.getAttribute("userdetails");
			
					
			int subtotals = 0;
			int tax = 0;
			int shipping = 0;
			int totals = 0;
			if (al != null) {
				int i = 0;

				for (Cart c : al) {
					c.setCount(i);
					i++;
		%>
		<form action="UpdateCartServlet" id="uForm"></form>

		<div class="product">
			<div class="product-image"></div>
			<div class="product-details2">
				<div class="product-title"><%=c.getShortDesc()%></div>
				<p class="product-description"></p>
			</div>
			<div class="product-price"><%=c.getPrice()%></div>
			<div class="product-quantity"><%=c.getQuantity()%></div>

			<div class="product-line-price"><%=c.getTotalPrice()%></div>
		</div>
		<%
			subtotals += c.getTotalPrice();
				}
				tax = (int) (subtotals * (5.0f / 100.0f));
				shipping = (int) (subtotals * (2.0f / 100.0f));
				totals = subtotals + tax + shipping;
			}
		%>
		<div class="totals">
			<div class="totals-item">
				<label>Subtotal</label>
				<div class="totals-value" id="cart-subtotal"><%=subtotals%></div>
			</div>
			<div class="totals-item">
				<label>Tax (5%)</label>
				<div class="totals-value" id="cart-tax"><%=tax%></div>
			</div>
			<div class="totals-item">
				<label>Shipping</label>
				<div class="totals-value" id="cart-shipping"><%=shipping%></div>
			</div>
			<div class="totals-item totals-item-total">
				<label>Grand Total</label>
				<div class="totals-value" id="cart-total"><%=totals%></div>
			</div>



			<div class="totals-item2">
				<label>Name</label>
				<div class="totals-value2">
					<%=userdetails[0] %>
				</div>
			</div>
			<div class="totals-item2">
				<label>Contact</label>
				<div class="totals-value2">
					<%=userdetails[1] %>
				</div>
			</div>
			<div class="totals-item2">
				<label>Email</label>
				<div class="totals-value2">
					<%=userdetails[2] %>
				</div>
			</div>
			<div class="totals-item2">
				<label>Mailing Address</label>
				<div class="totals-value2">
					<%=userdetails[3] %>
				</div>
			</div>
		</div>

	</div>
</body>
</html>