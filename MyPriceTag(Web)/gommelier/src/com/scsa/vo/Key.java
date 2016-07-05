package com.scsa.vo;

public class Key {
	private String user_id;
	private String key;
	private int key_status;
	private String key_date;
	
	public Key() {
		super();
	}
	public Key(String user_id, String key, int key_status, String key_date) {
		super();
		this.user_id = user_id;
		this.key = key;
		this.key_status = key_status;
		this.key_date = key_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getKey_status() {
		return key_status;
	}
	public void setKey_status(int key_status) {
		this.key_status = key_status;
	}
	public String getKey_date() {
		return key_date;
	}
	public void setKey_date(String key_date) {
		this.key_date = key_date;
	}
	@Override
	public String toString() {
		return "Key [user_id=" + user_id + ", key=" + key + ", key_status="
				+ key_status + ", key_date=" + key_date + "]";
	}
	
	
	
}
