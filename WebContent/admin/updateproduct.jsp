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
<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
        <meta charset="UTF-8">
        <title>SP IT! TM | UPDATE Products</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- jQuery 2.0.2 -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
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
            
                <div class="navbar-right">
                </div>
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
                                <span>Sales Report</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                          	<ul class="treeview-menu">
                                <li class="active"><a href="sales.jsp"><i class="fa fa-angle-double-right"></i> Date Range</a></li>
                            </ul>
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
                                <span> Members</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="viewalladmin.jsp"><i class="fa fa-angle-double-right"></i> View All Members</a></li>
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
                        UPDATE
                        <small>Product</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Update Products</li>
                    </ol>
                </section>
				<%
					String viewproduct=request.getParameter("productID");
					String updateProductsql="select * from product p, productCategory pc where p.CategoryId = pc.CategoryId and ProductID = '"+viewproduct+"'";
								
					ResultSet Productrs= stmt.executeQuery(updateProductsql);
				%>
                <!-- Main content -->
                <section class="content">
                <div class="row">
                        <!-- left column -->
                        <div class="col-md-6">
                            <!-- general form elements -->
                			<div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Update Product Form</h3>
                                </div><!-- /.box-header -->
										<%
                                    		while (Productrs.next()){
                                    			int CatID = Productrs.getInt("CategoryID");
                                    			int BID = Productrs.getInt("BrandID");
                                    			int ProductID = Productrs.getInt("ProductID");
                                    			String shortDesc = Productrs.getString("ShortDesc");
                                    			String spec = Productrs.getString("spec");
                                    			Float price = Productrs.getFloat("Price");
                                    	%>
                                		<!-- form start -->
                                			<form role="form" action="verifyupdateproduct.jsp" method="get">
                                    			<div class="box-body">
                                    				<div class="form-group">

                                    	
			                                    		<label>Product ID</label>
				                                            <select name="ProductID" class="form-control" disabled>
				                                                <option value="<%=ProductID%>">
				                                                	<%=ProductID%>
				                                                </option>
				                                                
				                                            </select>
				                                            <label>Category Type</label>
				                                            	<select name="CategoryID" class="form-control">
																	<%
								                                        String Categorysql = "SELECT * FROM productcategory";
								                                        ResultSet Categoryrs = stmt.executeQuery(Categorysql);
								                                        while (Categoryrs.next()){
								                                            int CategoryID = Categoryrs.getInt("CategoryID");
								                                            String CategoryName = Categoryrs.getString("CategoryType");
								                                        		if (CategoryID == CatID){
								                                        			out.println("<option value=\"" + CategoryID + "\" selected >" + CategoryID + ". " + CategoryName + "</option>");
								                                        		}else {
								                                        			out.println("<option value=\"" + CategoryID + "\" >" + CategoryID + ". " + CategoryName + "</option>");
								                                        		}
								                                        }
																	%>
																	
																	
																</select>

				                                            <label for="Brand">Brand / Vendor</label>
				                                            <select name="Brand" class="form-control">
				                                            	<%
								                                	String Brandsql = "SELECT * FROM brand";
								                               		ResultSet Brandrs = stmt.executeQuery(Brandsql);
								                                 	while (Brandrs.next()){
								                                		int BrandID = Brandrs.getInt("BrandID");
								                                		String BrandName = Brandrs.getString("BrandName");
								                                 	if (BrandID == BID){
								                                  			out.println("<option value=\"" + BrandID + "\" selected >" + BrandID + ". " + BrandName + "</option>");
								                                    	}else {
								                                   			out.println("<option value=\"" + BrandID + "\" >" + BrandID + ". " + BrandName + "</option>");
								                                    	}
								                                  	}
																%>
				                                            </select>
				                                            <label>Short Description (Model)</label>
				                                            	<textarea name="shortDesc" class="form-control" rows="2" placeholder="Enter here..."><%=shortDesc%></textarea>
				                                            <label>Specification</label>
				                                            	<textarea name="spec" class="form-control" rows="7" placeholder="Enter here..."><%= spec %></textarea>
				                                            <label>Price</label>
				                                            <textarea name="Price" class="form-control" rows="1" placeholder="Enter your price here..."><%= price %></textarea>
				                                        </div>
				                                    </div><!-- /.box-body -->

                                    <div class="box-footer">
                                    	<input type='hidden' name='ProductID' value='<%=ProductID%>'/>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        
                                    </div>
                                </form>
                                <%
                                    	}
                                %>
                            </div><!-- /.box -->
                     	</div>
					</div>
                
                
                
                
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