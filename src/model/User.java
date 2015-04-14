package model;

import java.io.Serializable;

public class User implements Serializable{
	private String firstname, lastname;
	
	public User() {
		super();
		this.firstname="";
		this.lastname="";
		//this.username="";
	}
	
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
}
