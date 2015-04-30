<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="model.Product"%>

<script>
$(document).ready(function() {                                 // When the HTML DOM is ready loading, then execute the following function...
    $('#somebutton').click(function() {                        // Locate HTML DOM element with ID "somebutton" and assign the following function to its "click" event...
        $.get('ProductFilterServlet', function(responseJson) {          // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
            var $table = $('<table>').appendTo($('#somediv')); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
            $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
                $('<tr>').appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                    .append($('<td>').text(product.id))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
                    .append($('<td>').text(product.name))      // Create HTML <td> element, set its text content with name of currently iterated product and append it to the <tr>.
                    .append($('<td>').text(product.price));    // Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
            });
        });
    });
});
</script>
<div class="container"  style="width:100%">
<div id="somediv">
</div>
	<div class="col-md-4" style="float:left; width:20% ; height: 100000px;margin-left:10px;margin-right:10px;">
		<div class="panel panel-default">
				<div class="panel-body">
				<button type="button" class="btn btn-primary" id="somebutton">Primary</button>
				<h3>Sort by</h3><br/>
				<h4>Size</h4>
					<input type="checkbox" name="size" value="XS"> XS <br/>
					<input type="checkbox" name="size" value="S"> S <br/>
					<input type="checkbox" name="size" value="M"> M <br/>
					<input type="checkbox" name="size" value="L"> L <br/>
					<input type="checkbox" name="size" value="XL"> XL <br/>
					<input type="checkbox" name="size" value="XXL"> XXL <br/>
				<br/>
				
				<h4>Color</h4>
					<input type="checkbox" name="color" value="Black"> Black <br/>
					<input type="checkbox" name="color" value="White"> White <br/>
					<input type="checkbox" name="color" value="Red"> Red <br/>
					<input type="checkbox" name="color" value="Brown"> Brown <br/>
					<input type="checkbox" name="color" value="Grey"> Grey <br/>
					<input type="checkbox" name="color" value="Blue"> Blue <br/>
				<br/>
				
				<h4>Brand</h4>
					<input type="checkbox" name="color" value="Burberry"> Burberry <br/>
					<input type="checkbox" name="color" value="CalvinKlein"> Calvin Klein<br/>
					<input type="checkbox" name="color" value="Columbia"> Columbia <br/>
					<input type="checkbox" name="color" value="Diesel"> Diesel <br/>
					<input type="checkbox" name="color" value="DC"> DC <br/>
					<input type="checkbox" name="color" value="HugoBoss"> Hugo Boss <br/>
					<input type="checkbox" name="color" value="KennethCole"> Kenneth Cole <br/>
					<input type="checkbox" name="color" value="Nordstrom"> Nordstrom <br/>
					<input type="checkbox" name="color" value="NorthFace"> The North Face <br/>
					<input type="checkbox" name="color" value="TommyHilfiger"> Tommy Hilfiger <br/>
				<br/>
				
				<h4>Type</h4>
					<input type="checkbox" name="color" value="Leather"> Leather <br/>
					<input type="checkbox" name="color" value="Denim"> Denim<br/>
					<input type="checkbox" name="color" value="Parka"> Parka <br/>
					<input type="checkbox" name="color" value="Peacoat"> Peacoat <br/>
					<input type="checkbox" name="color" value="Windblockers"> Wind blockers <br/>
					<input type="checkbox" name="color" value="SnowJackets"> Snow Jackets <br/>
				<br/>

				<h4>Prices</h4>
					<input type="checkbox" name="color" value="25"> Under $25 <br/>
					<input type="checkbox" name="color" value="50"> $25 to $50<br/>
					<input type="checkbox" name="color" value="100"> $50 to $100 <br/>
					<input type="checkbox" name="color" value="200"> $100 to $200 <br/>
					<input type="checkbox" name="color" value="250"> $200 to Above <br/>
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
						Price:<%=p.getPrice()+""%>
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


