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
<form action="/Lab03/SignupServlet" name = "signup" method="post">
		Username: <input type="text" name="username">
		<input type="submit" value="Check Username Availability" name="check">
		<br>FirstName: <input type="text" name="firstname"></br>
		LastName: <input type="text" name="lastname"></br>
		Password: <input type="password" name="password"></br>
		Confirm Password: <input type="password" name="cpassword"></br>
		<input type="submit" value="Sign Up" name="submit">
		<input type="reset" value="Reset" name="reset">
	</form>

</body>

<% }
	
	if(loggedIn!=null)
		out.write("<h3>You are already LoggedIn!</h3>");%>


<div id="footer">
	<%@ include file="logout.jsp" %>
</div>
</html>