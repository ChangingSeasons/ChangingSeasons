package model;
import static model.ConnectDB.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static model.ShoppingCartDAO.*;
public class OrderProductsDAO {

	private static int getID(){
		Connect();
		int ID = -1;
		try{
			String q0 = "SELECT OrderProductID FROM OrderProducts";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			if(rs.next()){
				rs.last(); // Get ID for last row
				ID = rs.getInt("orderProductID");
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

	public static boolean insertIntoOrderProducts(int customerID, int orderID){
		int cartID = getCartID(customerID);
		try{
			Connect();
			String q0 = "SELECT productID, quantity FROM CartProducts WHERE cartID="+cartID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			String q1 = "INSERT into OrderProducts (orderID, productID, quantity, OrderProductID) values (?, ?, ?, ?)";
			while(rs.next()){
				Connect();
				PreparedStatement ps = cn.prepareStatement(q1);
				ps.setInt(1, orderID);
				ps.setInt(2, rs.getInt("productID"));
				ps.setInt(3, rs.getInt("quantity"));
				ps.setInt(4, getID());  // OrderProductID
				Connect();
				ps.executeUpdate();

				ps.close();
			}
			st.close();
			rs.close();

		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		return true;
	}

}
