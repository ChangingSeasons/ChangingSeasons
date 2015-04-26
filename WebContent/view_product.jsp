<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<%
	
%>
<div class="container">
	<h2>Product Name</h2>

	<div class="row">
		<div class="col-md-6">
			<img src="imgs/CKLeatherJacket.png" alt="" width="300" class="img-rounded" />
			<h4>Rate this Product:</h4>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-body">

					<p>
						<strong>Product Description</strong> This is product Description.
						This is product Description.
						This is product Description.
						This is product Description.
						This is product Description.
						This is product Description.
						This is product Description.
						This is product Description.
						This is product Description.
						This is product Description.
					</p>
					<p>
						<strong>Product Price</strong> $100.00
					</p>
					<script type="text/javascript">
					$("#input-id").rating();
					 
					// with plugin options
					$("#input-id").rating(['min'=>1, 'max'=>10, 'step'=>2, 'size'=>'lg']);
					</script>
					<input id="input-id" type="number" class="rating" min=1 max=10 step=2 data-size="lg" data-rtl="true">
				</div>
			</div>

			<button type="button" class="btn btn-success">Add to Card</button>

			<!-- Contextual button for informational alert messages -->
			<button type="button" class="btn btn-info">Edit/Remove/Etc</button></br>
		</div>
	</div>
</div>


<%@ include file="footer.jsp"%>