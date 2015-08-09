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
	<%
		String [] userdetails = (String []) session.getAttribute("userdetails");
		try{
			
		    if (userdetails == null){
		    	response.sendRedirect("../public/index.jsp");
		    }else {
	%>

	
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
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">Welcome <%=userdetails[0] %></a>
                    </li>
                    <li>
                        <a href="../public/memberprofile.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                    <li>
                        <a href="../login/logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
<h1>Shopping Cart</h1>
	<!-- Page Content -->
	<div class="shopping-cart">
		


		<div class="column-labels">
			<label class="product-image">Image</label> 
			<label class="product-details">Product</label> 
			<label class="product-price">Price</label>
			<label class="product-quantity">Quantity</label> 
			<label class="product-removal">Remove</label>

		</div>		
		<%
			ArrayList<Cart> al = (ArrayList<Cart>) session.getAttribute("cart");
			
			if (al != null) {
				for(Cart c: al){
					%>
					<form action="ViewCartServlet" id="vForm">
					<input type="hidden" name="productNo" value="<%=c.getProductID()%>">
					</form>
					
					<form action="RemoveCartServlet" id="rForm">
						<input type="hidden" name="arrayNo" value="<%=c.getCount()%>">
					</form>
					<%
				}
				
				
			%><form action = "DetailsCartServlet" id = "dForm"><%
				int i = 0;
				for (Cart c : al) {
					c.setCount(i);
					
		%>

			
			
			<div class="product">
		
				<div class="product-image">
					<img src="<%=c.getImagePath()%>">
				</div>

				<div class="product-details">
					<div class="product-title"><%=c.getShortDesc()%></div>
					<p class="product-description"><%=c.getDesc()%></p>
				</div>

				<div class="product-price">
					<input type="hidden" name="price<%=i%>" id="price" value="<%=c.getPrice()%>">
					<%=c.getPrice()%>
				</div>

				<div class="product-quantity">
					<input type="number" min="1" name="quantity<%=i%>" id="quantity" value="<%=c.getQuantity()%>">
				</div>

				<div class="product-removal">
					<button class="remove-product" form="rForm">Remove</button>

					<button class="remove-product" form="vForm">View</button>
				</div>
			</div>
			<%
			i++;
			}			
			%>
			</form>				
			<button type="submit" class="checkout" form = "dForm">Checkout</button>
			
		<%
			}
		%>
	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<%
    }
    	} catch(Exception e){
			out.println(e);
		}
%>
</body>

</html>


