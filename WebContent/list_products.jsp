<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="model.Product"%>

<head>
	<meta name="robots" content="NOODP"/>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="/css/bootstrap.css" rel="stylesheet">
</head>
<script>
$(document).ready(function() {                                 // When the HTML DOM is ready loading, then execute the following function...
    $('#somebutton').click(function() {                        // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
    
    	
    	var sizecheckValues = $('.size:checked').map(function() {
    	    return $(this).val();
    	}).get();
    	var colorcheckValues = $('.color:checked').map(function() {
    	    return $(this).val();
    	}).get();
    	var brandcheckValues = $('.brand:checked').map(function() {
    	    return $(this).val();
    	}).get();
    	var typecheckValues = $('.type:checked').map(function() {
    	    return $(this).val();
    	}).get();
    	var pricecheckValues = $('.price:checked').map(function() {
    	    return $(this).val();
    	}).get();
    
    	url = "ProductFilterServlet"
    		+ "?size="  + sizecheckValues
    		+ "&color=" + colorcheckValues
    		+ "&brand=" + brandcheckValues
    		+ "&type="  + typecheckValues
            + "&price=" + pricecheckValues
            ;
    	alert(url);
    
    	$.get(url, function(responseJson) {          // Execute Ajax GET request on URL of "ProductFilterServlet" and execute the following function with Ajax response JSON...
    	    $.each(responseJson, function(index, item) { // Iterate over the JSON array.
                console.log(item);
            });
        });
    });
});
</script>
<div class="container"  style="width:100%">
<div id="somediv">
</div>
	<div class="col-md-4" style="float:left; width:20% ; height: 1000px;margin-left:10px;margin-right:10px;">
		<div class="panel panel-default">
				<div class="panel-body">
				<button type="button" class="btn btn-primary" id="somebutton">Update</button>
				<h3>Sort by</h3><br/>
				<h4>Size</h4>
					<input type="checkbox" class="size" name="size" value="XS"> XS <br/>
					<input type="checkbox" class="size" name="size" value="S"> S <br/>
					<input type="checkbox" class="size" name="size" value="M"> M <br/>
					<input type="checkbox" class="size" name="size" value="L"> L <br/>
					<input type="checkbox" class="size" name="size" value="XL"> XL <br/>
					<input type="checkbox" class="size" name="size" value="XXL"> XXL <br/>
				<br/>
				
				<h4>Color</h4>
					<input type="checkbox" class="color" name="color" value="Black"> Black <br/>
					<input type="checkbox" class="color" name="color" value="White"> White <br/>
					<input type="checkbox" class="color" name="color" value="Red"> Red <br/>
					<input type="checkbox" class="color" name="color" value="Brown"> Brown <br/>
					<input type="checkbox" class="color" name="color" value="Grey"> Grey <br/>
					<input type="checkbox" class="color" name="color" value="Blue"> Blue <br/>
				<br/>
				
				<h4>Brand</h4>
					<input type="checkbox" class="brand" name="color" value="Burberry"> Burberry <br/>
					<input type="checkbox" class="brand" name="color" value="CalvinKlein"> Calvin Klein<br/>
					<input type="checkbox" class="brand" name="color" value="Columbia"> Columbia <br/>
					<input type="checkbox" class="brand" name="color" value="Diesel"> Diesel <br/>
					<input type="checkbox" class="brand" name="color" value="DC"> DC <br/>
					<input type="checkbox" class="brand" name="color" value="HugoBoss"> Hugo Boss <br/>
					<input type="checkbox" class="brand" name="color" value="KennethCole"> Kenneth Cole <br/>
					<input type="checkbox" class="brand" name="color" value="Nordstrom"> Nordstrom <br/>
					<input type="checkbox" class="brand" name="color" value="NorthFace"> The North Face <br/>
					<input type="checkbox" class="brand" name="color" value="TommyHilfiger"> Tommy Hilfiger <br/>
				<br/>
				
				<h4>Type</h4>
					<input type="checkbox" class="type" value="Leather"> Leather <br/>
					
					<input type="checkbox" class="type" name="color" value="Denim"> Denim<br/>
					<input type="checkbox" class="type" name="color" value="Parka"> Parka <br/>
					<input type="checkbox" class="type" name="color" value="Peacoat"> Peacoat <br/>
					<input type="checkbox" class="type" name="color" value="Windblockers"> Wind blockers <br/>
					<input type="checkbox" class="type" name="color" value="SnowJackets"> Snow Jackets <br/>
				<br/>

				<h4>Prices</h4>
					<input type="checkbox" class="price" name="color" value="25"> Under $25 <br/>
					<input type="checkbox" class="price" name="color" value="50"> $25 to $50<br/>
					<input type="checkbox" class="price" name="color" value="100"> $50 to $100 <br/>
					<input type="checkbox" class="price" name="color" value="200"> $100 to $200 <br/>
					<input type="checkbox" class="price" name="color" value="250"> $200 to Above <br/>
				</br>
				</div>
			</div>
	</div>
	<%@page import="model.Product"%>
	<%@page import="model.ProductDAO.*" %>
	
<% 
List<Product> products = (List<Product>) session.getAttribute("products");
%>
	<div class="row">
		<%
		if (products != null) {
			for (Product p : products) {
				int id = p.getProductID();
		%>
		<div class="col-sm-5 col-md-3">
			<div class="thumbnail">
				<img src="<%=p.getImagePath()%>" alt="<%=p.getImageName()%>">
				<div class="caption">
					<h3> <%=p.getProductName()%></h3>
					<p>
						Price: $<%=p.getPrice()+""%>
					</p>
					<p> <form  action="/ChangingSeasons/ViewProductServlet" method="post">	
						<input type="hidden" name="productID" value="<%=(id+"")%>">
						<input type="submit" class="btn btn-primary btn-xs" role="button" value="View Product"/> <a href="#" class="btn btn-default btn-xs" role="button">Edit
							Product</a>
						</form>
					</p>
				</div>
			</div>
		</div>

		<%
			} }else out.write("No products found"); 
		%>
	</div>
</div>


