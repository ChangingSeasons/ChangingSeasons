package model;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static model.ConnectDB.*;

public class AuthDAO {

	public static int checkUserpass(String username, String password){
		int userId=-1;
		Connect();
		try{
			String q="SELECT id FROM User WHERE username='"+username+"' AND password='"+password+"'";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q);
			while(rs.next()){
				userId = Integer.parseInt(rs.getString("id"));
			}
			rs.close();
			st.close();
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		if(userId!=-1)
			return userId;
		return -1;
	}

	public static User getUserbyId(int userID){
		String firstname="", lastname="", type="", username="";
		Connect();
		try{

			String q0="SELECT type FROM User WHERE id="+userID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			while(rs.next()){
				type = rs.getString("type");
			}
			
			st.close();
			rs.close();
			
			if(type.equalsIgnoreCase("buy")){ // Buyer
				q0="SELECT * FROM Customer WHERE id="+userID;
				st = cn.createStatement();
				rs = st.executeQuery(q0);
				while(rs.next()){
					firstname = rs.getString("firstname");
					lastname = rs.getString("lastname");	
				}
				rs.close();
				st.close();
			}

			else if (type.equalsIgnoreCase("sel")){ // Seller
				q0="SELECT * FROM Seller WHERE id="+userID;
				st = cn.createStatement();
				rs = st.executeQuery(q0);
				while(rs.next()){
					firstname = rs.getString("firstname");
					lastname = rs.getString("lastname");			    
				}
				rs.close();
				st.close();
			}
			
			else{ // Admin
				q0 = "SELECT username FROM User WHERE id="+userID;
				st = cn.createStatement();
				rs = st.executeQuery(q0);
				while(rs.next()){
					username = rs.getString("username");		    
				}
				rs.close();
				st.close();
			}

		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();

		User u = new User();
		u.setFirstname(firstname);
		u.setLastname(lastname);
		u.setUsername(username);
		u.setType(type);
		return u;
	}

	public static int enterNewuser(String username, String password, String type){

		int ID = -1;

		Connect();
		try{
			if(isUsernameAvailable(username)==true){
				Class.forName("com.mysql.jdbc.Driver");
				cn = DriverManager.getConnection("jdbc:mysql://localhost/SEProject", "root", "pass");
				String q0 = "Select id from User";
				Statement st = cn.createStatement();
				ResultSet rs = st.executeQuery(q0);
				
				if(rs.next()){
					rs.last(); // Get ID of last User
					ID = rs.getInt("id");
					ID++;
				}
				else
					ID=1; // Empty Table, so start with ID 1

				rs.close();
				st.close();

				String q1 = "INSERT into User (id, username, password, type)" + " values (?, ?, ?, ?)";
				PreparedStatement ps = cn.prepareStatement(q1);
				ps.setInt(1, ID);
				ps.setString (2,username);
				ps.setString (3,password);
				ps.setString(4, type);
				ps.executeUpdate();
				ps.close();

			}
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}catch(ClassNotFoundException c){
			System.err.println(c.getMessage());
			c.printStackTrace();
		}		
		DB_close();
		if(ID!=-1)
			return ID;
		return -1;
	}

	public static boolean enterUsernameSeller(int userID, double phone, boolean authorized, String... args){
		Connect();
		try{
			String companyName = args[0], address = args[1],
					email = args[2], URL = args[3],
					bankAccount = args[4], routingNumber = args[5],
					firstname = args[6], middlename = args[7], lastname = args[8];

			String q1 = "INSERT into Seller (id, companyName, address, email, phone, authorized, URL, bankAccount, routingNumber, firstname, middlename, lastname)" + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q1);
			ps.setInt(1, userID);
			ps.setString(2, companyName);
			ps.setString(3, address);
			ps.setString(4, email);
			ps.setDouble(5, phone);
			ps.setBoolean(6, authorized);
			ps.setString(7, URL);
			ps.setString(8, bankAccount);
			ps.setString(9, routingNumber);
			ps.setString (10, firstname);
			ps.setString(11, middlename);
			ps.setString (12, lastname);
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		return true;
	}

	public static boolean enterUsernameBuyer(int userID, String firstname, String lastname, String address, String email, double phone, String payPalID, String middlename){
		Connect();
		try{
			String q1 = "INSERT into Customer (id, firstName, lastName, address, email, phone, payPalID, middlename)" + " values (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q1);
			ps.setInt(1, userID);
			ps.setString (2, firstname);
			ps.setString (3, lastname);
			ps.setString(4, address);
			ps.setString(5, email);
			ps.setDouble(6, phone);
			ps.setString(7, payPalID);
			ps.setString(8, middlename);
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		return true;
	}

	public static boolean isUsernameAvailable(String username){
		Connect();
		try{
			String q="SELECT username FROM User";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q);
			while(rs.next()){
				if(rs.getString("username").equals(username)){
					return false;
				}
			}
			rs.close();
			st.close();
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		return true;
	}

	public static String getPassword (String email, double phone){
		Connect();
		String password = "";
		int id = -1;
		try{
			String q = "SELECT id FROM Customer WHERE email='"+email+"' AND phone="+phone;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q);
			while(rs.next()){
				id = Integer.parseInt(rs.getString("id"));
			}
			if(id != -1){
				String q1 = "SELECT password FROM User WHERE id="+id;
				st = cn.createStatement();
				rs = st.executeQuery(q1);
				while(rs.next()){
					password = rs.getString("password");
				}
				rs.close();
				st.close();
				return password;
			}
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		return null;
	}

	public static boolean resetPassword(String username, String password){
		Connect();
		try{
			String q = "UPDATE User SET password='"+password+"' WHERE username='"+username+"'";
			Statement st = cn.createStatement();
			st.executeUpdate(q);

			st.close();
		}catch(SQLException sql){
			System.err.println(sql.getMessage());
			sql.printStackTrace();
		}
		DB_close();
		return true;
	}
}
