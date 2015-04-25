<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
<%
	String msg = (String) request.getAttribute("msg");
	if(msg == null)
		msg="";
	out.write("<h3>"+msg+"</h3>");
	if(!loggedIn.equals(""))
		out.write("<div class=\"alert alert-success\" role=\"alert\">Hello " + user.getFirstname()+" "+user.getLastname()+"</div>");
	else{
	out.write("<div class=\"alert alert-danger\" role=\"alert\">You are not logged in!</div>");
	}
%>
</div>

<%@ include file="list_products.jsp" %>

<%@ include file="footer.jsp"%>