package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.Calendar;

public class ShoppingCart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int cartID, customerID;
	private Date dateAdded;
	private float totalPrice;
	
	public ShoppingCart(){
		this.cartID = 0;
		this.totalPrice = 0.0f;
		this.customerID = 0;
		this.dateAdded = new Date(Calendar.getInstance().getTime().getTime());
	}

	public int getCartID() {
		return cartID;
	}

	public void setCartID(int cartID) {
		this.cartID = cartID;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public Date getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

}
