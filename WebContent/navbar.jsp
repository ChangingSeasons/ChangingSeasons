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
			
      	String homeURL = "base_login.jsp";
    	if (!loggedIn.equals("")) homeURL = "view_product.jsp";
      %>
			<a class="navbar-brand" href="<% out.write(homeURL);%>"><span
				class="header"><img src="imgs/logo.jpg" alt="logo" width="80" />
					Changing Seasons</span></a>
		</div>




		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<!-- 
      
       -->
			<%
				if (!loggedIn.equals("")) {
					User u = (User)session.getAttribute("user");
					
					// Setting user for testing
					if (u == null) {
						u = new User();
						u.setUsername("test-user-session-user-null");
						u.setType("buy");
					}
					
					String type = u.getType();
			%>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>



			<ul class="nav navbar-nav navbar-right">
				<li>
					<form action="/ChangingSeasons/LogoutServlet" method="post">
						<button type="submit" value="Logout" name="Logout"
							class="btn btn-info">Logout</button>
					</form>
					<% } else { %>
					
					Already Logged Out
					<% } %>
				</li>
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