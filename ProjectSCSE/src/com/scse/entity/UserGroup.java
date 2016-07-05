package com.scse.entity;

public class UserGroup {

	private String userId;
	private int groupNum;
	private char groupRole;
	public UserGroup() {
		super();
	}
	public UserGroup(String userId, int groupNum, char groupRole) {
		super();
		this.userId = userId;
		this.groupNum = groupNum;
		this.groupRole = groupRole;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public char getGroupRole() {
		return groupRole;
	}
	public void setGroupRole(char groupRole) {
		this.groupRole = groupRole;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserGroup [userId=");
		builder.append(userId);
		builder.append(", groupNum=");
		builder.append(groupNum);
		builder.append(", groupRole=");
		builder.append(groupRole);
		builder.append("]");
		return builder.toString();
	}

	
	
	
}
