<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="navbar.jsp"%>

<div class="container">

	<!-- Welcome -->
	<div class="page-header">
		<h1>
			<span class="title">Seller Details</span> <br /> 
		</h1>
	</div>

	<div class="container">
	  <table class="table table-bordered" align="center">
	    <thead>
	      <tr>
	        <th>Sl no</th>
	        <th>User Name</th>
	        <th>Company Name</th>
	        <th>Address</th>
	        <th>Email</th>
	        <th>Phone Number</th>
	        <th>PayPal ID</th>
	        <th>Bank Account Number</th>
	        <th>Routing Number</th>
	        <th >Status</th>
	      </tr>
	    </thead>
	    <%
				for (int i = 1; i < 4; i++) {
		%>
	    <tbody>
	      <tr>
	        <td><% out.write(i*1+""); %></td>
	        <td>bb</td>
	        <td>DC</td>
	        <td>New York</td>
	        <td>xyz@gmail.com</td>
	        <td>5188947655</td>
	        <td>000998</td>
	        <td>237hjdy2389</td>
	        <td>bofa456</td>
	        <td>
			<input type="checkbox" id="myToggleButton" />
			<label for="myToggleButton">Authorization</label>
			</td>
	      </tr>
	    </tbody>
	    <%
				}
			%>
  </table>
	
</div>
</div>

<%@ include file="footer.jsp"%>
