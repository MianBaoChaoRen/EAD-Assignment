package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.CartDB;

/**
 * Servlet implementation class CheckCartServlet
 */
@WebServlet("/public/CheckCartServlet")
public class CheckCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int quantity = Integer.parseInt(request.getParameter("Quantity"));
		int price = Integer.parseInt(request.getParameter("price"));
		int total = price * quantity;

		HttpSession session = request.getSession();	
		CartDB db = new CartDB();
		
		ArrayList<Cart> al = (ArrayList<Cart>)session.getAttribute("cart");
		al = db.confirmCart(al, quantity, total);
		
		if(al == null){
			
		}
		
       	session.setAttribute("cart", al);
		response.sendRedirect("checkCart.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
