<%@page import="model.AuthDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="nav.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUp</title>
</head>
<link rel="stylesheet" href="mystyle.css" type="text/css" />
<% 
	String msg = (String)request.getAttribute("msg");
	if(msg == null)
		msg="";
	out.write("<h3>"+msg+"</h3>");
	
	String loggedIn = (String) session.getAttribute("loggedIn");
	if(loggedIn == null){
%>


<body>
<form action="/ChangingSeasons/SignupServlet" name = "signup" method="post">
		<h4>Fill out the following form in order to register with changingseasons</h4>
		<h4>We will save the details you provide in order to facilitate your purchases on our website.</h4>
		Username: <input type="text" name="username" placeholder="userid">
		<input type="submit" value="Check Username Availability" name="check">
		<br>FirstName: <input type="text" name="firstname" placeholder="firstname"></br>
		LastName: <input type="text" name="lastname" placeholder="lastname"></br>
		Address: <input type="text" name="address" placeholder="Street name,apt no,state,city-pincode"></br>
		Email: <input type="text" name="email" placeholder="example@xyz.com"></br>
		Password: <input type="password" name="password" placeholder="password"></br>
		Confirm Password: <input type="password" name="cpassword" placeholder="password"></br>
		<input type="submit" value="Sign Up" name="submit">
		<input type="reset" value="Reset" name="reset"></br></br>
		Already registered!! <a href="login.jsp">Login Here</a>
	</form>

</body>

<% }
	
	if(loggedIn!=null)
		out.write("<h3>You are already LoggedIn!</h3>");%>
</html>