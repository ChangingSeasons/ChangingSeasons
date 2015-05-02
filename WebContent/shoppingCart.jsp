<%@page import="model.Product"%>
<%@page import="model.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
	<%
	ShoppingCart cart = ShoppingCartDAO.cartDetails(user.getID());
	List<Product> cartProducts = cart.getCartProducts();
	%>

	<!-- Breadcrumb -->
	<ul class="breadcrumb">
		<li class="active">Shopping Cart</li>
	</ul>

	<!-- Welcome -->

	<div class="page-header">
		<h1>
			<span class="title">Shopping cart</span> <br />
		</h1>
	</div>

	<div class="container">
		<table class="table table-striped" align="center">
			<thead>
				<tr>
					<th>Product</th>
					<th>Color </th>
					<th>Size </th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total</th>
					<th></th>
				</tr>
			</thead>
			<%
	    		if (cartProducts != null) {
					for (Product p : cartProducts) {
						double total_price = p.getPrice() * p.getQuantity();
		%>
			<tbody>
				<tr>
					<td><%=p.getProductName() %></td>
					<td> <%=p.getColor() %> </td>
					<td> <%=p.getSize() %> </td>
					<td> 
					<%=p.getQuantity() %>
					<!--  
							<select id="quantity" style="width: auto;" class="form-control selectWidth">
							<% 
							for (int i=0;i<20;i++) {
								String nonselected = "<option>"+i+"</option>";
								String selected = "<option selected>"+i+"</option>";
								if (i == p.getQuantity()) out.write(selected);
								else out.write(nonselected);
							}
							%>
							</select>
					 -->
					</td>
					<td><%=total_price%></td>
					<td><a
						href="RemoveFromCartServlet?cartProductID=<%=p.getCartProductID()%>&userID=<%=user.getID() %>">
							<button type="submit" id="submit" name="submit"
								class="btn btn-default">Delete</button>
					</a></td>
				</tr>
			</tbody>
			<%
					}
				} else out.write("No Cart Product found");
			%>
		</table>

		<div style="text-align: right; width: 30%; margin-left: 800px;"">
			<div class="panel panel-default">
				<div class="panel-body">
					<h4>
						Sub Total:<%=cart.getTotalPrice() %></br> Sales Tax: 8.00%</br>
						<hr>
						Order Total:<%=cart.getTotalWithtax() %>
					</h4>
				</div>
			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="cart"></label>
			<div class="col-md-4">
				<button type="button" id="lproducts" name="lproducts"
					onclick="location.href = 'base_index.jsp';"
					class="btn btn-defaulty">Continue Shopping</button>
				<button type="button" id="checkout" name="checkout"
					onclick="location.href = 'checkout.jsp?cart=<%=cart.getCartID()%>';"
					class="btn btn-primary">Checkout</button>
			</div>
		</div>

	</div>
</div>

<%@ include file="footer.jsp"%>
