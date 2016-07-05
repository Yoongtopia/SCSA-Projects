package com.scsa.vo;

import java.util.List;

public class User {
	private String user_id;
	private String user_name; 
	private String user_password;
	private String user_email;
	private int user_status;
	private String user_date;
	private String univ_code;
	private String univ_img;
	private String user_phone;
	
	private List<Push> pushList;
	private List<Msg> msgList;
	
	public User() {
		super();
	}

	

	public User(String user_id, String user_name, String user_password,
			String user_email, int user_status, String user_date,
			String univ_code, String univ_img, String user_phone,
			List<Push> pushList, List<Msg> msgList) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_email = user_email;
		this.user_status = user_status;
		this.user_date = user_date;
		this.univ_code = univ_code;
		this.univ_img = univ_img;
		this.user_phone = user_phone;
		this.pushList = pushList;
		this.msgList = msgList;
	}



	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_status() {
		return user_status;
	}

	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}

	public String getUser_date() {
		return user_date;
	}

	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}

	public String getUniv_code() {
		return univ_code;
	}

	public void setUniv_code(String univ_code) {
		this.univ_code = univ_code;
	}

	public List<Push> getPushList() {
		return pushList;
	}

	public void setPushList(List<Push> pushList) {
		this.pushList = pushList;
	}

	public List<Msg> getMsgList() {
		return msgList;
	}

	public void setMsgList(List<Msg> msgList) {
		this.msgList = msgList;
	}

	public String getUniv_img() {
		return univ_img;
	}

	public void setUniv_img(String univ_img) {
		this.univ_img = univ_img;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [user_id=");
		builder.append(user_id);
		builder.append(", user_name=");
		builder.append(user_name);
		builder.append(", user_password=");
		builder.append(user_password);
		builder.append(", user_email=");
		builder.append(user_email);
		builder.append(", user_status=");
		builder.append(user_status);
		builder.append(", user_date=");
		builder.append(user_date);
		builder.append(", univ_code=");
		builder.append(univ_code);
		builder.append(", univ_img=");
		builder.append(univ_img);
		builder.append(", user_phone=");
		builder.append(user_phone);
		builder.append(", pushList=");
		builder.append(pushList);
		builder.append(", msgList=");
		builder.append(msgList);
		builder.append("]");
		return builder.toString();
	}

}
