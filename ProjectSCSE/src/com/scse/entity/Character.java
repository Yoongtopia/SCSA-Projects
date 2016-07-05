package com.scse.entity;

public class Character {

	private int chaNum;
	private String chaName;
	private String chaImg;
	private String chaDesc;
	
	private Mission chaMission;

	public int getChaNum() {
		return chaNum;
	}

	public void setChaNum(int chaNum) {
		this.chaNum = chaNum;
	}

	public String getChaName() {
		return chaName;
	}

	public void setChaName(String chaName) {
		this.chaName = chaName;
	}

	public String getChaImg() {
		return chaImg;
	}

	public void setChaImg(String chaImg) {
		this.chaImg = chaImg;
	}

	

	public String getChaDesc() {
		return chaDesc;
	}

	public void setChaDesc(String chaDesc) {
		this.chaDesc = chaDesc;
	}

	public Mission getChaMission() {
		return chaMission;
	}

	public void setChaMission(Mission chaMission) {
		this.chaMission = chaMission;
	}

	public Character() {
		super();
	}

	public Character(int chaNum, String chaName, String chaImg,
			String chaDesc, Mission chaMission) {
		super();
		this.chaNum = chaNum;
		this.chaName = chaName;
		this.chaImg = chaImg;
		
		this.chaDesc = chaDesc;
		this.chaMission = chaMission;
	}

	@Override
	public String toString() {
		return "Character [chaNum=" + chaNum + ", chaName=" + chaName
				+ ", chaImg=" + chaImg + ", chaDesc=" + chaDesc
				+ ", chaMission=" + chaMission + "]";
	}
	
	
	
	
	
}
