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

    <title>SP IT! TM | Profile Page</title>

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

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Update Profile</p>
            </div>

            <div class="col-md-9">
			
			insert content here 
			
			<%
				String updateprofilesql="select * from member where email = '"+userdetails[3]+"'";
            		
				ResultSet profilers= stmt.executeQuery(updateprofilesql);
			%>
			<!-- general form elements -->
            	<div class="box box-primary">
                	<div class="box-header">
                   		<h3 class="box-title">Update Product Form</h3>
                 	</div><!-- /.box-header -->
					<%
                    	while (profilers.next()){
                      		int memberID = profilers.getInt("memberID");
                         	String name = profilers.getString("name");
                           	String contact = profilers.getString("contact");
                           	String address = profilers.getString("address");
                           	String password = profilers.getString("password");
               		%>
                   	<!-- form start -->
                   		<form role="form" action="updateprofileServlet" method="post">
                       		<div class="box-body">
                        		<div class="form-group">
			                   		<label>Member ID</label>
										<select name="memberID" class="form-control" disabled>
											<option value="<%=memberID%>">
												<%=memberID%>
				                          	</option>
				                      	</select>
				         			<label>Name</label>
										<textarea name="name" class="form-control" rows="2" placeholder="Enter here..."><%=name%></textarea>
				                    <label>Contact</label>
				             			<textarea name="contact" class="form-control" rows="7" placeholder="Enter here..."><%=contact%></textarea>
				                 	<label>Address</label>
				                  		<textarea name="address" class="form-control" rows="1" placeholder="Enter your address here..."><%=address%></textarea>
				                  	<label>Password</label>
				                  		<textarea name="password" class="form-control" rows="1" placeholder="Enter your new password here..."></textarea>
				  				</div>
				  			</div><!-- /.box-body -->

                                    <div class="box-footer">
                                    	<input type='hidden' name='memberID' value='<%=memberID%>'/>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        
                                    </div>
                                </form>
                                <%
                                    	}
                                %>
                            </div><!-- /.box -->
			
			
			
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
    }
    	} catch(Exception e){
			out.println(e);
		}
%>
</body>

</html>
