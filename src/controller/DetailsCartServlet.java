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
 * Servlet implementation class DetailsCartServlet
 */
@WebServlet("/public/DetailsCartServlet")
public class DetailsCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailsCartServlet() {
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

		HttpSession session = request.getSession();
		CartDB db = new CartDB();
		ArrayList<Cart> al = (ArrayList<Cart>) session.getAttribute("cart");
		int i = 0;
		for(i = 0; i < al.size(); i++){
			System.out.println(al.size());
			System.out.println(i);
			int quantity = Integer.parseInt(request.getParameter("quantity"+i));
			System.out.println(quantity);
			if(quantity == 0){
				quantity = 1;
			}
			int price = Integer.parseInt(request.getParameter("price"+i));
			int total = (price * quantity);
			
			ArrayList<Cart> d = db.confirmCart(al, quantity, total, i);
			session.setAttribute("cart", d);

		}
		
		
		response.sendRedirect("checkCart.jsp");
	}

}
