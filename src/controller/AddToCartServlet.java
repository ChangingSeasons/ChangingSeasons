package controller;
import static model.ShoppingCartDAO.*;
import static model.ProductDAO.viewProduct;
import static model.CartProductsDAO.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartProductsDAO;
import model.Product;
import model.ShoppingCart;
import model.ShoppingCartDAO;

/**
 * Servlet implementation class AddtoCartServlet
 */
@WebServlet("/AddtoCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
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
		String url = "";

		int productID = Integer.parseInt(request.getParameter("productID"));
		int userID = Integer.parseInt(request.getParameter("userID"));

		ShoppingCart cart = cartDetails(userID);
		
		//System.out.println("Current number of products on cart: "+cart.getNoOfProducts());
		
		insertIntoCartProducts(cart.getCartID(), productID, 1);
		
		System.out.println("Current number of products on cart: "+cart.getNoOfProducts());
		
		url = "/shoppingCart.jsp";
		//request.setAttribute("cart", cart);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
