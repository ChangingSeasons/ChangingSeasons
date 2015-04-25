<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">
	<div class="row">
		<%
			for (int i = 0; i < 20; i++) {
		%>
		<div class="col-sm-5 col-md-3">
			<div class="thumbnail">
				<img src="imgs/CKCotton.png" alt="...">
				<div class="caption">
					<h3>Product Name</h3>
					<p>
						Price:
						<% out.write(i*1000+""); %>
					</p>
					<p>

						<a href="#" class="btn btn-primary btn-xs" role="button">View
							Product</a> <a href="#" class="btn btn-default btn-xs" role="button">Edit
							Product</a>
					</p>
				</div>
			</div>
		</div>

		<%
			}
		%>
	</div>
</div>
<%@ include file="footer.jsp"%>