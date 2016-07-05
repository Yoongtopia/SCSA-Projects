package com.seoulnori.vo;

import java.util.Date;

public class Tweet {

	private String beforeText;
	private String middleText;
	private String afterMiddleText;
	private String afterText;
	private String createAt;
	private String profileImage;
	private String screenName;
	private String name;
	private String url;
	private String url2;
	private String url3;

	public Tweet() {
		super();
	}



	public Tweet(String beforeText, String middleText, String afterMiddleText,
			String afterText, String createAt, String profileImage,
			String screenName, String name, String url, String url2, String url3) {
		super();
		this.beforeText = beforeText;
		this.middleText = middleText;
		this.afterMiddleText = afterMiddleText;
		this.afterText = afterText;
		this.createAt = createAt;
		this.profileImage = profileImage;
		this.screenName = screenName;
		this.name = name;
		this.url = url;
		this.url2 = url2;
		this.url3 = url3;
	}









	public String getAfterMiddleText() {
		return afterMiddleText;
	}









	public void setAfterMiddleText(String afterMiddleText) {
		this.afterMiddleText = afterMiddleText;
	}









	public String getUrl3() {
		return url3;
	}









	public void setUrl3(String url3) {
		this.url3 = url3;
	}









	public String getBeforeText() {
		return beforeText;
	}







	public void setBeforeText(String beforeText) {
		this.beforeText = beforeText;
	}







	public String getMiddleText() {
		return middleText;
	}







	public void setMiddleText(String middleText) {
		this.middleText = middleText;
	}







	public String getUrl2() {
		return url2;
	}







	public void setUrl2(String url2) {
		this.url2 = url2;
	}







	public String getAfterText() {
		return afterText;
	}




	public void setAfterText(String afterText) {
		this.afterText = afterText;
	}




	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getCreateAt() {
		return createAt;
	}

	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Tweet [beforeText=");
		builder.append(beforeText);
		builder.append(", middleText=");
		builder.append(middleText);
		builder.append(", afterMiddleText=");
		builder.append(afterMiddleText);
		builder.append(", afterText=");
		builder.append(afterText);
		builder.append(", createAt=");
		builder.append(createAt);
		builder.append(", profileImage=");
		builder.append(profileImage);
		builder.append(", screenName=");
		builder.append(screenName);
		builder.append(", name=");
		builder.append(name);
		builder.append(", url=");
		builder.append(url);
		builder.append(", url2=");
		builder.append(url2);
		builder.append(", url3=");
		builder.append(url3);
		builder.append("]");
		return builder.toString();
	}

}
