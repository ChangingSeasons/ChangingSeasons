package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AuthDAO;
import static model.AuthDAO.*;
/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/VendorServlet")
public class VendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String check = request.getParameter("check"); //Check button for username
		String username = request.getParameter("username");
		String companyname = request.getParameter("companyname");
		String firstname = request.getParameter("firstname");
		String middlename = request.getParameter("middlename");
		String lastname = request.getParameter("lastname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String accno = request.getParameter("accno");
		String routno = request.getParameter("routno");
		String paypalid = request.getParameter("paypalid");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		String url = "", msg = "";
		int userId=0;
		boolean available = false;
		boolean status = false;
		int flag=0;
		if(username.length()==0){
			url = "/vendor.jsp";
			msg = msg + "Please fill-in Username";
			request.setAttribute("msg", msg);
			flag=0;
		}
		else{
			if( request.getParameter("check") != null){
				available = isUsernameAvailable(username);
				if(available){
					url = "/vendor.jsp";
					msg = msg + "\nUsername Available!";
					request.setAttribute("msg", msg);
					flag=1;
				}
				else{
					url = "/vendor.jsp";
					msg = msg + "\nUsername NOT available!";
					request.setAttribute("msg", msg);
					flag=0;
				}
			}
		}

		if(companyname.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Company name";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(firstname.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Firstname";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(middlename.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Middlename";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(lastname.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Lastname";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(address.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Address";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(phone.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Phone Number";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(accno.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Bank Account Number";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(routno.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Routing Number";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(paypalid.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in PayPal ID";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(email.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Email";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(password.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Password";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(cpassword.length()==0){
			url = "/vendor.jsp";
			msg = msg + "\nPlease fill-in Password again";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		if(! password.equals(cpassword)){
			url = "/vendor.jsp";
			msg = msg + "\nPassword does not match!";
			request.setAttribute("msg", msg);
			flag=0;
		}
		
		
		if(username.length()!=0 && firstname.length()!=0 && lastname.length()!=0
				&& password.length()!=0 && cpassword.length()!=0 && password.equals(cpassword))
			flag = 1;
			
		if(flag == 1){ //Everything is filled in
			
			userId = enterNewuser(username, cpassword);
			
			if(userId > 0){
				status = enterUsernameSeller(userId, firstname, lastname);
				
				if(status == true){
					msg = "Account Created Successfully";
					request.setAttribute("msg", msg);
					url = "/login.jsp";
				}
				else{
					msg = "UserName Insert Failed";
					request.setAttribute("msg", msg);
					url = "/vendor.jsp";
				}
			}
			
			else{
				msg = "Create Account Failed, Please Try Again!";
				request.setAttribute("msg", msg);
				url = "/vendor.jsp";
			}	
		}
		
		DB_close();
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);	
	}

}
