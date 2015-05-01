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
	out.write("user id: "+user.getID()+ " cart id: "+cart.getCartID());
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
	  <table class="table" align="center">
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
	    			out.write("Cart products = "+cartProducts.size());
				for (Product p : cartProducts.keySet()) {
					double total_price = p.getPrice() * cartProducts.get(p);
		%>
	    <tbody>
	      <tr>
	        <td> <%=p.getProductName() %> </td>
	        <td> <%=p.getPrice()%></td>
	       <td> <select id="quantity" style="width:auto;" class="form-control selectWidth">
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
	        <td><%=total_price%></td>
	        <td>
	        <button type="submit" id="submit" name="submit"
							class="btn btn-default">Delete</button></td>
	      </tr>
	    </tbody>
			<%
					}
				} else out.write("No Cart Product found");
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
					<button type="button" id="lproducts" name="lproducts" onclick="location.href = 'base_index.jsp';"
						class="btn btn-primary">Continue Shopping</button>
					<button type="button" id="checkout" name="checkout" onclick="location.href = 'checkout.jsp?cart=<%=cart.getCartID()%>';"
						class="btn btn-primary">Checkout</button>
				</div>
			</div>
	
</div>
</div>

<%@ include file="footer.jsp"%>
