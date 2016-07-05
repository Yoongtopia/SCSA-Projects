package com.orakgarak.vo;

public class News {
	private String title;
	private String link;
	private String pubDate;
	private String desc;
	public News() {
		super();
	}
	public News(String title, String link, String pubDate, String desc) {
		super();
		this.title = title;
		this.link = link;
		this.pubDate = pubDate;
		this.desc = desc;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "News [title=" + title + ", link=" + link + ", pubDate="
				+ pubDate + ", desc=" + desc + "]";
	}
	
	
	
	
}
