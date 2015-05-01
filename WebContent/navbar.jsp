<%@page import="model.ShoppingCartDAO"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<%
   		String loggedIn = session.getAttribute("loggedIn") == null ? "" : (String) session.getAttribute("loggedIn") ;
		
     	User user = null;
     	if (!loggedIn.equals("")) user = (User) session.getAttribute("user");
     	
     	// Setting test user for checking!
     	
     	if(user == null){
     		user = new User();
     		user.setFirstname("TEST");
     		user.setLastname("USER");
     		user.setType("buy");
     	}
     	
     		
      	String homeURL = "base_login.jsp";
    	if (!loggedIn.equals("")) homeURL = "base_index.jsp";%>
			<a class="navbar-brand" href="<% out.write(homeURL); %>"><span
				class="header"><img src="imgs/logo.jpg" alt="logo" width="80" />
					Changing Seasons</span></a>
		</div>




		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<%
			if (!loggedIn.equals("")) {
			%>
			<ul class="nav navbar-nav">
			
				<li class="active"><a href="base_index.jsp">Link <span
						class="sr-only">(current)</span></a></li>
				<li><a href="base_index.jsp">Home</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<% if (user.getType().equals("buy")) { %>
						<li><a href="buyerAccount.jsp">My Account</a></li>
						<li><a href="editBuyer.jsp">Update Account</a></li>
						<li><a href="viewOrder.jsp">View Orders</a></li>
						<li><a href="shoppingCart.jsp">Shopping Cart</a></li>
						<li class="divider"></li>
						<li><a href="AboutUs.jsp">About Us</a></li>
						<li><a href="contactUs.jsp">Contact Us</a></li>
						<% } else if(user.getType().equals("sel")) { %>
						<li><a href="sellerAccount.jsp">My Account</a></li>
						<li><a href="editSeller.jsp">Update Account</a></li>
						<li><a href="viewOrder.jsp">View Customer Orders</a></li>
						<li><a href="addProducts.jsp">Add Products</a></li>
						<li class="divider"></li>
						<li><a href="AboutUs.jsp">About Us</a></li>
						<li><a href="contactUs.jsp">Contact Us</a></li>
						<% } else if(user.getType().equals("adm")) { %>
						<li><a href="#">Seller Authentication</a></li>
						<li><a href="viewBuyer.jsp">View Customer</a></li>
						<li><a href="viewSeller.jsp">View Sellers</a></li>
						<li class="divider"></li>
						<li><a href="AboutUs.jsp">About Us</a></li>
						<% } %>
					</ul></li>
				<% 
        		if (user.getType().equals("buy")) { 
        			int productsCount = ShoppingCartDAO.noOfproductsIncart(user.getID());
        		%>
				<li><a><button class="btn btn-primary btn-sm" type="button"
						onclick="location.href = 'shoppingCart.jsp'">
						Shopping Cart <span class="badge"><%=productsCount%></span>
					</button></a></li>
				<%} %>
			</ul>
			<%
				}
			%>

			<ul class="nav navbar-nav navbar-right">
	
				<li><a> <%
						if (!loggedIn.equals("")) {
					%>

						<form action="/ChangingSeasons/LogoutServlet" method="post">
							<button type="submit" value="Logout" name="Logout"
								class="btn btn-default btn-sm">Logout</button>

						</form> <%
						 	} else {
						 %> <%
						 	}
						 %>
				</a></li>


				<!-- 
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
         -->
			</ul>
		</div>
		<!-- /.navbar-collapse -->

	</div>
	<!-- /.container-fluid -->
</nav>
