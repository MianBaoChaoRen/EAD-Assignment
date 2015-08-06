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
        <title>SP IT! TM | Review Table</title>
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
                                <li><a href="viewallproduct.jsp"><i class="fa fa-angle-double-right"></i> View All Products</a></li>
                                <li><a href="addproduct.jsp"><i class="fa fa-angle-double-right"></i> Add Products</a></li>
                                <li class="active"><a href="unapprovedreview.jsp"><i class="fa fa-angle-double-right"></i> Pending Reviews</a></li>
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
                        Review
                        <small>Tables</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Review</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                
                <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Pending Review Table</h3>                              
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>
                                                	<%													
														ResultSet ReviewColrs = stmt.executeQuery("select p.ImagePath, p.ShortDesc, p.ProductID, r.Name, r.Comment, r.Star, r.Approved from review r, product p where p.ProductID=r.ProductID and Approved = 0");
														ResultSetMetaData ReviewColrsmd = ReviewColrs.getMetaData();
														String ReviewCol1 = ReviewColrsmd.getColumnName(1);
														
														out.println(ReviewCol1);
													%>
				                               	</th>
                                              	<th>
                                                
                                                <%
	                                                String ReviewCol2 = ReviewColrsmd.getColumnName(2);
													
													out.println(ReviewCol2);
														
												%>
                                                
                                                </th>
                                                <th>
                                                
                                                <%
	                                                String ReviewCol3 = ReviewColrsmd.getColumnName(3);
													
													out.println(ReviewCol3);
														
												%>
                                                
                                                </th><th>
                                                
                                                <%
	                                                String ReviewCol4 = ReviewColrsmd.getColumnName(4);
													
													out.println(ReviewCol4);
														
												%>
                                                
                                                </th><th>
                                                
                                                <%
	                                                String ReviewCol5 = ReviewColrsmd.getColumnName(5);
													
													out.println(ReviewCol5);
														
												%>
                                                
                                                </th><th>
                                                
                                                <%
	                                                String ReviewCol6 = ReviewColrsmd.getColumnName(6);
													
													out.println(ReviewCol6);
														
												%>
                                                
                                                </th>
                                                <th>
                                                
                                                <%
	                                                String ReviewCol7 = ReviewColrsmd.getColumnName(7);
													
													out.println(ReviewCol7);
														
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
														String ReviewRowsql="select p.ImagePath, p.ShortDesc, p.ProductID, r.Name, r.Comment, r.Star, r.Approved, r.CommentID from review r, product p where p.ProductID=r.ProductID and Approved = 0";
														ResultSet ReviewRowrs= stmt.executeQuery(ReviewRowsql);

														while (ReviewRowrs.next()){
												%>
															<tr>
																<td>
																	<img src="
																	<%=
																		ReviewRowrs.getString("ImagePath") 
																	%>
																	" class="img-circle" width="52" height="52" />
																</td>
                                                				<td>
																	<%=
																		ReviewRowrs.getString("ShortDesc")
																		
																	%> 
																</td>
																<td>
																	<%=
																		ReviewRowrs.getString("ProductID")  
																	%> 
																</td>
																<td>
																	<%=
																		ReviewRowrs.getString("Name") 
																	%> 
																</td>
																
																<td>
																	<%=
																		ReviewRowrs.getString("Comment")  
																	%> 
																</td>
																<td>
																	<%=
																		ReviewRowrs.getString("Star") 
																	%> 
																</td>
																<td>
																	<%=
																		ReviewRowrs.getString("Approved") 
																	%> 
																</td>
																<td> 
																<% 
																	int cid = ReviewRowrs.getInt("CommentID");
																	int pid= ReviewRowrs.getInt("productID");
																	
																	if (ReviewRowrs.getInt("Approved") == 0) {
													                	out.println("<form action=tableapprove.jsp>");
													                	out.println("<input type='hidden' name='approve' value='"+cid+"'/>");
													                	out.println("<input type='hidden' name='pid' value='"+pid+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa  fa-thumbs-o-up' onclick='return Confirmclicked();'>");
																		out.println("Approve ?");
																		out.println("</button>");
														                out.println("</form>");
													                } else {
													                }
																	
																	out.println("<form action=tablereviewdelete.jsp>");
																	out.println("<input type='hidden' name='deletereview' value='"+cid+"'/>");
																	out.println("<input type='hidden' name='pid' value='"+pid+"'/>");
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