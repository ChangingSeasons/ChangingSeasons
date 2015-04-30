package model;

import static model.ConnectDB.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class AdminDAO {

	public static boolean authorizeSeller(boolean status, int sellerID){
		Connect();

		try{
			String q = "UPDATE Seller SET authorized="+status+" WHERE id="+sellerID;
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

	public static boolean deleteUser(int id){
		Connect();

		try{
			String q = "UPDATE User SET status=0 WHERE id="+id;
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

	public static int noOfusers(){

		Connect();

		int countRows = 0;
		try{
			String q="SELECT * FROM User WHERE status <> 0";

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

	//	public static int countUserbyType(String type){
	//		Connect();
	//
	//		int countRows = 0;
	//		try{
	//			String q="SELECT * FROM User WHERE status <> 0 AND type='"+type+"'";
	//
	//			Statement st = cn.createStatement();
	//			ResultSet rs = st.executeQuery(q);
	//
	//			rs.last();
	//			countRows = rs.getRow();
	//
	//			st.close();
	//			rs.close();
	//		}catch(SQLException se){
	//			System.err.println(se.getMessage());
	//			se.printStackTrace();
	//		}
	//		DB_close();
	//		return countRows;
	//	}

	public static User[] listSellers(){

		List<User> seller = new ArrayList<User>();
		User u;
		try{
			String q0="SELECT * FROM Seller";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);
			if(rs.next()){
				while(rs.next()){
					u = new User();
					u.setID(rs.getInt("id"));
					u.setFirstname(rs.getString("firstname"));
					u.setLastname(rs.getString("lastname"));		
					u.setAddress(rs.getString("address"));
					u.setEmail(rs.getString("email"));
					u.setPhone(rs.getDouble("phone"));
					u.setCompanyName(rs.getString("companyName"));
					u.setAuthorized(rs.getBoolean("authorized"));
					u.setURL(rs.getString("URL"));
					u.setBankAccount(rs.getString("bankAccount"));
					u.setRoutingNumber(rs.getString("routingNumber"));
					u.setPayPalID(rs.getString("payPalID"));
					u.setMiddlename(rs.getString("middlename"));
				}
			}
			rs.close();
			st.close();

			q0="SELECT * FROM User WHERE id="+userID;
			st = cn.createStatement();
			rs = st.executeQuery(q0);
			while(rs.next()){
				u.setUsername(rs.getString("username"));
			}
			rs.close();
			st.close();
			seller.add(u);
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return u;
	}

	public static User[] listCustomer(int ID){
		try{


		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return u;
	}

	public static Users[] listAdmins(int ID){
		try{


		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return u;
	}

	public static User[] listUsers(){
		Connect();
		User[] u;
		int countRows = noOfusers();
		u = new User[countRows];

		for(int i=0;i<countRows;i++)
			u[i] = new User();

		int i = 0;
		try{
			Connect();
			String q0="SELECT * FROM User JOIN Seller ON User.id=Seller.id WHERE type='sel' AND status <> 0";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			while(rs.next()){

				u[i].setFirstname(rs.getString("firstname"));
				u[i].setLastname(rs.getString("lastname"));
				u[i].setUsername(rs.getString("username"));
				u[i].setType("sel");
				i++;
			}
			st.close();
			rs.close();
			////////////
			String q1="SELECT * FROM User JOIN Customer ON User.id=Customer.id WHERE type='buy' AND status <> 0";
			st = cn.createStatement();
			rs = st.executeQuery(q1);

			while(rs.next()){

				u[i].setFirstname(rs.getString("firstname"));
				u[i].setLastname(rs.getString("lastname"));
				u[i].setUsername(rs.getString("username"));
				u[i].setType("buy");
				i++;
			}
			st.close();
			rs.close();

			/////////////

			String q2="SELECT * FROM User WHERE type='adm' AND status <> 0";

			st = cn.createStatement();
			rs = st.executeQuery(q2);

			while(rs.next()){
				u[i].setUsername(rs.getString("username"));
				u[i].setType("adm");
				i++;
			}
			st.close();
			rs.close();

		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return u;
	}

}
