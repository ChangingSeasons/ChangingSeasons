package model;
import static model.ConnectDB.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
	
	public static boolean insertIntoOrderProducts(int orderID, int productID, int quantity){
		Connect();
		
		try{
			String q = "INSERT into OrderProducts (orderID, productID, quantity, OrderProductID) values (?, ?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q);
			ps.setInt(1, orderID);
			ps.setInt(2, productID);
			ps.setInt(3, quantity);
			ps.setInt(4, getID());  // OrderProductID
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
