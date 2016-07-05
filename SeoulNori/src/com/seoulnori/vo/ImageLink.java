package com.seoulnori.vo;

public class ImageLink {
	
	private String imageLink;
	private String sizeWidth;
	private String sizeHeight;
	
	public ImageLink() {
		super();
	}

	public ImageLink(String imageLink, String sizeWidth, String sizeHeight) {
		super();
		this.imageLink = imageLink;
		this.sizeWidth = sizeWidth;
		this.sizeHeight = sizeHeight;
	}

	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	public String getSizeWidth() {
		return sizeWidth;
	}

	public void setSizeWidth(String sizeWidth) {
		this.sizeWidth = sizeWidth;
	}

	public String getSizeHeight() {
		return sizeHeight;
	}

	public void setSizeHeight(String sizeHeight) {
		this.sizeHeight = sizeHeight;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ImageLink [imageLink=");
		builder.append(imageLink);
		builder.append(", sizeWidth=");
		builder.append(sizeWidth);
		builder.append(", sizwHeight=");
		builder.append(sizeHeight);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
}
