package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
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
		String errMsg="<br/><br/>";
		
		if (email == "" && password ==""){
			error=true;
			errMsg+="Please enter your Username and Password <br/>";
			
		}else if(email == ""){
			error=true;
			errMsg+="Please enter your Username<br/>";	
		}else if (password==""){
			error=true;
			errMsg+="Please enter your Password";
		}else if (validemail == false) {
			error=true;
			errMsg+="Please enter a Valid Username <br/>";
		}else if (validpassword == false){
			error=true;
			errMsg+="Please enter a Valid Password <br/>";
		}
		
		if(error){
			response.sendRedirect("login.html");
		}
		
		
		
		
		
		
		
		
		
		
	}

}
