<%@page import="java.util.List"%>
<%@page import="model.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">

<% 
	List<User> buyers  = AdminDAO.listCustomers();
	%>

	<!-- Welcome -->
	<div class="page-header">
		<h1>
			<span class="title">Customer Details</span> <br /> 
		</h1>
	</div>

	<div class="container">
	  <table class="table table-bordered" align="center">
	    <thead>
	      <tr>
	        <th>Sl no</th>
	        <th>User Name</th>
	        <th>First Name</th>
	        <th>Last Name</th>
	        <th>Address</th>
	        <th>Email</th>
	        <th>Phone Number</th>
	        <th>PayPal ID</th>
	        <th>Status</th>
	        <th></th>
	      </tr>
	    </thead>
	     <tbody>
	    <%
				for (User b : buyers) {
		%>
	   
	      <tr>
	        <td><%  %></td>
	        <td><%= b.getUsername() %></td>
	        <td><%= b.getFirstname() %></td>
	        <td><%= b.getLastname() %></td>
	        <td><%= b.getAddress() %></td>
	        <td><%= b.getEmail() %></td>
	        <td><%= b.getPhone() %></td>
	        <td><%= b.getPayPalID() %></td>
	        <td><%= b.isStatus() %></td>
	        <td>
	        <button type="submit" id="submit" name="submit"
							class="btn btn-default">Deactivate</button></td>
	      </tr>
	   
	    <%
				}
			%>
			 </tbody>
  </table>
	
</div>
</div>

<%@ include file="footer.jsp"%>
