<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">

	<!-- Welcome -->
	<div class="page-header">
		<h1>
			Select a shipping address
			<br /> <small>Is the address you'd like to use displayed below? If so, click the corresponding "Ship to this address" button. Or you can enter a new shipping address.</small>
		</h1>
	</div>


<% String msg = (String)request.getAttribute("msg");
	if(msg != null) {
		if (msg.equals("You have logged out!")) out.write("<div class=\"alert alert-success\" role=\"alert\">"+msg+"</div>");
		else out.write("<div class=\"alert alert-danger\" role=\"alert\">"+msg+"</div>");
	}
%>

	<form class="form-horizontal" action="/ChangingSeasons/" method="post">
		<fieldset>

<!-- Display Name and Address of the customer -->
			
			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="submit"></label>
				<div class="col-md-4">
					<button type="button" id="submit" name="submit" onclick="location.href = 'cardDetails.jsp';"
						class="btn btn-primary">Ship to this address</button>
				</div>
			</div>
            
            <hr />
            
            <h3>Add a new address<br/>
            <small>Be sure to click "Ship to this address" when done.</small></h3><br/>
            
            <!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="fullname">Full Name</label>
				<div class="col-md-4">
					<input id="fullname" name="fullname" type="text"
						placeholder="fullname" class="form-control input-md">

				</div>
			</div>
            
            <!-- Text area -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="address">Address</label>
				<div class="col-md-4">
					<textarea class="form-control" id="address" name="address"></textarea>
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
					<button type="button" id="submit" name="submit" onclick="location.href = 'cardDetails.jsp';"
						class="btn btn-primary">Ship to this address</button>
				</div>
			</div>


<%@ include file="footer.jsp"%>
