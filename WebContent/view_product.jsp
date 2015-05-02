<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
	<%
		Product product = (Product) request.getAttribute("product");
		if (product != null) {
	%>
	<div class="container">
		<p class="text-center">
		<h1><%=product.getProductName()%></h1>


		<div class="col-md-6">
			<img src="<%=product.getImagePath()%>" alt="" width="300"
				class="img-rounded" />
		</div>
		<form class="form-horizontal"
			action="/ChangingSeasons/AddtoCartServlet" method="post">
			<fieldset>
				<div class="panel panel-default">
					<div class="panel-body">

						<div class="form-group">
							<label class="col-md-4 control-label" for="description">
								Description</label>
							<div class="col-md-4">
								<p class="form-control-static"><%=product.getProductDesc()%></p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label" for="color">Color</label>
							<div class="col-md-4">

								<select name="color" id="color" class="form-control selectWidth">
									<option class="">Black</option>
									<option class="">White</option>
									<option class="">Red</option>
									<option class="">Brown</option>
									<option class="">Grey</option>
									<option class="">Blue</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label" for="color">Size</label>
							<div class="col-md-4">
								<select name="size" id="size" class="form-control selectWidth">
									<option class="">XS</option>
									<option class="">S</option>
									<option class="">M</option>
									<option class="">L</option>
									<option class="">XL</option>
									<option class="">XXL</option>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label class="col-md-4 control-label" for="color">Quantity</label>
							<div class="col-md-4">
								<select name="quantity" id="quantity"
									class="form-control selectWidth">
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
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label" for="price"> Price</label>
							<div class="col-md-4">
								<p class="form-control-static">
									<%=product.getPrice()%>
								</p>
							</div>
						</div>

						<input type="hidden" name="userID" value="<%=user.getID() + ""%>">
						<input type="hidden" name="productID"
							value="<%=product.getProductID() + ""%>">

						<div class="form-group">
							<label class="col-md-4 control-label" for="price"> </label>
							<div class="col-md-4">
								<%
									if (!user.getType().equals("buy")) {
								%>
								<button type="button" class="btn btn-info" onclick="location.href = 'editProduct.jsp';">Edit</button>
								<%
									} else {
								%>
								<input type="submit" class="btn btn-success" role="button"
									value="Add to Cart" />
								<%
									}
								%>
							</div>
						</div>

						<p class="text-center">
							
							<script type="text/javascript">
											$("#input-id").rating();
											 
											// with plugin options
											$("#input-id").rating(['min'=>1, 'max'=>5, 'step'=>1, 'size'=>'sm']);
											</script>
							<input id="input-id" type="number" class="rating" min=1 max=5
								step=1 data-size="sm" data-ltr="true">
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
						</p>
					</div>
				</div>
			</fieldset>
		</form>


	</div>
	<%
		} else
			out.write("No product found");
	%>



</div>

<%@ include file="footer.jsp"%>