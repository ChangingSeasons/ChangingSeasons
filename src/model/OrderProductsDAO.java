package model;
import static model.ConnectDB.*;

public class OrderProductsDAO {

	private static int getID(){
		return 0;
	}
	
	public static boolean insertIntoOrderProducts(int orderID, int productID, int quantity, int OrderProductID){
		Connect();
		DB_close();
		return true;
	}
	
}
