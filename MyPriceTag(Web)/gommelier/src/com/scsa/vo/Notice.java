package com.scsa.vo;

public class Notice {
	private int notice_num;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private String user_id;
	
	public Notice() {
		super();
	}
	public Notice(int notice_num, String notice_title, String notice_content,
			String notice_date, String user_id) {
		super();
		this.notice_num = notice_num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.user_id = user_id;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Notice [notice_num=" + notice_num + ", notice_title="
				+ notice_title + ", notice_content=" + notice_content
				+ ", notice_date=" + notice_date + ", user_id=" + user_id + "]";
	}
	
	
}
