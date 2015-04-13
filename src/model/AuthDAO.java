package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class AuthDAO {
	static Connection cn;
	
	public static int checkUserpass(String username, String password){
		int userId=-1;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost/Lab3", "root", "pass");
			String q="SELECT userId FROM user WHERE username='"+username+"' AND password='"+password+"'";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q);
			while(rs.next()){
				userId = Integer.parseInt(rs.getString("userId"));
		    }
		    rs.close();
		    st.close();
		}catch(Exception e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		if(userId!=-1)
			return userId;
		return -1;
	}
	
	public static User getUserbyId(int userID){
		String username="", firstname="", lastname="";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost/Lab3", "root", "pass");
			String q="SELECT firstName, lastName, username FROM user JOIN user_profile ON user.userId=user_profile.userId WHERE user.userId="+userID;
		
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q);
			while(rs.next()){
				username = rs.getString("username");
				firstname = rs.getString("firstName");
				lastname = rs.getString("lastName");
		    }
		    rs.close();
		    st.close();
		}catch(Exception e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		
		User u = new User();
		u.setFirstname(firstname);
		u.setLastname(lastname);
		u.setUsername(username);
		
		return u;
	}
	
	public static int enterNewuser(String username, String password){
		int userId=-1;
		int ID=0;
		try{
			if(isUsernameAvailable(username)==true){
				Class.forName("com.mysql.jdbc.Driver");
				cn = DriverManager.getConnection("jdbc:mysql://localhost/Lab3", "root", "pass");
				
				String q0 = "Select userId from user";
				Statement st = cn.createStatement();
				ResultSet rs = st.executeQuery(q0);
				
				rs.last();
				ID = Integer.parseInt(rs.getString("userId"));
				ID++; //As its auto-increment, getting ID of last row, and updating accordingly!
				rs.close();
				st.close();
				
				String q1 = "INSERT into user (userId, username, password)" + " values (?, ?, ?)";
				PreparedStatement ps = cn.prepareStatement(q1);
				ps.setInt(1, ID);
				ps.setString (2,username);
				ps.setString (3,password);
				ps.executeUpdate();
				ps.close();
				
				String q2 = "SELECT userId FROM user WHERE username='"+username+"'";
				st = cn.createStatement();
				rs = st.executeQuery(q2);
				while(rs.next()){
					userId = Integer.parseInt(rs.getString("userId"));
			    }
			    rs.close();
			    st.close();
			}
		}catch(Exception e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}		
		DB_close();
		if(userId!=-1)
			return userId;
		return -1;
	}
	
	public static boolean enterUsername(int userID, String firstname, String lastname){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost/Lab3", "root", "pass");
			String q1 = "INSERT into user_profile (userId, firstName, lastName)" + " values (?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q1);
			ps.setInt(1, userID);
			ps.setString (2, firstname);
			ps.setString (3, lastname);
			ps.executeUpdate();
			ps.close();
			return true;
		}catch(Exception e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		return false;
	}
	
	public static boolean isUsernameAvailable(String username){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost/Lab3", "root", "pass");
			String q="SELECT username FROM user";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q);
			while(rs.next()){
				if(rs.getString("username").equals(username)){
					return false;
				}
			}
		    rs.close();
		    st.close();
		}catch(Exception e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		return true;
	}
	
	public static void DB_close(){
		try{
			if(cn!=null)
				cn.close();
		}catch(Exception e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
}
 