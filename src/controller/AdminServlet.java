package controller;
import model.Order;
import model.Product;
import model.User;
import static model.AdminDAO.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static model.Product.*;
import static model.Order.*;
import static model.OrderDAO.*;
import static model.OrderProductsDAO.*;
import static model.ProductDAO.*;
;/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
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
		String action = request.getParameter("action");

		String url = "", msg = "";

		if(action.equals("AuthorizeSeller")){
			int ID = Integer.parseInt(request.getParameter("ID"));
			boolean status = false;
			if(status){
				authorizeSeller(true, ID);
				msg = "Seller Authorized!";
			}
			else{
				authorizeSeller(false, ID);
				msg = "Seller De-Authorized!";
			}
			url = "/base_index.jsp";
			request.setAttribute("msg", msg);
		}
		else if(action.equals("DeleteUser")){
			int ID = Integer.parseInt(request.getParameter("ID"));
			deleteUser(ID);
			msg = "User Deleted";
			url = "/base_index.jsp";
			request.setAttribute("msg", msg);
		}
		else if(action.equals("ListUsers")){
			User [] u = listUsers();
			url = "/base_index.jsp";
			request.setAttribute("Users", u);
		}
		else if(action.equals("ListProducts")){
			Product[] p = productDetails();
			request.setAttribute("Products", p);
			url = "/base_index.jsp";
		}
		else if(action.equals("EditProducts")){


			url = "/base_index.jsp";
		}
		else if(action.equals("DeleteProduct")){


			url = "/base_index.jsp";
		}
		else if(action.equals("ViewOrders")){

			Order[] o = orderDetails();
			request.setAttribute("Orders", o);
			url = "/base_index.jsp";
		}
		else if(action.equals("EditOrder")){


			url = "/base_index.jsp";
		}
		else if(action.equals("DeleteOrder")){


			url = "/base_index.jsp";
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);	

	}

}
