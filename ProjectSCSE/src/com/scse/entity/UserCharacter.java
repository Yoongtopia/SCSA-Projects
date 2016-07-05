package com.scse.entity;

public class UserCharacter {

	private String userId;
	private int chaNum;
	private char chaChecked;
	
	private Character character;

	public UserCharacter() {
		super();
	}
	
	public UserCharacter(String userId, int chaNum) {
		super();
		this.userId = userId;
		this.chaNum = chaNum;
	}

	public UserCharacter(String userId, int chaNum, char chaChecked,
			Character character) {
		super();
		this.userId = userId;
		this.chaNum = chaNum;
		this.chaChecked = chaChecked;
		this.character = character;
	}
	public UserCharacter(String userId, int chaNum, char chaChecked) {
		super();
		this.userId = userId;
		this.chaNum = chaNum;
		this.chaChecked = chaChecked;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getChaNum() {
		return chaNum;
	}
	public void setChaNum(int chaNum) {
		this.chaNum = chaNum;
	}
	public char getChaChecked() {
		return chaChecked;
	}
	public void setChaChecked(char chaChecked) {
		this.chaChecked = chaChecked;
	}
	public Character getCharacter() {
		return character;
	}
	public void setCharacter(Character character) {
		this.character = character;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserCharacter [userId=");
		builder.append(userId);
		builder.append(", chaNum=");
		builder.append(chaNum);
		builder.append(", chaChecked=");
		builder.append(chaChecked);
		builder.append(", character=");
		builder.append(character);
		builder.append("]");
		return builder.toString();
	}

	
	
	
	
}
