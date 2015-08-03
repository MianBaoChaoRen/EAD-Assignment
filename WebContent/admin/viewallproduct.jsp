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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="../ProductImg/SPFavicon.png" sizes="16x16">
        <meta charset="UTF-8">
        <title>SP IT! TM | Products</title>
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

		<script src="js/sorttable.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
        
        
        <script>
			function Confirmclicked(e)
			
			{
			if(!confirm('Click OK to perform action'))e.preventDefault();
			}
		</script>
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
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
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
                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-archive"></i>
                                <span>Products</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="viewallproduct.jsp"><i class="fa fa-angle-double-right"></i> View All Products</a></li>
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
                        Products
                        <small>Tables</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Products</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                
                <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">All Products Table</h3>                              
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped sortable">
                                        <thead>
                                            <tr>
                                                <th>
                                                	<%													
														ResultSet ProductColrs = stmt.executeQuery("SELECT * FROM product");
														ResultSetMetaData ProductColrsmd = ProductColrs.getMetaData();
														String ProductCol1 = ProductColrsmd.getColumnName(8);
														
														out.println(ProductCol1);
													%>
				                               	</th>
                                              	<th>
                                                
                                                <%
														String ProductCol2 = ProductColrsmd.getColumnName(1);
														
														out.println(ProductCol2);
														
												%>
                                                
                                                </th>
                                                <th>
                                                
                                                <%
														String ProductCol3 = ProductColrsmd.getColumnName(3);
														
														out.println(ProductCol3);
														
												%>
                                                
                                                </th>
                                                <th>
                                                
                                                <%
														String ProductCol4 = ProductColrsmd.getColumnName(2);
														
														out.println(ProductCol4);
														
												%>
												
												</th>
                                                <th>
                                                
                                                <%
														String ProductCol5 = ProductColrsmd.getColumnName(4);
														
														out.println(ProductCol5);
														
												%>
												
												</th>
												<th>
                                                
                                                <%
														String ProductCol6 = ProductColrsmd.getColumnName(5);
														
														out.println(ProductCol6);
														
												%>
												
												</th>
												<th>
                                                
                                                <%
														String ProductCol7 = ProductColrsmd.getColumnName(7);
														
														out.println(ProductCol7);
														
												%>
												
												</th>
												<th>
												
													<%
													
														out.println("Option");
													
													%>
												
												</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                             
                                                <%
														String Productsql="select * from product p, productCategory pc, brand b where p.CategoryId = pc.CategoryId and p.BrandID = b.BrandID";
														ResultSet Productrs= stmt.executeQuery(Productsql);

														while (Productrs.next()){
												%>
															<tr>
																<td>
																	<img src="
																	<%=
																		Productrs.getString("ImagePath") 
																	%>
																	" class="img-circle" width="52" height="52" />
																</td>
                                                				<td>
																	<%=
																		Productrs.getString("ProductID") 
																	%> 
																</td>
																<td>
																	<%=
																		Productrs.getString("BrandName") 
																	%> 
																</td>
																<td>
																	<%=
																		Productrs.getString("CategoryType") 
																	%> 
																</td>
																
																<td>
																	<%=
																		Productrs.getString("ShortDesc") 
																	%> 
																</td>
																<td>
																	<%=
																		Productrs.getString("Spec") 
																	%> 
																</td>
																<td>
																
																	<%=
																		Productrs.getString("Price") 
																	%> 
																	SGD
																</td>
																<td> 
																<% 
																
																
																	int productID=Productrs.getInt("ProductID");
																	int CategoryID=Productrs.getInt("CategoryID");
																
																	out.println("<form action=viewproductreview.jsp>");
																	out.println("<input type='hidden' name='productID' value='"+productID+"'/>");
																	out.println("<button type='submit' class='viewallproducticon fa  fa-barcode' onclick='return Confirmclicked();'>");
																	out.println("View Reviews");
																	out.println("</button>");
													                out.println("</form>");
												                
													                out.println("<form action=updateproduct.jsp>");
													                out.println("<input type='hidden' name='productID' value='"+productID+"' method='get'/>");
																	out.println("<button type='submit' class='viewallproducticon fa  fa-refresh' onclick='return Confirmclicked();'>");
																	out.println("Update");
													                out.println("</button>");
													                out.println("</form>");
												                
																	out.println("<form action=verifydeleteproduct.jsp>");
																	out.println("<input type='hidden' name='deleteproduct' value='"+productID+"'/>");
																	out.println("<button type='submit' class='viewallproducticon fa  fa-ban' onclick='return Confirmclicked();'>");
																	out.println("Remove");
																	out.println("</button>");
													                out.println("</form>");
													                
																	
																	}
																%>
																</td>
																
															</tr>
												
                                            
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                
                
                
                
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