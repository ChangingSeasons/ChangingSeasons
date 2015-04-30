<%@page import="model.Product"%>
<%@page import="model.ShoppingCart"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
<%
	ShoppingCart cart = ShoppingCartDAO.cartDetails(user.getID());
	HashMap<Product, Integer> cartProducts = cart.getHm();
%>
	<!-- Welcome -->
	<div class="page-header">
		<h1>
			<span class="title">Shopping cart</span> <br /> 
		</h1>
	</div>

	<div class="container">
	  <h4>Your shopping bag</h4>
	  <table class="table table-bordered" align="center">
	    <thead>
	      <tr>
	        <th>Product</th>
	        <th>Price</th>
	        <th>Quantity</th>
	        <th>Total</th>
	        <th></th>
	      </tr>
	    </thead>
	    <%
	    		if (cartProducts != null) {
				for (Product p : cartProducts.keySet()) {
		%>
	    <tbody>
	      <tr>
	        <td> test </td>
	        <td><%=p.getProductName() %></td>
	       <td> <select id="selectYear" style="width:auto;" class="form-control selectWidth">
                   <option class="">01</option>
                   <option class="">02</option>
                   <option class="">03</option>
                   <option class="">04</option>
                   <option class="">05</option>
                   <option class="">06</option>
                   <option class="">07</option>
                   <option class="">08</option>
                   <option class="">09</option>
                   <option class="">10</option>
                 </select>
             </td>
	        <td><%=p.getProductName() %></td>
	        <td>
	        <button type="submit" id="submit" name="submit"
							class="btn btn-default">Delete</button></td>
	      </tr>
	    </tbody>
			<%
				}
				}
			%>
		</table>
  
	 <div style="text-align: right; width:30%;margin-left:800px;"">
		 <div class="panel panel-default" >
			<div class="panel-body">
			<h4>
			Sub Total:<%=cart.getTotalPrice() %></br>
			Sales Tax:</br>
			<hr>
			Order Total: 
			</h4>
			</div>
		</div>
	</div>
	
	<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="cart"></label>
				<div class="col-md-4" >
					<button type="button" id="lproducts" name="lproducts" onclick="location.href = 'list_products.jsp';"
						class="btn btn-primary">Continue Shopping</button>
					<button type="button" id="checkout" name="checkout" onclick="location.href = 'checkout.jsp';"
						class="btn btn-primary">Checkout</button>
				</div>
			</div>
	
</div>
</div>

<%@ include file="footer.jsp"%>
