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
<%@ page import="java.sql.*,model.*" %>
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
	Connection conn=connDB.getConnectionDB();
    
	Statement stmt= conn.createStatement();
	
	
    String email = (String) session.getAttribute("email");
    
    try{
	
    if (email != null){
    	
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
                        Welcome
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

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="..\ProductImg\miband800x300.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="..\ProductImg\ux305800x300.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="..\ProductImg\samsungs6800x300.jpg" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>
					<p class="lead">Featured Products</p>
                <div class="row">
	            	<%
						String Productsql = "SELECT p.ProductID, p.Price, p.ShortDesc,p.Desc, p.Featured, p.ImagePath, Count(r.CommentID) 'TotalReview', avg(Star) 'Star' FROM product p, review r where p.ProductID=r.ProductID AND r.Approved = 1 Group by p.ProductID";
						ResultSet Productrs = stmt.executeQuery(Productsql);
								
						Float Price;
						String shortDesc, desc, imagePath;
						int productID, totalreview, Featured, Avg;
								
						while (Productrs.next()){
							productID=Productrs.getInt("ProductID");
							Price=Productrs.getFloat("Price");
							shortDesc=Productrs.getString("ShortDesc");
							desc=Productrs.getString("Desc");
							imagePath=Productrs.getString("ImagePath");
							totalreview=Productrs.getInt("TotalReview");
							Featured=Productrs.getInt("Featured");
							Avg=Productrs.getInt("Star");
							
							if (Featured == 1){
							
					%> 
					
						<div class="col-sm-4 col-lg-4 col-md-4">
						
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
					                   	<form action = "AddCartServlet">
											<input type ="hidden" name = "productID" value = <%= productID %>>
					                 	<input type = "submit" value = "Add To Cart"/>
					                 	</form>
					                 	</p>
					        	</div>
				         	</div>
				         	
			         	</div>
					<%
							}
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
    } else {
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
                            <a href="../login/login.html">Login</a>
                        </li>
                        <li>
                        <a href="../login/register.html">Register</a>
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

                    <div class="row carousel-holder">

                        <div class="col-md-12">
                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img class="slide-image" src="..\ProductImg\miband800x300.jpg" alt="">
                                    </div>
                                    <div class="item">
                                        <img class="slide-image" src="..\ProductImg\ux305800x300.jpg" alt="">
                                    </div>
                                    <div class="item">
                                        <img class="slide-image" src="..\ProductImg\samsungs6800x300.jpg" alt="">
                                    </div>
                                </div>
                                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>
                        </div>

                    </div>
    					<p class="lead">Featured Products</p>
                    <div class="row">
    	            	<%
    						String Productsql = "SELECT p.ProductID, p.Price, p.ShortDesc,p.Desc, p.Featured, p.ImagePath, Count(r.CommentID) 'TotalReview', avg(Star) 'Star' FROM product p, review r where p.ProductID=r.ProductID AND r.Approved = 1 Group by p.ProductID";
    						ResultSet Productrs = stmt.executeQuery(Productsql);
    								
    						Float Price;
    						String shortDesc, desc, imagePath;
    						int productID, totalreview, Featured, Avg;
    								
    						while (Productrs.next()){
    							productID=Productrs.getInt("ProductID");
    							Price=Productrs.getFloat("Price");
    							shortDesc=Productrs.getString("ShortDesc");
    							desc=Productrs.getString("Desc");
    							imagePath=Productrs.getString("ImagePath");
    							totalreview=Productrs.getInt("TotalReview");
    							Featured=Productrs.getInt("Featured");
    							Avg=Productrs.getInt("Star");
    							
    							if (Featured == 1){
    							
    					%> 
    						<div class="col-sm-4 col-lg-4 col-md-4">
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
    					                 	</p>
    					        	</div>
    				         	</div>
    			         	</div>
    					<%
    							}
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
<%}
		} catch(Exception e){
			out.println(e);
		}
%>
</body>

</html>
