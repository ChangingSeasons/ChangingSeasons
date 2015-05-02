package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrderDAO;
import model.OrderProductsDAO;
import model.ShoppingCartDAO;
import model.User;

/**
 * Servlet implementation class CardDetailsServlet
 */
@WebServlet("/CardDetailsServlet")
public class CardDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CardDetailsServlet() {
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
		String cardno = request.getParameter("cardno");
		String cvv = request.getParameter("cvv");
		String cardholder = request.getParameter("cardholder");
		
		String msg = "", url = "";
		
		int cflag = 0, cvflag = 0;
		
		if(cardno.length()==0){
			msg += "Please enter 16-Digit Card Number!";
			url = "/cardDetails.jsp";
			request.setAttribute("msg", msg);
		}
		else{
			cflag = 1;
			if(!cardno.matches("\\d{16}")){
				msg += "Invalid Card Number";
				url = "/cardDetails.jsp";
				request.setAttribute("msg", msg);
				cflag = 0;
			}
		}
		if(cvv.length()==0){
			msg += "Please enter 3-Digit CVV Number!";
			url = "/cardDetails.jsp";
			request.setAttribute("msg", msg);
		}
		else{
			cvflag = 1;
			if(!cvv.matches("\\d{3}")){
				msg += "Invalid CVV Number!";
				url = "/cardDetails.jsp";
				request.setAttribute("msg", msg);
			}
		}
		if(cardholder.length()==0){
			msg += "Please enter Card Holder's Name!";
			url = "/cardDetails.jsp";
			request.setAttribute("msg", msg);
		}
		
		if(cflag== 1 && cvflag == 1 && cardholder.length()!=0){
			// Everything is filled-in
			
			
			int customerID = Integer.parseInt(request.getParameter("user"));
			String orderStatus = "Order Placed";
			HttpSession se = request.getSession();
			String shippingAddress= "";
			if (se.getAttribute("shippingAddress")!= null){
				shippingAddress = (String) se.getAttribute("shippingAddress");
			} else {
				User currentUser = (User) se.getAttribute("user");
				shippingAddress = currentUser.getAddress();
				
			}
			
			int orderID = OrderDAO.addOrder(customerID, orderStatus, shippingAddress);
			
			OrderProductsDAO.insertIntoOrderProducts(customerID, orderID);
			ShoppingCartDAO.initShoppingCart(customerID);
			
			url = "/final.jsp?orderID="+orderID;
			msg = "";
			
			request.setAttribute("msg", msg);
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);	
		
	}

}
