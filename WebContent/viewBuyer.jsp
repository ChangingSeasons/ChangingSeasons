<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">

	<!-- Welcome -->
	<div class="page-header">
		<h1>
			<span class="title">Customer Details</span> <br /> 
		</h1>
	</div>

	<div class="container">
	  <table class="table table-bordered" align="center">
	    <thead>
	      <tr>
	        <th>Sl no</th>
	        <th>First Name</th>
	        <th>Last Name</th>
	        <th>Address</th>
	        <th>Email</th>
	        <th>Phone Number</th>
	        <th>PayPal ID</th>
	        <th>Status</th>
	        <th></th>
	      </tr>
	    </thead>
	    <%
				for (int i = 1; i < 4; i++) {
		%>
	    <tbody>
	      <tr>
	        <td><% out.write(i*1+""); %></td>
	        <td>Anna</td>
	        <td>Bella</td>
	        <td>New York</td>
	        <td>xyz@gmail.com</td>
	        <td>5188947655</td>
	        <td>000998</td>
	        <td>Active</td>
	        <td>
	        <button type="submit" id="submit" name="submit"
							class="btn btn-default">Deactivate</button></td>
	      </tr>
	    </tbody>
	    <%
				}
			%>
  </table>
	
</div>
</div>

<%@ include file="footer.jsp"%>
