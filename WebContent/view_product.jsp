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
			<img src="<%=product.getImagePath() %>" alt="" width="300" class="img-rounded" />
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-body">

					<p>
						<strong>Product Description: </strong> 
						<%=product.getProductDesc()%>
					</p>
					<p>
						<strong>Product Price: </strong> $<%=product.getPrice()+""%>
					</p>
					<p><strong>Quantity: </strong>
					<select id="selectYear" style="width:auto;" class="form-control selectWidth">
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
                   </select></p>
					
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
			<form  action="/ChangingSeasons/AddtoCartServlet" method="post">	
						<input type="hidden" name="userID" value="<%=user.getID()+""%>">
						<input type="hidden" name="productID" value="<%=product.getProductID()+""%>">
						<input type="submit" class="btn btn-success" role="button" value="Add to Cart"/>
			</form>
			<!-- Contextual button for informational alert messages -->
			<button type="button" class="btn btn-info">Edit</button>
		</div>
	</div>
	
	<% } else out.write("No product found"); %>
</div>


<%@ include file="footer.jsp"%>