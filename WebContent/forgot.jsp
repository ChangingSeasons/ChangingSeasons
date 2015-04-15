<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<div id="header">
	<%@ include file="nav.jsp" %>
</div>
<link rel="stylesheet" href="mystyle.css" type="text/css" />
    
<%
    	String msg = (String) request.getAttribute("msg");
		String password = (String) request.getAttribute("password");
		
    	if (msg == null)
    		msg = "";
 
    	if (password == null && !msg.startsWith("User")){
    		password = "";
 %>
    		<body>
    		<form action="/ChangingSeasons/ForgotPassServlet" method="post">
    			Enter Username: <input type="text" name="uname" placeholder="userid"><p>
    			Enter Email: <input type="text" name="email" placeholder="abc@domain.com"></p>
    			Enter Phone: <input type="text" name="phone" placeholder="1234567890"></p>
    			<input type="submit" name="submit" value="Submit">
    			<input type="reset" value="Reset" name="reset">
    		</form>
    	</body>
<%	}
    	
    	else if (msg.startsWith("User")) {
		out.write("<h3>" + msg + "</h3>");
		out.write("<b>" + password + "</b>");
		}
%>
		
</html>