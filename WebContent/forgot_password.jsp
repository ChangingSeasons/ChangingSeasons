<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">

	<!-- Welcome -->
	<div class="page-header">
		<h1>
			Forgot your password? <br /> 
			<small> No problem! we will help you reset </small>
		</h1>
	<form class="form-horizontal" action="/ChangingSeasons/ForgotPassServlet" method="post">
	<fieldset>
	</div>
			<!-- Text input-->
			<div class="form-group required">
				<label class="col-md-4 control-label" for="username">Username</label>
				<div class="col-md-4">
					<input id="username" name="username" type="text"
						placeholder="username" class="form-control input-md" required="required">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group required">
				<label class="col-md-4 control-label" for="email">Email</label>
				<div class="col-md-4">
					<input id="email" name="email" type="text" placeholder="Email"
						class="form-control input-md" required="">

				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="phone">Phone
					Number</label>
				<div class="col-md-4">
					<input id="phone" name="phone" type="text"
						placeholder="Phone Number" class="form-control input-md">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="submit"></label>
				<div class="col-md-4">
					<button type="submit" id="submit" name="submit" class="btn btn-info">Submit</button>
				</div>
			</div>
	
	
</div>
<!-- /container -->

<%@ include file="footer.jsp"%>