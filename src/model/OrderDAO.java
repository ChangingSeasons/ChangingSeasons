package model;

import static model.ConnectDB.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class OrderDAO {

	private static int getID(){
		Connect();
		int ID = -1;
		try{
			String q0 = "SELECT orderID FROM Order";
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

	public static boolean addOrder(Date dateOfOrder, Date dateOfShipping, int customerID, String orderStatus, String shippingAddress){
		try{
			int orderID = getID();
			Connect();
			String q0 = "SELECT totalPrice FROM ShoppingCart WHERE customerID="+customerID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			float price=0f;

			while(rs.next())
				price = rs.getFloat("totalPrice");

			st.close();
			rs.close();

			float amount = (1.08f * price);

			String q1 = "INSERT into Order (orderID, dateOfOrder, dateOfShipping, customerID, orderStatus, shippingAddress, total_price, tax, status)" + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q1);
			ps.setInt(1, orderID);
			ps.setDate(2, dateOfOrder);
			ps.setDate(3, dateOfShipping);
			ps.setInt(4, customerID);
			ps.setString(5, orderStatus);
			ps.setString(6, shippingAddress);
			ps.setFloat(7, amount); // Total Price includes 8% tax
			ps.setFloat(8, 8); // tax = 8% of total
			ps.setBoolean(9, true);
			ps.executeUpdate();

			ps.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return true;
	}

	public static boolean editOrder(int orderID, Date dateOfOrder, Date dateOfShipping, String orderStatus, String shippingAddress, float total_price, float tax){
		Connect();
		try{

			String q = "UPDATE Order SET dateOfOrder='"+dateOfOrder+"', dateOfShipping='"+dateOfShipping
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
			String q="SELECT * FROM Order WHERE status <> 0";

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

	public static ArrayList<Integer> orderSellers(int sellerID){

		ArrayList<Integer> orders = new ArrayList<Integer>();
		ArrayList<Integer> productID = new ArrayList<Integer>();

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

			for(Integer z: productID){
				q0 = "SELECT DISTINCT orderID FROM OrderProducts WHERE productID="+z;
				st = cn.createStatement();
				rs = st.executeQuery(q0);
				while(rs.next()){
					orders.add(rs.getInt("orderID"));
				}
			}
			st.close();
			rs.close();


		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();

		return orders;
	}

	public static Order[] orderDetails(int... ID){

		int noOforders = noOfOrders();

		Order o[] = new Order[noOforders];
		int i=0;

		for(i=0; i<noOforders; i++)
			o[i] = new Order();

		int customerID = 0;
		String q0;
		try{
			Connect();
			i = 0;

			if(ID.length>0){ // List orders by Customer
				customerID = ID[0];
				q0="SELECT * FROM Order WHERE customerID="+customerID+" AND status <> 0";
			}
			else // List all Orders
				q0="SELECT * FROM Order WHERE status <> 0";

			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			while(rs.next()){
				o[i].setOrderID(rs.getInt("orderID"));
				o[i].setDateOfOrder(rs.getDate("dateOfOrder"));
				o[i].setDateOfShipping(rs.getDate("dateOfShipping"));
				o[i].setCustomerID(rs.getInt("customerID"));
				o[i].setOrderStatus(rs.getString("orderStatus"));
				o[i].setShippingAddress(rs.getString("shippingAddress"));
				o[i].setTotal_price(rs.getFloat("total_price"));
				o[i].setTax(rs.getFloat("tax"));
				i++;
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

	public static boolean deleteOrder(int orderID){
		Connect();

		try{
			String q = "UPDATE Order SET status=0 WHERE orderID="+orderID;
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
			String q0="SELECT * FROM Order WHERE orderID="+orderID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			while(rs.next()){
				o.setOrderID(orderID);
				o.setDateOfOrder(rs.getDate("dateOfOrder"));
				o.setDateOfShipping(rs.getDate("dateOfShipping"));
				o.setCustomerID(rs.getInt("customerID"));
				o.setOrderStatus(rs.getString("orderStatus"));
				o.setShippingAddress(rs.getString("shippingAddress"));
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



}
