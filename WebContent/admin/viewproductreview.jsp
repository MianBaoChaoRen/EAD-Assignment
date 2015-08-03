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
        <title>SP IT! TM | Reviews</title>
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
                        Review
                        <small>Table</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Reviews</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                
                <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">All Not Approved Review Table</h3>                              
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>
                                                	<%			
                                                		int pid=Integer.parseInt(request.getParameter("productID"));
														ResultSet ReviewColrs = stmt.executeQuery("SELECT * FROM review where Approved = 0 AND ProductID = '"+pid+"'");
														ResultSetMetaData ReviewColrsmd = ReviewColrs.getMetaData();
														String ReviewCol1 = ReviewColrsmd.getColumnName(2);
														
														out.println(ReviewCol1);
													%>
				                               	</th>
                                              	<th>
                                                
                                                <%
														String ReviewCol2 = ReviewColrsmd.getColumnName(3);
														
														out.println(ReviewCol2);
														
												%>
                                                
                                                </th>
                                                <th>
                                                
                                                <%
														String ReviewCol3 = ReviewColrsmd.getColumnName(4);
														
														out.println(ReviewCol3);
														
												%>
                                                
                                                </th>
                                                <th>
                                                
                                                <%
														String ReviewCol4 = ReviewColrsmd.getColumnName(5);
														
														out.println(ReviewCol4);
														
												%>
												
												</th>
                                                <th>
                                                
                                                <%
														String ReviewCol5 = ReviewColrsmd.getColumnName(6);
														
														out.println(ReviewCol5);
														
												%>
												
												</th>
												<th>
                                                
                                                <%
														String ReviewCol6 = ReviewColrsmd.getColumnName(7);
														
														out.println(ReviewCol6);
														
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

														while (ReviewColrs.next()){
												%>
															<tr>
                                                				<td>
																	<%=
																			ReviewColrs.getInt("ProductID") 
																	%> 
																</td>
																<td>
																	<%=
																			ReviewColrs.getString("Name") 
																	%> 
																</td>
																<td>
																	<%=
																			ReviewColrs.getString("Comment") 
																	%> 
																</td>
																
																<td>
																	<%=
																			ReviewColrs.getInt("Star") 
																	%> 
																</td>
																<td>
																	<%=
																			ReviewColrs.getString("Approved") 
																	%> 
																</td>
																<td>
																	<%=
																			ReviewColrs.getString("Featured") 
																	%> 
																</td>
																<td> 
																<%
																	int cid = ReviewColrs.getInt("CommentID");
																	if (ReviewColrs.getInt("Approved") == 0) {
													                	out.println("<form action=approve.jsp>");
													                	out.println("<input type='hidden' name='approve' value='"+cid+"'/>");
													                	out.println("<input type='hidden' name='pid' value='"+pid+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa  fa-thumbs-o-up' onclick='return Confirmclicked();'>");
																		out.println("Approve ?");
																		out.println("</button>");
														                out.println("</form>");
													                } else {
													                	out.println("<form action=disapprove.jsp>");
													                	out.println("<input type='hidden' name='disapprove' value='"+ cid+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa  fa-thumbs-o-down' onclick='return Confirmclicked();'>");
																		out.println("Disapprove ?");
																		out.println("</button>");
														                out.println("</form>");
													                }
																	
																	out.println("<form action=verifydeletereview.jsp>");
																	out.println("<input type='hidden' name='deletereview' value='"+cid+"'/>");
																	out.println("<input type='hidden' name='pid' value='"+pid+"'/>");
																	out.println("<button type='submit' class='viewallproducticon fa  fa-ban' onclick='return Confirmclicked();'>");
																	out.println("Remove");
																	out.println("</button>");
													                out.println("</form>");
																%>
																</td>
																<% 
																	}
																%>
																
																
															</tr>
												
                                            
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                                
                                <div class="box-header">
                                    <h3 class="box-title">All Approved Review Table</h3>                              
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>
                                                	<%			
                                                		int Apid=Integer.parseInt(request.getParameter("productID"));
														ResultSet AReviewColrs = stmt.executeQuery("SELECT * FROM review where Approved = 1 AND ProductID = '"+pid+"'");
														ResultSetMetaData AReviewColrsmd = AReviewColrs.getMetaData();
														String AReviewCol1 = AReviewColrsmd.getColumnName(2);
														
														out.println(AReviewCol1);
													%>
				                               	</th>
                                              	<th>
                                                
                                                <%
														String AReviewCol2 = AReviewColrsmd.getColumnName(3);
														
														out.println(AReviewCol2);
														
												%>
                                                
                                                </th>
                                                <th>
                                                
                                                <%
														String AReviewCol3 = AReviewColrsmd.getColumnName(4);
														
														out.println(AReviewCol3);
														
												%>
                                                
                                                </th>
                                                <th>
                                                
                                                <%
														String AReviewCol4 = AReviewColrsmd.getColumnName(5);
														
														out.println(AReviewCol4);
														
												%>
												
												</th>
                                                <th>
                                                
                                                <%
														String AReviewCol5 = AReviewColrsmd.getColumnName(6);
														
														out.println(AReviewCol5);
														
												%>
												
												</th>
												<th>
                                                
                                                <%
														String AReviewCol6 = AReviewColrsmd.getColumnName(7);
														
														out.println(AReviewCol6);
														
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

														while (AReviewColrs.next()){
												%>
															<tr>
                                                				<td>
																	<%=
																			AReviewColrs.getInt("ProductID") 
																	%> 
																</td>
																<td>
																	<%=
																			AReviewColrs.getString("Name") 
																	%> 
																</td>
																<td>
																	<%=
																			AReviewColrs.getString("Comment") 
																	%> 
																</td>
																
																<td>
																	<%=
																			AReviewColrs.getInt("Star") 
																	%> 
																</td>
																<td>
																	<%=
																			AReviewColrs.getString("Approved") 
																	%> 
																</td>
																<td>
																	<%=
																			AReviewColrs.getString("Featured") 
																	%> 
																</td>
																<td> 
																<%
																	int Acid = AReviewColrs.getInt("CommentID");
																	if (AReviewColrs.getInt("Approved") == 0) {
													                	out.println("<form action=approve.jsp>");
													                	out.println("<input type='hidden' name='approve' value='"+Acid+"'/>");
													                	out.println("<input type='hidden' name='pid' value='"+Apid+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa   fa-thumbs-o-up' onclick='return Confirmclicked();'>");
																		out.println("Approve ?");
																		out.println("</button>");
														                out.println("</form>");
													                } else {
													                	out.println("<form action=disapprove.jsp>");
													                	out.println("<input type='hidden' name='disapprove' value='"+Acid+"'/>");
													                	out.println("<input type='hidden' name='pid' value='"+Apid+"'/>");
																		out.println("<button type='submit' class='viewallproducticon fa  fa-thumbs-o-down' onclick='return Confirmclicked();'>");
																		out.println("Disapprove ?");
																		out.println("</button>");
														                out.println("</form>");
													                }
																	
																	out.println("<form action=verifyfeaturereview.jsp>");
																	out.println("<input type='hidden' name='featurereview' value='"+ Acid+"'/>");
																	out.println("<input type='hidden' name='pid' value='"+pid+"'/>");
																	out.println("<button type='submit' class='viewallproducticon fa  fa-star' onclick='return Confirmclicked();'>");
																	out.println("Feature");
																	out.println("</button>");
													                out.println("</form>");
																	
																	out.println("<form action=verifydeletereview.jsp>");
																	out.println("<input type='hidden' name='deletereview' value='"+Acid+"'/>");
																	out.println("<input type='hidden' name='pid' value='"+Apid+"'/>");
																	out.println("<button type='submit' class='viewallproducticon fa  fa-ban' onclick='return Confirmclicked();'>");
																	out.println("Remove");
																	out.println("</button>");
													                out.println("</form>");
																%>
																</td>
																<% 
																	}
																%>
																
																
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