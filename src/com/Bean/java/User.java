package com.Bean.java;

public class User {
	private int id;
	private String name ;
	private String email ;
	private String password ;
	
	private String real_name ;
	private String real_address ;
	private String real_postcode ;
	private String real_phone ;
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getReal_name() {
		return real_name;
	}


	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}


	public String getReal_address() {
		return real_address;
	}


	public void setReal_address(String real_address) {
		this.real_address = real_address;
	}


	public String getReal_postcode() {
		return real_postcode;
	}


	public void setReal_postcode(String real_postcode) {
		this.real_postcode = real_postcode;
	}


	public String getReal_phone() {
		return real_phone;
	}


	public void setReal_phone(String real_phone) {
		this.real_phone = real_phone;
	}

	public User( String name, String email, String password,
			String real_name, String real_address, String real_postcode,
			String real_phone) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.real_name = real_name;
		this.real_address = real_address;
		this.real_postcode = real_postcode;
		this.real_phone = real_phone;
	}
	public User(int id, String name, String email, String password,
			String real_name, String real_address, String real_postcode,
			String real_phone) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.real_name = real_name;
		this.real_address = real_address;
		this.real_postcode = real_postcode;
		this.real_phone = real_phone;
	}
	public User(int id, String name, String email, 
			String real_name, String real_address, String real_postcode,
			String real_phone) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.real_name = real_name;
		this.real_address = real_address;
		this.real_postcode = real_postcode;
		this.real_phone = real_phone;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User(String name, String email) {
		super();
		this.name = name;
		this.email = email;
	}


	public User(String name, String email, String password) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
	}


	public User(int id, String name, String email, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email
				+ ", password=" + password + ", real_name=" + real_name
				+ ", real_address=" + real_address + ", real_postcode="
				+ real_postcode + ", real_phone=" + real_phone + "]";
	}
	
}
