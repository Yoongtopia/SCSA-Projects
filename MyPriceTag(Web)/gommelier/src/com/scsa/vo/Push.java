package com.scsa.vo;

import java.util.List;

public class Push {
	private int push_num;
	private String user_id;
	private int push_price;
	private int push_status;
	private int push_square;
	private String reg_id;
	private int push_check;
	private int product_num;
	
	private List<PushTag> pushTagList;

	
	public Push() {
		super();
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public Push(int push_num, String user_id, int push_price, int push_status,
			int push_square, String reg_id, int push_check, int product_num,
			List<PushTag> pushTagList) {
		super();
		this.push_num = push_num;
		this.user_id = user_id;
		this.push_price = push_price;
		this.push_status = push_status;
		this.push_square = push_square;
		this.reg_id = reg_id;
		this.push_check = push_check;
		this.product_num = product_num;
		this.pushTagList = pushTagList;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}



	public int getPush_check() {
		return push_check;
	}

	public void setPush_check(int push_check) {
		this.push_check = push_check;
	}


	public int getPush_num() {
		return push_num;
	}
	public void setPush_num(int push_num) {
		this.push_num = push_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPush_price() {
		return push_price;
	}
	public void setPush_price(int push_price) {
		this.push_price = push_price;
	}
	public int getPush_status() {
		return push_status;
	}
	public void setPush_status(int push_status) {
		this.push_status = push_status;
	}
	public int getPush_square() {
		return push_square;
	}
	public void setPush_square(int push_square) {
		this.push_square = push_square;
	}
	public List<PushTag> getPushTagList() {
		return pushTagList;
	}
	public void setPushTagList(List<PushTag> pushTagList) {
		this.pushTagList = pushTagList;
	}

	@Override
	public String toString() {
		return "Push [push_num=" + push_num + ", user_id=" + user_id
				+ ", push_price=" + push_price + ", push_status=" + push_status
				+ ", push_square=" + push_square + ", reg_id=" + reg_id
				+ ", push_check=" + push_check + ", product_num=" + product_num
				+ ", pushTagList=" + pushTagList + "]";
	}




	
}
