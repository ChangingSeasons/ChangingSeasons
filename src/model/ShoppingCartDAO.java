package model;

import static model.ConnectDB.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class ShoppingCartDAO {

	private static int getLastID(){
		Connect();
		int ID = -1;
		try{
			String q0 = "SELECT cartID FROM ShoppingCart";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			if(rs.next()){
				rs.last(); // Get ID of last Cart
				ID = rs.getInt("cartID");
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
		return ID;
	}

	public static int getCartID(int customerID){
		int ID = -1;
		Connect();
		try{
			String q0 = "SELECT cartID FROM ShoppingCart WHERE customerID="+customerID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			if(rs.next())   // User already has a cart
				ID = rs.getInt("cartID");
			else // No cart associated with the user. Generate a new cartID for the user
				ID = getLastID();

			rs.close();
			st.close();

		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}

		DB_close();
		return ID;
	}

	public static boolean addTocart(int customerID){

		Connect();
		try{
			Calendar calendar = Calendar.getInstance();
			Date startDate = new Date(calendar.getTime().getTime());

			String q = "INSERT into ShoppingCart (cartID, dateAdded, customerID, totalPrice) values (?, ?, ?, ?)";
			float totalPrice = totalPrice(customerID);
			PreparedStatement ps = cn.prepareStatement(q);

			ps.setInt(1, getCartID(customerID));
			ps.setDate(2, startDate);
			ps.setInt(3, customerID);
			ps.setFloat(4, totalPrice);
			ps.executeUpdate();

			ps.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return true;
	}

	public static int noOfproductsIncart(int userID){
		int count = 0;

		int cartID = getCartID(userID);

		try{
			String q0 = "SELECT distinct productID FROM cartProducts WHERE cartID="+cartID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			if(rs.next()){
				rs.last();
				count = rs.getRow(); // Total Number of Distinct products in Cart
			}
			else
				count = 0; // Cart is empty

			rs.close();
			st.close();

		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}

		return count;
	}

	public static boolean removeProduct(int customerID, int productID){
		Connect();

		int cartID = getCartID(customerID);

		try{
			String q = "DELETE FROM CartProducts WHERE cartID="+cartID+" AND productID="+productID;
			Statement st = cn.createStatement();
			st.executeUpdate(q);

			st.close();

		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		return true;
	}

	public static float totalPrice(int customerID){
		float amount = 0.0f;
		int cartID = getCartID(customerID);
		int noOfProducts = noOfproductsIncart(customerID);
		int flag = 0;
		
		int[] productID = new int[noOfProducts];
		int[] quantity = new int[noOfProducts];
		float[] price = new float[noOfProducts];
		
		Connect();
		int i = 0;
		try{
			String q0 = "SELECT productID, quantity FROM CartProduct WHERE cartID="+cartID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			
			if(rs.next()){
				while(rs.next()){
					productID[i] = rs.getInt("productID");
					quantity[i] = rs.getInt("quantity");
					i++;
				}
				flag = 1;
			}
			
			st.close();
			rs.close();
			
			if(flag == 1){
				for(i=0; i<productID.length; i++){
					q0 = "SELECT price FROM Product WHERE productID="+productID[i];
					st = cn.createStatement();
					rs = st.executeQuery(q0);
					while(rs.next()){
						price[i] = rs.getFloat("price");
					}
				}
			}
			
			for(i=0; i<price.length; i++)
				amount += price[i] * quantity[i];
			
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}	
		DB_close();
		return amount;
	}

}
