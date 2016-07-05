package com.scsa.vo;

import java.util.List;

public class Cmt {
	private int cmt_num;
	private String cmt_content;
	private String cmt_date;
	private int product_num;
	private String user_id;
	private int parent_num;
	private List<Cmt> cmtList;
	
	public Cmt() {
		super();
	}
	public Cmt(int cmt_num, String cmt_content, String cmt_date,
			int product_num, String user_id, int parent_num) {
		super();
		this.cmt_num = cmt_num;
		this.cmt_content = cmt_content;
		this.cmt_date = cmt_date;
		this.product_num = product_num;
		this.user_id = user_id;
		this.parent_num = parent_num;
	}
	
	public Cmt(int cmt_num, String cmt_content, String cmt_date,
			int product_num, String user_id, int parent_num, List<Cmt> cmtList) {
		super();
		this.cmt_num = cmt_num;
		this.cmt_content = cmt_content;
		this.cmt_date = cmt_date;
		this.product_num = product_num;
		this.user_id = user_id;
		this.parent_num = parent_num;
		this.cmtList = cmtList;
	}
	
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getParent_num() {
		return parent_num;
	}
	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}
	public List<Cmt> getCmtList() {
		return cmtList;
	}
	public void setCmtList(List<Cmt> cmtList) {
		this.cmtList = cmtList;
	}
	@Override
	public String toString() {
		return "Cmt [cmt_num=" + cmt_num + ", cmt_content=" + cmt_content
				+ ", cmt_date=" + cmt_date + ", product_num=" + product_num
				+ ", user_id=" + user_id + ", parent_num=" + parent_num
				+ ", cmtList=" + cmtList + "]";
	}
	
	

}
