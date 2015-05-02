<%@page import="model.OrderProducts"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="model.OrderDAO"%>
<%@page import="model.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
<%
HashMap<Order, List<OrderProducts>> orders; 
if (user.getType().equals("sel")) orders = OrderDAO.orderSellers(user.getID());
if (user.getType().equals("buy")) orders = OrderDAO.orderDetails(user.getID());
else orders = OrderDAO.orderDetails(user.getID());
%>

	<!-- Welcome -->
	<div class="page-header">
		<h1>
			<span class="title">My Orders</span> <br /> 
		</h1>
	</div>

	<div class="container">
	  <h4>Order Details</h4>
	  <table class="table table-striped" align="center">
	    <thead>
	      <tr>
	      	<th>Sl no</th>
	        <th>Order ID</th>
	        <th>Date Of Order</th>
	        <th>Date Of Shipping</th>
	        <th>Order Status</th>
	        <th>Shipping Address</th>
	        <th>Cost</th>
	      </tr>
	    </thead>
	       <tbody>
	    <%
	    	int count;
	    	for (Order order : orders.keySet()) {
	    %>
	    		<tr>
	    		<td> </td>
	    		</tr>
	    		<%
				for (;; ) { 
				%>
	 
	      <tr>
	        <td><% out.write(""); %></td>
	        <td><% out.write(""); %></td>
	       	<td>25</td>
	        <td>29</td>
	        <td>Shipped</td>
	        <td>Albany</td>
	        <td>189</td>
	      </tr>

		<%
			}
	    }
	    
	    %>
		</tbody>
  </table>
	
	<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="cart"></label>
				<div class="col-md-4" >
					<button type="button" id="lproducts" name="lproducts" onclick="location.href = 'base_index.jsp';"
						class="btn btn-primary">Continue Shopping</button>
				</div>
			</div>
	
</div>
</div>

<%@ include file="footer.jsp"%>
