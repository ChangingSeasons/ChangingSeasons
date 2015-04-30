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
		if(loggedIn != null){
	%>
	<form class="form-horizontal" action="/ChangingSeasons/" method="post">
		<fieldset>

			<!-- Form Name -->
			<div class="page-header">
				<h1>
					<span class="title">Update Profile</span>
				</h1>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="username">Username: abc</label>
			</div>

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="password">Password: </label>
				<div class="col-md-4">
					<input id="password" name="password" type="password" class="form-control input-md">

				</div>
			</div>

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="passwordc">Confirm Password: </label>
				<div class="col-md-4">
					<input id="passwordc" name="passwordc" type="password" class="form-control input-md">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="company">Company Name: </label>
				<div class="col-md-4">
					<input id="company" name="company" type="text"class="form-control input-md">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="firstname">First Name: </label>
				<div class="col-md-4">
					<input id="firstname" name="firstname" type="text" class="form-control input-md">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="middlename">Middle Name: </label>
				<div class="col-md-4">
					<input id="middlename" name="middlename" type="text" class="form-control input-md">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="lastname">Last Name: </label>
				<div class="col-md-4">
					<input id="lastname" name="lastname" type="text" class="form-control input-md">
				</div>
			</div>

			<!-- Text area -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="address">Address: </label>
				<div class="col-md-4">
					<textarea class="form-control" id="address" name="address"></textarea>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="phone">Phone Number: </label>
				<div class="col-md-4">
					<input id="phone" name="phone" type="text" class="form-control input-md">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="accoutno">Bank Account Number</label>
				<div class="col-md-4">
					<input id="accoutno" name="accoutno" type="text" class="form-control input-md">
				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="routingno">Routing Number</label>
				<div class="col-md-4">
					<input id="routingno" name="routingno" type="text" class="form-control input-md">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="paypal">Paypal ID: </label>
				<div class="col-md-4">
					<input id="paypal" name="paypal" type="text" class="form-control input-md">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="email">Email: </label>
				<div class="col-md-4">
					<input id="email" name="email" type="text" class="form-control input-md">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="submit"></label>
				<div class="col-md-4">
					<button type="submit" id="submit" name="submit"
						class="btn btn-default">Update</button>
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