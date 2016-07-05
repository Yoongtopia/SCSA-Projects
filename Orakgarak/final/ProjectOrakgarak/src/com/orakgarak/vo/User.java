package com.orakgarak.vo;

public class User {
	
	private String email;
	private String password;
	private String name;
	private int age;
	private String phone;
	private String address;
	
	public User() {
		super();
	}
	
	public User(String email, String password, String name) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
	}


	
	

	public User(String email, String password, String name, int age) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.age = age;
	}

	
	
	
	public User(String email, String password, String name, String phone) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
	}
	
	

	public User(String email, String password, String name, int age,
			String phone) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.age = age;
		this.phone = phone;
	}


	public User(String email, String password, String name, int age,
			String phone, String address) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.address = address;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [email=" + email + ", password=" + password + ", name="
				+ name + ", age=" + age + ", phone=" + phone + ", address="
				+ address + "]";
	}

	
	
	
}
