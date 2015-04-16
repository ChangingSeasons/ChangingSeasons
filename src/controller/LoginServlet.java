package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static model.AuthDAO.*;
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String msg="", url="";
		String loggedIn = "false";
		if(username.length()==0 || password.length()==0){
			if(username.length()==0){
				msg = "Please enter Username!";
				url = "/base_login.jsp";
				loggedIn = "false";
				request.setAttribute("loggedIn", loggedIn);
				request.setAttribute("msg", msg);
			}
			else{
				msg = "Please enter Password!";
				url = "/base_login.jsp";
				loggedIn = "false";
				request.setAttribute("loggedIn", loggedIn);
				request.setAttribute("msg", msg);
			}
		}
		else{
			int ID=checkUserpass(username, password);
			if(ID!=-1){ //User Is Authenticated
				loggedIn = "true";
				HttpSession se = request.getSession();
				se.setAttribute("user", getUserbyId(ID));
				se.setAttribute("loggedIn", loggedIn);
				url = "/base_index.jsp";
				msg = "Login Successful!";
				
				request.setAttribute("loggedIn", loggedIn);
				request.setAttribute("msg", msg);
			}
			else{
				msg = "Invalid Username/Password";
				url = "/base_login.jsp";
				loggedIn = "false";
				request.setAttribute("loggedIn", loggedIn);
				request.setAttribute("msg", msg);
			}
		}
		DB_close(); //Connection to DB Closed
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);	
	}

}
