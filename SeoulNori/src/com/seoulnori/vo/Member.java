package com.seoulnori.vo;

import java.util.List;

public class Member {
	
	private String userId;
	private String nickname;
	private String password;
	private String memberType;
	private int gender;
	private String birthday;
	private String marriage;
	private String children;
	private String mainStamp;
	private String memberStatus;
	private int stampCount;
	private List<Event> eventList;
	
	
	public List<Event> getEventList() {
		return eventList;
	}

	public void setEventList(List<Event> eventList) {
		this.eventList = eventList;
	}

	public Member() {
		super();
	}

	public Member(String userId, String nickname, String password,
			String memberType, int gender, String birthday, String marriage,
			String children, String mainStamp, String memberStatus, int stampCount) {
		super();
		this.userId = userId;
		this.nickname = nickname;
		this.password = password;
		this.memberType = memberType;
		this.gender = gender;
		this.birthday = birthday;
		this.marriage = marriage;
		this.children = children;
		this.mainStamp = mainStamp;
		this.memberStatus = memberStatus;
		this.stampCount = stampCount;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getMarriage() {
		return marriage;
	}

	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}

	public String getChildren() {
		return children;
	}

	public void setChildren(String children) {
		this.children = children;
	}

	public String getMainStamp() {
		return mainStamp;
	}

	public void setMainStamp(String mainStamp) {
		this.mainStamp = mainStamp;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	
	
		
	public int getStampCount() {
		return stampCount;
	}

	public void setStampCount(int stampCount) {
		this.stampCount = stampCount;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [getEventList()=");
		builder.append(getEventList());
		builder.append(", getUserId()=");
		builder.append(getUserId());
		builder.append(", getNickname()=");
		builder.append(getNickname());
		builder.append(", getPassword()=");
		builder.append(getPassword());
		builder.append(", getMemberType()=");
		builder.append(getMemberType());
		builder.append(", getGender()=");
		builder.append(getGender());
		builder.append(", getBirthday()=");
		builder.append(getBirthday());
		builder.append(", getMarriage()=");
		builder.append(getMarriage());
		builder.append(", getChildren()=");
		builder.append(getChildren());
		builder.append(", getMainStamp()=");
		builder.append(getMainStamp());
		builder.append(", getMemberStatus()=");
		builder.append(getMemberStatus());
		builder.append(", getStampCount()=");
		builder.append(getStampCount());
		builder.append("]");
		return builder.toString();
	}
	
	


	
	
	
}
