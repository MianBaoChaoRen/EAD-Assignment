package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		String emailval = "^([a-zA-Z0-9]{3,})+([@]{1,1})+[a-zA-Z_]+\\.[a-zA-Z]{3,}$";
		boolean validemail=email.matches(emailval);
		
		String passwordval ="^[a-zA-Z0-9]{8,}$";
		boolean validpassword = password.matches(passwordval);
		
		boolean error=false;
		
		if (email == "" && password ==""){
			error=true;	
		}else if(email == ""){
			error=true;	
		}else if (password==""){
			error=true;
		}else if (validemail == false) {
			error=true;
		}else if (validpassword == false){
			error=true;
		}
		
		if(error){
			response.sendRedirect("login.html");
		}
		
		member mem=new member(email,password);
		
		memberDB db=new memberDB();
		int success=db.verifyMember(mem);
		
		if (success == 2){
			response.sendRedirect("../admin/dashboard.jsp");
		} else if (success == 3) {
			response.sendRedirect("../public/index.jsp");
		} else if (success == 1){
			
		}
		
		
		
		
		
		
	}

}
