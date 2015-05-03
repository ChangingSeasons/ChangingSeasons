package model;
import static model.ConnectDB.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RankDAO {

	public boolean addRank(int productID, int customerID, int rank){
		Connect();

		try{
			String q1 = "INSERT into productRank (productID, customerID, rank)" + " values (?, ?, ?)";
			PreparedStatement ps = cn.prepareStatement(q1);
			ps.setInt(1, productID);
			ps.setInt(2, customerID);
			ps.setInt(3, rank);
			ps.executeUpdate();
			ps.close();
		}catch(SQLException e){
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		DB_close();
		return true;
	}

	public boolean editRank(int... args){
		Connect();
		int productID = args[0], customerID = args[1], rank = args[2];

		try{
			String q = "UPDATE productRank SET rank="+rank+" WHERE productID="+productID+" AND customerID="+customerID;
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
	
	public static int viewRank(int productID, int customerID){
		Connect();
		int rank = 0;
		try{
			String q0 = "SELECT rank FROM productRank WHERE productID="+productID+" AND customerID="+customerID;
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(q0);

			while(rs.next())
				rank = rs.getInt("rank");
			
			rs.close();
			st.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
		
		return rank;
	}

}
