package com.seoulnori.vo;

public class Blog {
	
	private String blogTitle;
	private String blogDescription;
	private String blogLink;
	
	public Blog() {
		super();
	}

	public Blog(String blogTitle, String blogDescription, String blogLink) {
		super();
		this.blogTitle = blogTitle;
		this.blogDescription = blogDescription;
		this.blogLink = blogLink;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public String getBlogDescription() {
		return blogDescription;
	}

	public void setBlogDescription(String blogDescription) {
		this.blogDescription = blogDescription;
	}

	public String getBlogLink() {
		return blogLink;
	}

	public void setBlogLink(String blogLink) {
		this.blogLink = blogLink;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Blog [blogTitle=");
		builder.append(blogTitle);
		builder.append(", blogDescription=");
		builder.append(blogDescription);
		builder.append(", blogLink=");
		builder.append(blogLink);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
}
