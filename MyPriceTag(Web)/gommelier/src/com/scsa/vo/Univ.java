package com.scsa.vo;

public class Univ {
	private String univ_code;
	private String univ_name;
	private String univ_email;
	private String univ_img;
	private int square_num;
	
	public Univ() {
		super();
	}
	public Univ(String univ_code, String univ_name, String univ_email,
			String univ_img, int square_num) {
		super();
		this.univ_code = univ_code;
		this.univ_name = univ_name;
		this.univ_email = univ_email;
		this.univ_img = univ_img;
		this.square_num = square_num;
	}
	public String getUniv_code() {
		return univ_code;
	}
	public void setUniv_code(String univ_code) {
		this.univ_code = univ_code;
	}
	public String getUniv_name() {
		return univ_name;
	}
	public void setUniv_name(String univ_name) {
		this.univ_name = univ_name;
	}
	public String getUniv_email() {
		return univ_email;
	}
	public void setUniv_email(String univ_email) {
		this.univ_email = univ_email;
	}
	public String getUniv_img() {
		return univ_img;
	}
	public void setUniv_img(String univ_img) {
		this.univ_img = univ_img;
	}
	public int getSquare_num() {
		return square_num;
	}
	public void setSquare_num(int square_num) {
		this.square_num = square_num;
	}
	@Override
	public String toString() {
		return "Univ [univ_code=" + univ_code + ", univ_name=" + univ_name
				+ ", univ_email=" + univ_email + ", univ_img=" + univ_img
				+ ", square_num=" + square_num + "]";
	}
	
	
}
