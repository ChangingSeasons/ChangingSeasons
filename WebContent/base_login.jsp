<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">

	<!-- Welcome -->
	<div class="page-header">
		<h1>
			Welcome to <span class="title">Changing Seasons</span> <br /> <small>Please
				login to continue</small>
		</h1>
	</div>


<% String msg = (String)request.getAttribute("msg");
	if(msg == null)
		msg="";
	out.write("<h3>"+msg+"</h3>");
%>


	<div class="alert alert-success" role="alert">alert success!</div>
	<div class="alert alert-info" role="alert">alert info</div>
	<div class="alert alert-warning" role="alert">alert warning</div>
	<div class="alert alert-danger" role="alert">alert error!</div>


	<form class="form-horizontal" action="/ChangingSeasons/LoginServlet" method="post">
		<fieldset>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="username">Username</label>
				<div class="col-md-4">
					<input id="username" name="username" type="text"
						placeholder="username" class="form-control input-md" required="">

				</div>
			</div>

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="password">Password</label>
				<div class="col-md-4">
					<input id="password" name="password" type="password"
						placeholder="password" class="form-control input-md">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="submit"></label>
				<div class="col-md-4">
					<button type="submit" id="submit" name="submit"
						class="btn btn-default">Submit</button>
						<a class="btn btn-link" href="forgot.jsp" role="button">Forgot Password</a>
				</div>
			</div>
			


			<hr />

			<!-- Multiple Radios (inline) -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="signupradio">Sign
					Up As</label>
				<div class="col-md-4">
					<label class="radio-inline" for="signupradio-0"> <input
						type="radio" name="signupradio" id="signupradio-0" value="Buyer"
						checked="checked"> Buyer
					</label> <label class="radio-inline" for="signupradio-1"> <input
						type="radio" name="signupradio" id="signupradio-1" value="Seller">
						Seller
					</label>

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="signup"></label>
				<div class="col-md-4">
					<button type="submit" id="signup" name="signup"
						class="btn btn-primary">Sign Up</button>
				</div>
			</div>

		</fieldset>
	</form>
</div>
<!-- /container -->

<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"> Best Sellers </h3>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"> <img src="imgs/CKCotton.png"
						alt="CKCotton">
					</a>
				</div>
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"> <img
						src="imgs/CKLeatherJacket.png" alt="CKLeatherJacket">
					</a>
				</div>
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"> <img
						src="imgs/CKLightWeightJacket.png" alt="CKLightWeightJacket">
					</a>
				</div>
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail"> <img src="imgs/DD1.png"
						alt="DD1">
					</a>
				</div>
			</div>
		</div>
	</div>
</div>




<%@ include file="footer.jsp"%>