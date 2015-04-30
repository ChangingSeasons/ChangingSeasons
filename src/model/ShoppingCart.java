package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;

public class ShoppingCart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int cartID, customerID, quantity;
	private Date dateAdded;
	private float totalPrice;
	private HashMap<Product, Integer> hm;
	private int noOfProducts;
	
	public ShoppingCart(){
		this.cartID = 0;
		this.totalPrice = 0.0f;
		this.customerID = 0;
		this.hm = null;
		this.dateAdded = new Date(Calendar.getInstance().getTime().getTime());
		this.noOfProducts = 0;
	}
	

	public int getNoOfProducts() {
		return noOfProducts;
	}


	public void setNoOfProducts(int noOfProducts) {
		this.noOfProducts = noOfProducts;
	}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public HashMap<Product, Integer> getHm() {
		return hm;
	}



	public void setHm(HashMap<Product, Integer> hm) {
		this.hm = hm;
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
