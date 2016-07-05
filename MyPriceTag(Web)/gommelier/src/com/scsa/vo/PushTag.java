package com.scsa.vo;

public class PushTag {
	private int push_num;
	private int push_tag_num;
	private String push_tag;
	
	
	public PushTag() {
		super();
	}

	
	
	public int getPush_tag_num() {
		return push_tag_num;
	}



	public void setPush_tag_num(int push_tag_num) {
		this.push_tag_num = push_tag_num;
	}



	public PushTag(int push_num, int push_tag_num, String push_tag) {
		super();
		this.push_num = push_num;
		this.push_tag_num = push_tag_num;
		this.push_tag = push_tag;
	}



	public int getPush_num() {
		return push_num;
	}
	public void setPush_num(int push_num) {
		this.push_num = push_num;
	}
	public String getPush_tag() {
		return push_tag;
	}
	public void setPush_tag(String push_tag) {
		this.push_tag = push_tag;
	}
	@Override
	public String toString() {
		return "PushTag [push_num=" + push_num + ", push_tag=" + push_tag + "]";
	}
	
	
}
