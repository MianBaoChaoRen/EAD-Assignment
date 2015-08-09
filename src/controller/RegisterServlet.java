package controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/login/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		String contact=request.getParameter("contact");
		String dob=request.getParameter("birthday");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		String emailval = "^([a-zA-Z0-9]{3,})+([@]{1,1})+[a-zA-Z_]+\\.[a-zA-Z]{3,}$";
		boolean validemail=email.matches(emailval);
		
		String passwordval ="^[a-zA-Z0-9]{8,}$";
		boolean validpassword = password.matches(passwordval);
		
		String contactval = "^[0-9]{8,8}$";
		boolean validcontact = contact.matches(contactval);
		
		boolean error=false;
		String errMsg="<br/><br/>";
		
		if (email == "" && password =="" && contact == "" && name =="" && dob =="" && address ==""){
			error=true;
		}else if (name==""){
			error=true;
		}else if (contact==""){
			error=true;
		}else if (dob==""){
			error=true;
		}else if (address==""){
			error=true;
		}else if(email == ""){
			error=true;
		}else if (password==""){
			error=true;
		}else if (validemail == false) {
			error=true;
		}else if (validpassword == false){
			error=true;
		}else if (validcontact == false){
			error=true;
		}
		
		if(error){
			response.sendRedirect("register.html");
		}
		
		member mem=new member(0,name,contact,dob,address,email,password);
		
		memberDB db=new memberDB();
		boolean success=db.insertMember(mem);
		
		if (success){
			response.sendRedirect("login.html");
		}
		
	}

}
