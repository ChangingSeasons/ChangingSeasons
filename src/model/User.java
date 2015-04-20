package model;

import java.io.Serializable;

public class User implements Serializable{
	private String firstname, lastname, type;
	
	public User() {
		super();
		this.firstname="";
		this.lastname="";
		this.type="";
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
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
