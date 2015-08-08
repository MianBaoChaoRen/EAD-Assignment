package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

/**
 * Servlet implementation class changePasswordServlet
 */
@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Email = request.getParameter("Email");
	    String Password = request.getParameter("Password");
	    String CPassword = request.getParameter("Password");

	    Connection con =   GetConnectToDb();
	    boolean flag = CheckLogin(Password,CPassword,Email,con);
	    if(flag==true){
	        gotoPage("/LoginPage.jsp",request,response);
	    }
	    else{
	        gotoPage("/ChangeError.jsp",request,response);
	    }
	}
	
	
	
	public void gotoPage(String address, HttpServletRequest request,
	        HttpServletResponse response) throws ServletException, IOException {
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    dispatcher.forward(request, response);
	}
	public boolean CheckLogin(String Password, String CPassword,String Email, Connection con) {
	    if (Password != null && CPassword != null && Email !=null) {
	        try {
	            PreparedStatement ps = con.prepareStatement("UPDATE PUBLIC.IAUSERS SET Password = ('"+Password+"') WHERE Email='"+Email+"'");
	            ResultSet rs = ps.executeQuery();
	        while(rs.next()) {
	                return true;
	            }
	        } catch (Exception e) {
	        }
	    }
	    return false;
	}
	public Connection GetConnectToDb() {

	    try {
	        InitialContext ctx = new InitialContext();
	        Connection con = null;
	        DataSource ds = (DataSource) ctx.lookup("java:/DefaultDS");
	        con = ds.getConnection();
	        return con;
	    } catch (Exception e) {
	        return null;
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
