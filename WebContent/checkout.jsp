<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">

	<!-- Breadcrumb -->
	<ul class="breadcrumb">
		<li><a href="shoppingCart.jsp">Shopping Cart</a></li>
		<li class="active">Shipping Address</li>
	</ul>

	<!-- Welcome -->
	<div class="page-header">
		<h1>
			Select a shipping address <br /> <small>Is the address you'd
				like to use displayed below? If so, click the corresponding "Ship to
				this address" button. Or you can enter a new shipping address.</small>
		</h1>
	</div>

	<div class="container">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Current Address</h3>
			</div>
			<div class="panel-body">

				<form class="form-horizontal" action="" method="post">
					<!-- Address input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="fullname">Address</label>
						<div class="col-md-4">
						<div>
							<%= user.getAddress()%>
							</div>
							<!-- 
							<input class="form-control" id="disabledTextInput" type="text"
								placeholder="<%= user.getAddress()%>"> -->
						</div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="submit"></label>
						<div class="col-md-4">
							<button type="button" id="submit" name="submit"
								onclick="location.href = 'cardDetails.jsp';"
								class="btn btn-default">Ship to this address</button>
						</div>
					</div>
				</form>
			</div>
		</div>



		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					Add a new address<br /> <small>Be sure to click "Ship to
						this address" when done.</small>
				</h3>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" action="" method="post">


					<!-- Text input
					<div class="form-group">
						<label class="col-md-4 control-label" for="fullname">Full
							Name</label>
						<div class="col-md-4">
							<input id="fullname" name="fullname" type="text"
								placeholder="fullname" class="form-control input-md">

						</div>
					</div>
					-->
					<!-- Address area -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="address">Address</label>
						<div class="col-md-4">
							<textarea class="form-control" id="address" name="address"></textarea>
						</div>
					</div>

					<!-- Phone input
					<div class="form-group">
						<label class="col-md-4 control-label" for="phone">Phone
							Number</label>
						<div class="col-md-4">
							<input id="phone" name="phone" type="text"
								placeholder="Phone Number" class="form-control input-md">

						</div>
					</div>
					-->
					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="submit"></label>
						<div class="col-md-4">
							<button type="button" id="submit" name="submit"
								onclick="location.href = 'cardDetails.jsp';"
								class="btn btn-default">Ship to this address</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>