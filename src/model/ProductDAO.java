package model;

import static model.ConnectDB.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ProductDAO {

	public static boolean insertProduct(String productName, String productDesc, int sellerID, float price, String imagepath, float shippingCost, String size, String color, String imageName, String type){
		Connect();
		try{
			int productID = getID();

			String q1 = "INSERT into Product (productID, productName, productDesc, sellerID, price, imagePath, shippingCost, size, color, imageName, type)" + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q1);
			ps.setInt(1, productID);
			ps.setString(2, productName);
			ps.setString(3, productDesc);
			ps.setInt(4, sellerID);
			ps.setFloat(5, price);
			ps.setString(6, imagepath);
			ps.setFloat(7, shippingCost);
			ps.setString(8, size);
			ps.setString(9, color);
			ps.setString(10, imageName);
			ps.setString(11, type);
			ps.executeUpdate();

			ps.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return true;
	}

	public static boolean editProduct(int productID, float price, float shippingCost, String... args){
		Connect();
		try{

			String productName = args[0], productDesc = args[1], imagepath = args[2], size = args[3], color = args[4], imageName = args[5];
			String type = args[6];
			String q = "UPDATE Product SET productName='"+productName+"', productDesc='"+productDesc
					+"', price="+price+", imagePath='"+imagepath+"', shippingCost="+shippingCost+", size='"+size
					+"', color='"+color+"', imageName='"+imageName+"', type='"+type+"' WHERE productID="+productID;

			Statement st = cn.createStatement();
			st.executeUpdate(q);

			st.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return true;
	}

	public static boolean statusProduct(int productID, boolean delete){
		Connect();

		int status = 1; // Active
		if(delete == true)
			status = 0; // Deleted

		try{
			String q = "UPDATE Product SET status="+status;
			Statement st = cn.createStatement();
			st.executeUpdate(q);

			st.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}

		DB_close();
		return true;
	}

	private static int getID(){
		Connect();
		int ID = -1;
		try{
			String q0 = "SELECT productID FROM Product";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			if(rs.next()){
				rs.last(); // Get ID of last Product
				ID = rs.getInt("productID");
				ID++;
			}
			else
				ID=1; // Empty Table, so start with ID 1

			rs.close();
			st.close();
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		if(ID!=-1)
			return ID;
		return ID;
	}

	public static int noOfProducts(){

		Connect();
		int countRows = 0;
		try{
			String q="SELECT * FROM Product";

			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q);

			rs.last();
			countRows = rs.getRow();

			st.close();
			rs.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return countRows;
	}

	public static Product[] productDetails(int... ID){
		Connect();

		int noOfproducts = noOfProducts();

		Product p[] = new Product[noOfproducts];
		int i=0;

		for(i=0; i<noOfproducts; i++)
			p[i] = new Product();
		
		int sellerID = 0;
		String q0;
		try{
			i = 0;
			
			if(ID.length>0){ // List products by seller
				sellerID = ID[0];
				q0="SELECT * FROM Product WHERE sellerID="+sellerID;
			}
			else // List all products
				q0="SELECT * FROM Product";
			
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			while(rs.next()){
				p[i].setProductID(rs.getInt("productID"));
				p[i].setProductName(rs.getString("productName"));
				p[i].setProductDesc(rs.getString("productDesc"));
				p[i].setSellerID(rs.getInt("sellerID"));
				p[i].setPrice(rs.getFloat("price"));
				p[i].setImagePath(rs.getString("imagePath"));
				p[i].setShippingCost(rs.getFloat("shippingCost"));
				p[i].setSize(rs.getString("size"));
				p[i].setColor(rs.getString("color"));
				p[i].setImageName(rs.getString("imageName"));
				p[i].setType(rs.getString("type"));
				i++;
			}

			st.close();
			rs.close();

		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}

		DB_close();
		return p;

	}

}
