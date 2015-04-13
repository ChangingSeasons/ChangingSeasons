<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="nav.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	String loggedIn = (String) session.getAttribute("loggedIn");
	User u = (User)session.getAttribute("user");
	String msg = (String) request.getAttribute("msg");
	if(msg == null)
		msg="";
	out.write("<h3>"+msg+"</h3>");
	if(loggedIn == "true")
		out.write("<h3>Hello " + u.getFirstname()+" "+u.getLastname()+"</h3><br>");
	else{
		if(u == null)
	out.write("<h3>You are not logged in!</h3>");
		else
	out.write(" ");
	}
%>
<link rel="stylesheet" href="mystyle.css" type="text/css" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<body>

</body>
<% if(loggedIn!=null){
	
%>
<div id="footer">
	<%@ include file="logout.jsp" %>
</div>
<%} %>
</html>