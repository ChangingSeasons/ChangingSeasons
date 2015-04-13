<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String loggedIn = (String) session.getAttribute("loggedIn"); 
if(loggedIn!=null){
	
%>

<div id="header">
	<%@ include file="nav.jsp" %>
</div>
<% }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>001217131 - Lab03</title>

<% String msg = (String)request.getAttribute("msg");
	if(msg == null)
		msg="";
	out.write("<h3>"+msg+"</h3>");
%>
<link rel="stylesheet" href="mystyle.css" type="text/css" />
</head>

<%	loggedIn = (String) session.getAttribute("loggedIn"); 
if(loggedIn==null){
	
%>
<body><a href = "signup.jsp">SignUp</a>
	<form action="/Lab03/LoginServlet" method="post">
		Username: <input type="text" name="username"></br>
		Password: <input type="password" name="password"></br>
		<input type="submit" value="Login" name="submit">
	</form>
</body>
<% }%>
<%  loggedIn = (String) session.getAttribute("loggedIn"); 
if(loggedIn!=null){
	out.write("<h3>You're logged In!</h3>");
%>
<div id="footer">
	<%@ include file="logout.jsp" %>
</div>
<%} %>
</html>