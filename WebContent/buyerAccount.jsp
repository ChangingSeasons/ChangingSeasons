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
				<label class="col-md-4 control-label" for="username">Username: <% out.write(user.getUsername()); %></label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="firstname">First Name: <% out.write(user.getFirstname()); %></label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="middlename">Middle Name: <% out.write(user.getMiddlename()); %></label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="lastname">Last Name: <% out.write(user.getLastname()); %></label>
			</div>

			<!-- Text area -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="address">Address: <% out.write(user.getAddress()); %></label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="phone">Phone Number: <% out.write(user.getPhone()+""); %></label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="paypal">Paypal ID: <% out.write(user.getPayPalID() != null ? user.getPayPalID() : "Not Entered"); %></label>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="email">Email: <% out.write(user.getEmail()); %></label>
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