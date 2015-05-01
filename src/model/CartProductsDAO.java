package model;

import static model.ConnectDB.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CartProductsDAO {

	private static int getID(){
		int ID = -1;
		try{
			Connect();
			String q0 = "SELECT cartProductID FROM CartProducts";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			if(rs.next()){
				rs.last(); // Get ID of last Cart
				ID = rs.getInt("cartProductID");
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

	public static boolean editCart(int quantity, int cartID, int productID){

		Connect();
		try{
			String q = "UPDATE CartProducts SET quantity="+quantity+" WHERE cartID="+cartID+" AND productID="+productID;
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
	
	public static boolean insertIntoCartProducts(int cartID, int productID, int quantity){
		try{
			String q = "INSERT into CartProducts (cartProductID, cartID, productID, quantity) values (?, ?, ?, ?)";
			Connect();
			PreparedStatement ps = cn.prepareStatement(q);
			ps.setInt(1, getID());
			Connect();
			ps.setInt(2, cartID);
			ps.setInt(3, productID);
			ps.setInt(4, quantity); 
			
			ps.executeUpdate();
			
			ps.close();
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		
		DB_close();
		return true;
	}

}
