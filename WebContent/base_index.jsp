<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<%
	String iloggedIn = (String) session.getAttribute("loggedIn");
	User u = (User)session.getAttribute("user");
	String msg = (String) request.getAttribute("msg");
	if(msg == null)
		msg="";
	out.write("<h3>"+msg+"</h3>");
	if(iloggedIn == "true")
		out.write("<h3>Hello " + u.getFirstname()+" "+u.getLastname()+"</h3><br>");
	else{
		if(u == null)
	out.write("<div class=\"alert alert-danger\" role=\"alert\">You are not logged in!</div>");
		else
	out.write(" ");
	}
%>


<%@ include file="footer.jsp"%>