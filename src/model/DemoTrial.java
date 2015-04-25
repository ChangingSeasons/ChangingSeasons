package model;
import static model.ConnectDB.*;
import static model.AdminDAO.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import static model.AuthDAO.*;
public class DemoTrial {
	int i=1;
	public DemoTrial(){
		try{
			Connect();

			Calendar calendar = Calendar.getInstance();
			Date startDate = new Date(calendar.getTime().getTime());
			
			String q = "INSERT into ShoppingCart (cartID, dateAdded, customerID, totalPrice) values (?, ?, ?, ?)";

			PreparedStatement ps = cn.prepareStatement(q);

			ps.setDate(2, startDate);
			ps.setInt(3, 1);
			ps.setFloat(4, 1000f);

			for(int j=0; j<10; j++){
				this.i++;
				ps.setInt(1, i);
				ps.executeUpdate();
			}
			ps.close();
		}catch(SQLException se){
			System.err.println(se.getMessage());
			se.printStackTrace();
		}
		DB_close();
	}

	public static void main(String[] args) {
		//DemoTrial d1 = new DemoTrial();
		
	}

}
