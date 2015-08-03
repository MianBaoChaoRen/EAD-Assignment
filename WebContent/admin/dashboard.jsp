<!-- 
		ST0291 ENTERPRISE APPLICATION DEVELOPMENT
				2015/2016 SEMESTER 1
					ASSIGNMENT 1
	
	Class DISM/FT/2A/02
	Marcus Tan 		- 1448892
	Theodoric Lim 	- 1431223
	William Tay 	- 1455656


 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SP IT! TM | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="../admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="../admin/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- jQuery 2.0.2 -->
        <script src="../admin/js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../admin/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="../admin/js/AdminLTE/app.js" type="text/javascript"></script>



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="../admin/js/html5shiv.js"></script>
          <script src="../admin/js/respond.min.js"></script>
        <![endif]-->
        
        <link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
        
    </head>
    <body class="skin-blue">
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
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                SP IT! TM
            </a>
            
            
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
            </nav>
            
            
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">                
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="dashboard.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-folder"></i>
                                <span>Categories</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                          	<ul class="treeview-menu">
                                <li><a href="viewallcategories.jsp"><i class="fa fa-angle-double-right"></i> View All Categories</a></li>
                                <li><a href="addcategory.jsp"><i class="fa fa-angle-double-right"></i> Add Category</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-archive"></i>
                                <span>Products</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="viewallproduct.jsp"><i class="fa fa-angle-double-right"></i> View All Products</a></li>
                                <li><a href="addproduct.jsp"><i class="fa fa-angle-double-right"></i> Add Products</a></li>
                                <li><a href="unapprovedreview.jsp"><i class="fa fa-angle-double-right"></i> Pending Reviews</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-group"></i>
                                <span> Administrators</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="viewalladmin.jsp"><i class="fa fa-angle-double-right"></i> View All Administrators</a></li>
                                <li><a href="addadmin.jsp"><i class="fa fa-angle-double-right"></i> Add Administrator</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Dashboard
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
				
				<!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-maroon">
                                <div class="inner">
                                    <h3>
                                        <% 
                                        	String CountProductsql="SELECT * FROM product";
                                        	ResultSet CountProductrs= stmt.executeQuery(CountProductsql);
                                        	
                                        	int Productcounter = 0 ;
                                        	
                                        	while (CountProductrs.next()){
                                        		++Productcounter;
                                        	} out.println(Productcounter);
                                        
                                        %>
                                        
                                    </h3>
                                    <p>
                                        Products
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-ios7-pricetag-outline"></i>
                                </div>
                                <a href="viewallproduct.jsp" class="small-box-footer">
                                    View All <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>
                                        <%
                                        	
                                        String CountAdminsql="select * from admin";
                                    	ResultSet CounterAdminrs= stmt.executeQuery(CountAdminsql);
                                    	
										int Membercounter = 0 ;
                                    	
                                    	while (CounterAdminrs.next()){
                                    		++Membercounter;
                                    	} out.println(Membercounter);
                                        
                                        %>
                                    </h3>
                                    <p>
                                        Total Registered Admin
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="viewalladmin.jsp" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        
                        
                	</div>
                	
                	<div class="row">
						<div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-purple">
                                <div class="inner">
                                    <h3>
                                        <%
                                        	
                                        String CountReviewsql="select * from review where Approved = 0";
                                    	ResultSet CounterReviewrs= stmt.executeQuery(CountReviewsql);
                                    	
										int Reviewcounter = 0 ;
                                    	
                                    	while (CounterReviewrs.next()){
                                    		++Reviewcounter;
                                    	} out.println(Reviewcounter);
                                        
                                        %>
                                    </h3>
                                    <p>
                                        Un-Approved Reviews
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-ios7-briefcase-outline"></i>
                                </div>
                                <a href="unapprovedreview.jsp" class="small-box-footer">
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                    </div><!-- /.row (main row) -->

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
<%																	
	conn.close();
	} catch(Exception e){
	out.println(e);
	}
%>
    </body>
</html>