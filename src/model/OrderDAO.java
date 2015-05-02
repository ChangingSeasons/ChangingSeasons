package model;

import static model.ConnectDB.*;
import static model.ShoppingCartDAO.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import static model.OrderProductsDAO.*;
public class OrderDAO {

	private static int getID(){
		Connect();
		int ID = -1;
		try{
			String q0 = "SELECT orderID FROM Orders";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			if(rs.next()){
				rs.last(); // Get ID of last Order
				ID = rs.getInt("orderID");
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

	public static int addOrder(int customerID, String orderStatus, String shippingAddress){
		int orderID = getID();
		try{
			Calendar calendar = Calendar.getInstance();
			Date dateOfOrder = new Date(calendar.getTime().getTime());
			Date dateOfShipping = new Date(calendar.getTime().getTime());; 
			
			updateTotalPrice(customerID);
			Connect();
			String q0 = "SELECT totalPrice FROM ShoppingCart WHERE customerID="+customerID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			float price=0f;
		
			while(rs.next())
				price = rs.getFloat("totalPrice");

			st.close();
			rs.close();

			float amount = (1.08f * price); // Including tax

			String q1 = "INSERT into Orders (orderID, dateOfOrder, customerID, orderStatus, shippingAddress, total_price, tax, status)" + " values (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q1);
			ps.setInt(1, orderID);
			ps.setDate(2, dateOfOrder);
			//ps.setDate(3, dateOfShipping);		// Not setting Date of Shipping at start
			ps.setInt(3, customerID);
			ps.setString(4, orderStatus);
			ps.setString(5, shippingAddress);
			ps.setFloat(6, amount); // Total Price includes 8% tax
			ps.setFloat(7, 8); // tax = 8% of total
			ps.setBoolean(8, true);
			ps.executeUpdate();

			ps.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return orderID;
	}

	public static boolean editOrder(int orderID, Date dateOfOrder, Date dateOfShipping, String orderStatus, String shippingAddress, float total_price, float tax){
		Connect();
		try{

			String q = "UPDATE Orders SET dateOfOrder='"+dateOfOrder+"', dateOfShipping='"+dateOfShipping
					+"', orderStatus='"+orderStatus+"', shippingAddress="+shippingAddress+", total_price="+total_price
					+", tax="+tax+" WHERE orderID="+orderID;

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

	public static int noOfOrders(){

		Connect();
		int countRows = 0;
		try{
			String q="SELECT * FROM Orders WHERE status <> 0";

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

	public static HashMap<Order, List<OrderProducts>> orderSellers(int sellerID){

		ArrayList<Integer> orders = new ArrayList<Integer>();
		ArrayList<Integer> productID = new ArrayList<Integer>();
		HashMap<Order, List<OrderProducts>> orderDetails = new HashMap<Order, List<OrderProducts>>();
		
		try{
			Connect();
			String q0 = "SELECT productID FROM Product WHERE sellerID="+sellerID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			while(rs.next()){
				productID.add(rs.getInt("productID"));
			}
			st.close();
			rs.close();
			
			Iterator<Integer> itr = productID.iterator();
			while(itr.hasNext()){
				int temp_id = (int)itr.next();
				q0 = "SELECT DISTINCT orderID FROM OrderProducts WHERE productID="+temp_id;
				st = cn.createStatement();
				rs = st.executeQuery(q0);
				while(rs.next()){
					orders.add(rs.getInt("orderID"));
				}
			}
			st.close();
			rs.close();
			
			for(Integer z:orders){
				Order o = viewOrder(z);
				List<OrderProducts> op = viewOrderProducts(z);
				
				orderDetails.put(o, op);
			}

		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();

		return orderDetails;
	}
	
	public static HashMap<Order, List<OrderProducts>> orderDetails(int... ID){
		
		HashMap<Order, List<OrderProducts>> orderDetails = new HashMap<Order, List<OrderProducts>>();
		ArrayList<Integer> orders = new ArrayList<Integer>();
		
		String q0;
		int customerID=0;
		try{
			Connect();
			if(ID.length>0){ // List orders by Customer
				customerID = ID[0];
				q0="SELECT orderID FROM Orders WHERE customerID="+customerID+" AND status <> 0";
			}
			else // List all Orders (For Admin)
				q0="SELECT orderID FROM Orders WHERE status <> 0";

			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			
			while(rs.next()){
				orders.add(rs.getInt("orderID"));			
			}
			st.close();
			rs.close();
			
			for(Integer z:orders){
				Order o = viewOrder(z);
				List<OrderProducts> op = viewOrderProducts(z);
				
				orderDetails.put(o, op);
			}
			
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}

		DB_close();
		return orderDetails;
	}
	
	public static boolean deleteOrder(int orderID){
		Connect();

		try{
			String q = "UPDATE Orders SET status=0 WHERE orderID="+orderID;
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

	public static Order viewOrder(int orderID){
		Connect();
		Order o = new Order();

		try{
			String q0="SELECT * FROM Orders WHERE orderID="+orderID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			while(rs.next()){
				o.setOrderID(orderID);
				o.setDateOfOrder(rs.getDate("dateOfOrder"));
				o.setDateOfShipping(rs.getDate("dateOfShipping"));
				o.setCustomerID(rs.getInt("customerID"));
				o.setOrderStatus(rs.getString("orderStatus"));
				if(rs.getString("shippingAddress")!= null) o.setShippingAddress(rs.getString("shippingAddress"));
				o.setTotal_price(rs.getFloat("total_price"));
				o.setTax(rs.getFloat("tax"));
			}

			st.close();
			rs.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return o;
	}
	
	public static boolean updateShippingAddress(int customerID, String address){
		Connect();
		try{
			String q = "UPDATE Orders SET shippingAddress='"+address+"' WHERE customerID="+customerID;

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

}
