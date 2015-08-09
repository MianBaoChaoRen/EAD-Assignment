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
	    // Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");
		// Step 2: Define Connection URL
		String connURL ="jdbc:mysql://localhost/assignment_spit?user=root&password=1234";
		// Step 3 : Establish connection URL
		Connection conn = DriverManager.getConnection(connURL);	                            	
		Statement stmt= conn.createStatement();
		try{
	%>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">SP IT! TM</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                	<li>
                        <a href="../login/login.html">Admin Login</a>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Categories</p>
                <div class="list-group">
                <%
				String Categorysql = "SELECT * FROM productcategory";
				ResultSet Categoryrs = stmt.executeQuery(Categorysql);
				while (Categoryrs.next()){
					int CategoryID = Categoryrs.getInt("CategoryID");
					String CategoryName = Categoryrs.getString("CategoryType");
					%>
						<a href="categorysearch.jsp?CategoryID=<%= CategoryID %>" class="list-group-item"><%= CategoryName %></a>
					
					<%                                  
					}
				%>
                </div>
            </div>

            <div class="col-md-9">
                <div class="row">
	            	<%
	            		String cid=request.getParameter("CategoryID");
						String Productsql = "SELECT p.ProductID, p.Price, p.ShortDesc,p.Desc, p.Featured, p.ImagePath, Count(r.CommentID) 'TotalReview', avg(Star) 'Star' FROM product p, review r where CategoryID = '"+cid+"' AND p.ProductID=r.ProductID AND r.Approved = 1 Group by p.ProductID";
						ResultSet Productrs = stmt.executeQuery(Productsql);
						
						Float Price;
						int productID, totalreview, Avg;
						String shortDesc, desc, imagePath;
								
						while (Productrs.next()){
							productID=Productrs.getInt("ProductID");
							Price=Productrs.getFloat("Price");
							shortDesc=Productrs.getString("ShortDesc");
							desc=Productrs.getString("Desc");
							imagePath=Productrs.getString("ImagePath");
							totalreview=Productrs.getInt("TotalReview");
							Avg=Productrs.getInt("Star");
					%> 
						<div class="col-sm-4 col-lg-4 col-md-4">
						<form action = "AddCartServlet" method = "get">
						<input type ="hidden" name = "productID" value = <%= productID %>>
							<div class="thumbnail">
								<img src='<%= imagePath %>' alt="">
									<div class="caption">
		                             	<h4 class="pull-right">SGD $<%= Price %></h4>
		                                	<h4><a href="productHM.jsp?ProductID=<%= productID %>"><%= shortDesc %></a></h4>
		                                		<p><%= desc %></p>
		                           	</div>
		                            			
		                       	<div class="ratings">
					               		<p class="pull-right"><%= totalreview %> reviews</p>
					                 	<p>
					                   		<%
					                   		switch (Avg){
					                		case 1:
					                			%>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<% 
					                			break;
					                		case 2:
					                			%>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<% 
					                			break;
					                		case 3:
					                			%>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<% 
					                			break;
					                		case 4:
					                			%>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<% 
					                			break;
					                		case 5:
					                			%>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<span class="glyphicon glyphicon-star"></span>
					                			<% 
					                			break;
					                		default:
					                			%>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<span class="glyphicon glyphicon-star-empty"></span>
					                			<%
					                			break;
					                		}
					                   		%>
					                   	<input type = "submit" value = "Add To Cart"/>
					                 	</p>
					        	</div>
				         	</div>
				         	</form>
			         	</div>
					<%
						}
					%>
                </div>
            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; SP IT! | TM 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<%																
	conn.close();
	} catch(Exception e){
	out.println(e);
	}
%>
</body>

</html>
