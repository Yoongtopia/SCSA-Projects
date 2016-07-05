package com.scsa.vo;

import java.util.List;

public class Wish {
	private String user_id;	
	private int product_num;
	private List<Product> productList;
	
	public Wish() {
		super();
	}

	public Wish(String user_id, int product_num, List<Product> productList) {
		super();
		this.user_id = user_id;
		this.product_num = product_num;
		this.productList = productList;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	@Override
	public String toString() {
		return "Wish [user_id=" + user_id + ", product_num=" + product_num
				+ ", productList=" + productList + "]";
	}

	
	
}
