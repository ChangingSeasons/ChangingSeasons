package model;

import static model.ConnectDB.*;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class ProductDAO {

	public static boolean insertProduct(String productName, String productDesc, int sellerID, float price, String imagepath, float shippingCost){
		Connect();
		try{
			int productID = 1;

			String q1 = "INSERT into Product (productID, productName, productDesc, sellerID, price, image, shippingCost)" + " values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q1);
			ps.setInt(1, productID);
			ps.setString(2, productName);
			ps.setString(3, productDesc);
			ps.setInt(4, sellerID);
			ps.setFloat(5, price);
			ps.setString(6, imagepath);
			ps.setFloat(7, shippingCost);
			ps.executeUpdate();
			
			ps.close();
			return true;
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return false;
	}
	
//	public static boolean editProduct(){
//		Connect();
//		try{
//			String q = "UPDATE Product SET productName='"+productName+"', productDesc='"+productDesc
//					+"', price="+price+", image='"+imagepath+"', shippingCost="+shippingCost+" WHERE productID="+productID;
//			Statement st = cn.createStatement();
//			st.executeUpdate(q);
//
//			st.close();
//			return true;
//		}catch(SQLException se){
//			System.err.println(se.getMessage());
//			se.printStackTrace();
//		}
//		DB_close();
////		return true;
//	}

}
