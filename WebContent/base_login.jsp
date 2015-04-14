<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
	<form class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<div class="page-header">
				<h1>
					Welcome to <span class="title">Changing Seasons</span>
					<br/>
					<small>Please login to continue</small>
				</h1>
				
			</div>
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
					<button type="submit" id="submit" name="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
			
			<hr/>
			
			<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="signupradio">Sign Up As</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="signupradio-0">
      <input type="radio" name="signupradio" id="signupradio-0" value="Buyer" checked="checked">
      Buyer
    </label> 
    <label class="radio-inline" for="signupradio-1">
      <input type="radio" name="signupradio" id="signupradio-1" value="Seller">
      Seller
    </label>
   
  </div>
</div>

<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="signup"></label>
				<div class="col-md-4">
					 <button type="button" id="signup" name="signup" class="btn btn-primary">Sign Up</button>
				</div>
			</div>
			
		</fieldset>
	</form>


</div>
<!-- /container -->

<%@ include file="footer.jsp"%>