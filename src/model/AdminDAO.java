package model;

import static model.ConnectDB.*;

import java.sql.SQLException;
import java.sql.Statement;
public class AdminDAO {

	public boolean authorizeSeller(boolean status, int id){
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
	
}
