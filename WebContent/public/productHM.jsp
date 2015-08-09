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
   <%@page import="java.util.Date" %>
   <%@ page import="java.util.Locale" %>
   <%@ page import="java.io.*,java.util.*" %>
	<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html lang="en">
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
<head>
<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SP IT! TM | Product Page</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-item.css" rel="stylesheet">

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
				<%
	          	String pid=request.getParameter("ProductID");
				String Productsql = "SELECT * FROM product where ProductID = '"+pid+"'";
				ResultSet Productrs = stmt.executeQuery(Productsql);
				
						
				Float Price;
				String shortDesc, desc, fullimagePath, spec;
								
				while (Productrs.next()){
					Price=Productrs.getFloat("Price");
					shortDesc=Productrs.getString("ShortDesc");
					desc=Productrs.getString("Desc");
					spec=Productrs.getString("Spec");
					fullimagePath=Productrs.getString("FullImagePath");
				%> 
				
                <div class="thumbnail">
                    <img class="img-responsive" src="<%= fullimagePath %>" alt="<%= shortDesc %>">
                    <div class="caption-full">
                        <h4 class="pull-right">SGD $ <%= Price %></h4>
                        <h4><a href="#"><%= shortDesc %></a>
                        </h4>
                        <p><%= desc %></p>
                        <p><%= spec %></p>
                    </div>
               	<%
					}
				
	          	String TotalCommentpid=request.getParameter("ProductID");
				String TotalProductCommentsql = "select count(*) from review where Approved = 1 AND ProductID='"+TotalCommentpid+"'";
				ResultSet TotalProductCommentrs = stmt.executeQuery(TotalProductCommentsql);
				
				String TotalComment;
								
				while (TotalProductCommentrs.next()){
					TotalComment = TotalProductCommentrs.getString("Count(*)");
				%> 
                    <div class="ratings">
                    	<a href="productReview.jsp?ProductID=<%= TotalCommentpid %>">
                    		<p class="pull-right">Click to View All <%= TotalComment %> reviews</p>
                    	</a>
                <%
					}
				
	          	String Avgpid=request.getParameter("ProductID");
				String Avgsql = "select avg(Star) from review where Approved = 1 AND ProductID='"+Avgpid+"'";
				ResultSet Avgrs = stmt.executeQuery(Avgsql);
				
				int Avg;
								
				while (Avgrs.next()){
					Avg = Avgrs.getInt("avg(Star)");
					%> 
					
						<p>Total Avg Rating</p>
					
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
                    </div>
                </div>

               	<%
               	
				}
				
	          	String Commentpid=request.getParameter("ProductID");
				String ProductCommentsql = "SELECT * FROM review r, product p where r.ProductID=p.ProductID AND r.Approved = 1 AND r.Featured = 1 AND p.ProductID = '"+Commentpid+"'";
				ResultSet ProductCommentrs = stmt.executeQuery(ProductCommentsql);
				
				String Comment, name;
				int Star;
								
				while (ProductCommentrs.next()){
					Comment=ProductCommentrs.getString("Comment");
					name=ProductCommentrs.getString("Name");
					Star=ProductCommentrs.getInt("Star");
					java.sql.Date Sqldate = ProductCommentrs.getDate("Date");
					
				%>


                <div class="well">
                    <div class="row">
                        <div class="col-md-12">
                        <%
                        	switch (Star){
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
                            <%= name %>
                            <span class="pull-right"><%= Sqldate %></span>
                            <p><%= Comment %></p>
                        </div>
                    </div>       
                </div>
				<%
					}
				
				int Reviewpid=Integer.parseInt(request.getParameter("ProductID"));
				%>
				<hr>
				<form role="form" action="verifyAddReview.jsp" method="post">
				<div class="form-group">
						<input type='hidden' name='ProductID' value='<%= Reviewpid %>'/>
                	<label>Name</label>
              		<textarea name="name" class="form-control" rows="2" placeholder="Enter Your Name..."></textarea>
          		</div>
               	<!-- textarea -->
               	<div class="form-group">
               		<label>Review</label>
                		<textarea name="review" class="form-control" rows="7" placeholder="Enter Your Review here..." required></textarea>
             	</div>
             		<div class="form-group">
                    	<label for="star">Rate This Product</label>
                       		<select name="star" class="form-control">
								<option value="5"> 5 </option>
								<option value="4"> 4 </option>
								<option value="3"> 3 </option>
								<option value="2"> 2 </option>
								<option value="1"> 1 </option>
                           	</select>
               		</div>
				<div class="text-right">
                        <button type="submit" class="btn btn-primary">Leave a Review</button>
              	</div>
              	</form>
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

</body>
<%																
	conn.close();
	} catch(Exception e){
	out.println(e);
	}
%>
</html>
