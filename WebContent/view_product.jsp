<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
<%
	Product product = (Product) request.getAttribute("product");
	if(product != null ) { 
%>

	<h2><% out.write(product.getProductName()); %></h2>

	<div class="row">
		<div class="col-md-6">
			<img src="<% out.write(product.getImagePath()); %>" alt="" width="300" class="img-rounded" />
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-body">

					<p>
						<strong>Product Description</strong> 
						<% out.write(product.getProductDesc()); %>
					</p>
					<p>
						<strong>Product Price</strong> <% out.write(product.getPrice()+""); %>
					</p>
					<p> <strong>Rate this Product:</strong> </p>
					<script type="text/javascript">
					$("#input-id").rating();
					 
					// with plugin options
					$("#input-id").rating(['min'=>1, 'max'=>5, 'step'=>1, 'size'=>'sm']);
					</script>
					<input id="input-id" type="number" class="rating" min=1 max=5 step=1 data-size="sm" data-ltr="true">
					<script type="text/javascript">
					$(function(){
    				$("#rating_1").rating({
       				 static: false,
			        score: 2,
			        stars: 5,
			        showHint: true,
			        hints: ['bad', 'poor', 'regular', 'good', 'gorgeous'],
			        showScore: true,
			        scoreHint: "Current score: ",
			    });
			});
					</script>
				</div>
			</div>

			<button type="button" class="btn btn-success">Add to Card</button>

			<!-- Contextual button for informational alert messages -->
			<button type="button" class="btn btn-info">Edit</button>
		</div>
	</div>
	
	<% } else out.write("No product found"); %>
</div>


<%@ include file="footer.jsp"%>