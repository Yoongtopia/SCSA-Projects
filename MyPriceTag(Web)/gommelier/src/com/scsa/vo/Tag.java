package com.scsa.vo;

public class Tag {
	private int tag_num;
	private int product_num;
	private String tag;
	private int count;
	
	public Tag() {
		super();
	}

	
	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}




	public int getTag_num() {
		return tag_num;
	}


	public void setTag_num(int tag_num) {
		this.tag_num = tag_num;
	}


	public Tag(int tag_num, int product_num, String tag, int count) {
		super();
		this.tag_num = tag_num;
		this.product_num = product_num;
		this.tag = tag;
		this.count = count;
	}


	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}


	@Override
	public String toString() {
		return "Tag [product_num=" + product_num + ", tag=" + tag + ", count="
				+ count + "]";
	}

	
	
	
}
