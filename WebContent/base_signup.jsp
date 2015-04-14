<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container" style="width: 35em">
	<form class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<legend>Form Name</legend>

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

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="passwordc">Confirm
					Password</label>
				<div class="col-md-4">
					<input id="passwordc" name="passwordc" type="password"
						placeholder="confirm password" class="form-control input-md"
						required=""> 
				</div>
			</div>
			<!-- Textarea -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="address">Address</label>
				<div class="col-md-4">
					<textarea class="form-control" id="address" name="address">Address</textarea>
				</div>
			</div>
		</fieldset>
	</form>


</div>
<!-- /container -->





<%@ include file="footer.jsp"%>