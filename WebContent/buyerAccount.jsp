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
	<form class="form-horizontal" action="/ChangingSeasons/MyAccount" method="post">
		<fieldset>

			<!-- Form Name -->
			<div class="page-header">
				<h1>
					<span class="title">User Profile</span>
				</h1>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="username">Username: </label>
			</div>

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="password">Password: </label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="firstname">First Name: </label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="middlename">Middle Name: </label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="lastname">Last Name: </label>
			</div>

			<!-- Text area -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="address">Address: </label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="phone">Phone Number: </label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="paypal">Paypal ID: </label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="email">Email: </label>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="submit"></label>
				<div class="col-md-4">
					<button type="button" id="submit" name="submit"
						onclick="location.href = 'editBuyer.jsp';"
						class="btn btn-primary">Edit my profile</button>
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