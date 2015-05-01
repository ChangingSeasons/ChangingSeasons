package controller;
import model.Order;
import model.Product;
import model.User;
import static model.EmailDAO.*;
import static model.AdminDAO.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static model.OrderDAO.*;
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
				String email = (String)request.getParameter("email");
				authorizeSeller(true, ID);
				msg = "Seller Authorized!";
				sendMail(email, "Authorization Status", "Thank you for Registering with Us. You have been Authorized by the Admin. We wish you a pleasant selling experience!");
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
		else if(action.equals("ListCustomers")){
			List<User> customers = listCustomers();
			request.setAttribute("customers", customers);
			url = "/base_index.jsp";
		}
		else if(action.equals("ListSellers")){
			List<User> sellers = listSellers();
			request.setAttribute("sellers", sellers);
			url = "/base_index.jsp";
		}
		else if(action.equals("ListAdmins")){
			List<User> admins = listAdmins();
			request.setAttribute("admins", admins);
			url = "/base_index.jsp";
		}
		else if(action.equals("ListProducts")){
			List<Product> products = getProducts();
			request.setAttribute("Products", products);
			url = "/base_index.jsp";
		}
		else if(action.equals("EditProducts")){


			url = "/base_index.jsp";
		}
		else if(action.equals("DeleteProduct")){
			
			int productID = Integer.parseInt(request.getParameter("productID"));
			
			deleteProduct(productID);

			url = "/base_index.jsp";
		}
		else if(action.equals("ViewOrders")){

			List<Order> order = orderDetails();
			request.setAttribute("Orders", order);
			url = "/base_index.jsp";
		}
		else if(action.equals("EditOrder")){


			url = "/base_index.jsp";
		}
		else if(action.equals("DeleteOrder")){
			
			int orderID = Integer.parseInt(request.getParameter("orderID"));
			deleteOrder(orderID);

			url = "/base_index.jsp";
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);	

	}

}
