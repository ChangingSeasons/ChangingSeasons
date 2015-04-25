<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
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
      <a class="navbar-brand" href="<% out.write(homeURL); %>"><span class="header"><img src="imgs/logo.jpg" alt="logo" width="80"/>    Changing Seasons</span></a>
    </div>
    
    
  

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<%
			if (!loggedIn.equals("")) {
			%>
			<ul class="nav navbar-nav">
        <li class="active"><a href="base_index.jsp">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="base_index.jsp">Home</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
          <% if (user.getType().equals("buy")) { %>
            <li><a href="#">View Past Orders</a></li>
            <li><a href="#">Customer Action #2</a></li>
            <li><a href="#">Customer Action #3</a></li>
            <li class="divider"></li>
            <li><a href="#">Customer Action #4</a></li>
            <% } else if(user.getType().equals("sel")) { %>
            <li><a href="#">View Customer Orders</a></li>
            <li><a href="#">Seller Action #2</a></li>
            <li><a href="#">Seller Action #3</a></li>
            <li class="divider"></li>
            <li><a href="#">Seller Action #4</a></li>
             <% } else if(user.getType().equals("adm")) { %>
            <li><a href="#">Do Seller Authentication</a></li>
            <li><a href="#">Admin Action #2</a></li>
            <li><a href="#">Admin Action #3</a></li>
            <li class="divider"></li>
            <li><a href="#">Admin Action #4</a></li>
            <% } %>
          </ul>
        </li>
      </ul>
			<%
				}
			%>

			<ul class="nav navbar-nav navbar-right">

				<li><a>
					<%
						if (!loggedIn.equals("")) {
					%>
					
					<form action="/ChangingSeasons/LogoutServlet" method="post">
						<button type="submit" value="Logout" name="Logout"
							class="btn btn-info btn-xs">Logout</button>
							
					</form> <%
						 	} else {
						 %>  <%
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
    </div><!-- /.navbar-collapse -->
     
  </div><!-- /.container-fluid -->
</nav>
