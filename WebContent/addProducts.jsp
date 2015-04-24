<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
	<% 
		String msg = (String)request.getAttribute("msg");
		if(msg == null) msg="";
		if(!msg.equals("")) out.write("<div class=\"alert alert-danger\" role=\"alert\">"+msg+"</div>");
		
		String logIn = (String) session.getAttribute("loggedIn");
		if(loggedIn == null){
	%>
	<form class="form-horizontal" action="/ChangingSeasons/AddProduct" method="post">
		<fieldset>

			<!-- Form Name -->
			<div class="page-header">
				<h1>
					Add Products <br/>
					<small>Please enter the details of the jacket you want to add.</small>
				</h1>
			</div>
			
			<!-- Text input-->
			<div class="form-group required">
				<label class="col-md-4 control-label" for="productName">Product Name</label>
				<div class="col-md-4">
					<input id="productName" name="productName" type="text"
					 class="form-control input-md" required="required">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group required">
				<label class="col-md-4 control-label" for="type">Product Type</label>
				<div class="col-md-4">
					<input id="type" name="type" type="text"
					 class="form-control input-md" required="required">
				</div>
			</div>
			
			<!-- Text area -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="productDesc">Product Description</label>
				<div class="col-md-4">
					<textarea class="form-control" id="productDesc" name="productDesc"></textarea>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group required">
				<label class="col-md-4 control-label" for="price">Price</label>
				<div class="col-md-4">
					<input id="password" name="price" type="price"
					 class="form-control input-md" required="">

				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group required">
				<label class="col-md-4 control-label" for="quantity">Quantity</label>
				<div class="col-md-4">
					<input id="quantity" name="quantity" type="text"
					 class="form-control input-md" required="required">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group required">
				<label class="col-md-4 control-label" for="shippingCost">Shipping Cost</label>
				<div class="col-md-4">
					<input id="shippingCost" name="shippingCost" type="password"
					class="form-control input-md" required="">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="size">Size</label>
				<div class="col-md-4">
					<input id="size" name="size" type="text" class="form-control input-md">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="color">Color</label>
				<div class="col-md-4">
					<input id="color" name="color" type="text" class="form-control input-md">
				</div>
			</div>
			
			<!-- Image Upload-->
			<div class="form-group required">
				<label class="col-md-4 control-label" for="image">Image</label>
				<div class="col-md-4">
					<input type="text" name="imageName" placeholder="Name of the Image" class="form-control input-md">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="image">Please choose an image you want to upload</label>
				<div class="col-md-4">
					<input type="file" name="datafile">
				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="submit"></label>
				<div class="col-md-4">
					<button type="submit" id="submit" name="submit" class="btn btn-info">Submit</button>
				</div>
			</div>

		</fieldset>
	</form>
	<% }
	
	if(logIn!=null)
		out.write("<h3>You are already LoggedIn!</h3>");%>

</div>
<!-- /container -->

<%@ include file="footer.jsp"%>