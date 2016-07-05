package com.scsa.vo;

import java.util.List;

public class Product {
	private int product_num;
	private int product_price;
	private int square_num;
	private String product_date;
	private int product_status;
	private String product_content;
	private String user_id;
	 
	private User user;
	private List<Img> imgList;
	private List<Tag> tagList;
	private List<Cmt> cmtList;
	
	public Product() {
		super();
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public Product(int product_num, int product_price, int square_num,
			String product_date, int product_status, String product_content,
			String user_id, User user, List<Img> imgList, List<Tag> tagList,
			List<Cmt> cmtList) {
		super();
		this.product_num = product_num;
		this.product_price = product_price;
		this.square_num = square_num;
		this.product_date = product_date;
		this.product_status = product_status;
		this.product_content = product_content;
		this.user_id = user_id;
		this.user = user;
		this.imgList = imgList;
		this.tagList = tagList;
		this.cmtList = cmtList;
	}



	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getSquare_num() {
		return square_num;
	}
	public void setSquare_num(int square_num) {
		this.square_num = square_num;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	public int getProduct_status() {
		return product_status;
	}
	public void setProduct_status(int product_status) {
		this.product_status = product_status;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Img> getImgList() {
		return imgList;
	}
	public void setImgList(List<Img> imgList) {
		this.imgList = imgList;
	}
	public List<Tag> getTagList() {
		return tagList;
	}
	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}
	public List<Cmt> getCmtList() {
		return cmtList;
	}

	public void setCmtList(List<Cmt> cmtList) {
		this.cmtList = cmtList;
	}



	@Override
	public String toString() {
		return "Product [product_num=" + product_num + ", product_price="
				+ product_price + ", square_num=" + square_num
				+ ", product_date=" + product_date + ", product_status="
				+ product_status + ", product_content=" + product_content
				+ ", user_id=" + user_id + ", user=" + user + ", imgList="
				+ imgList + ", tagList=" + tagList + ", cmtList=" + cmtList
				+ "]";
	}

	

}
