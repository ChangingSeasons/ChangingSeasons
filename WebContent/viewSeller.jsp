<%@page import="java.util.List"%>
<%@page import="model.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">

<% 
	List<User> sellers  = AdminDAO.listSellers();
	if (sellers != null) {
%>
	
	<!-- Welcome -->
	<div class="page-header">
		<h1>
			<span class="title">Seller Details</span> <br /> 
		</h1>
	</div>

	<div class="container">
	  <table class="table table-bordered" align="center">
	    <thead>
	      <tr>
	        <th>Sl no</th>
	        <th>User Name</th>
	        <th>Company Name</th>
	        <th>Address</th>
	        <th>Email</th>
	        <th>Phone Number</th>
	        <th>PayPal ID</th>
	        <th>Bank Account Number</th>
	        <th>Routing Number</th>
	        <th >Status</th>
	      </tr>
	    </thead>
	     <tbody>
	    <%
	  			for (User s : sellers) {
		%>
	   
	      <tr>
		        <td><%  %></td>
	        <td><%= s.getUsername() %></td>
	        <td><%= s.getCompanyName() %></td>
	        <td><%= s.getAddress() %></td>
	        <td><%= s.getEmail() %></td>
	        <td><%= s.getPhone() %></td>
	        <td><%= s.getPayPalID() %></td>
	        <td><%= s.getBankAccount() %></td>
	        <td><%= s.getRoutingNumber() %></td>
	        <td><%= s.isStatus() %></td>
	        <td>
			<input type="checkbox" id="myToggleButton" />
			<label for="myToggleButton">Authorization</label>
			</td>
	      </tr>
	 
	    <%
				}
			%>
			   </tbody>
  </table>
</div>
<% } else out.write("No Sellers found"); %>
</div>

<%@ include file="footer.jsp"%>
