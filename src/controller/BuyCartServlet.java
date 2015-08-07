package controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class BuyCartServlet
 */
@WebServlet("/public/BuyCartServlet")
public class BuyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		CartDB db = new CartDB();
		
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String creditcard = request.getParameter("creditcard");
		String cardtype = request.getParameter("cardtype");
		String exmonth = request.getParameter("month");
		String exyear = request.getParameter("year");
		String cvc = request.getParameter("cvc");

		String [] userDetails = {name, contact, email, address};
		ArrayList<Cart> al = (ArrayList<Cart>)session.getAttribute("cart");
		db.recordCart(name, contact, email, address, creditcard, cardtype, exmonth, exyear, cvc, al);

		session.setAttribute("userdetails", userDetails);
		response.sendRedirect("summaryCart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
