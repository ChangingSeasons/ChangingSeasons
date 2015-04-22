package model;

import static model.ConnectDB.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class AdminDAO {

	public static boolean authorizeSeller(boolean status, int id){
		Connect();

		int authorized = 0; // False
		if(status == true)
			authorized = 1;

		try{
			String q = "UPDATE Seller SET authorized="+authorized+" WHERE id="+id;
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
			String q = "DELETE FROM USER WHERE id="+id;
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
		User[] u;
		int countRows = 0;
		try{
			String q="SELECT * FROM User";

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

	public static User[] listUsers(){
		Connect();
		User[] u;
		int countRows = noOfusers();
		u = new User[countRows];
		
		for(int i=0;i<countRows;i++)
			u[i] = new User();
		
		String username="", firstname="", lastname="", type="";

		int i = 0;
		try{
			String q0="SELECT * FROM User JOIN Seller ON User.id=Seller.id WHERE type='sel'";
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
			String q1="SELECT * FROM User JOIN Customer ON User.id=Customer.id WHERE type='buy'";
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
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		return u;
	}

}
