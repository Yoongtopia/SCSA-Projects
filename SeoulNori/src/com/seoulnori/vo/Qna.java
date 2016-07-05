package com.seoulnori.vo;

public class Qna {
	
	private int eventQnaNum;
	private String userId;
	private String eventId;
	private String eventQnaRegDate;
	private String eventQnaContent;
	
	private Member member;
	
	public Qna() {
		super();
	}

	public Qna(int eventQnaNum, String userId, String eventId,
			String eventQnaRegDate, String eventQnaContent) {
		super();
		this.eventQnaNum = eventQnaNum;
		this.userId = userId;
		this.eventId = eventId;
		this.eventQnaRegDate = eventQnaRegDate;
		this.eventQnaContent = eventQnaContent;
	}

	public int getEventQnaNum() {
		return eventQnaNum;
	}

	public void setEventQnaNum(int eventQnaNum) {
		this.eventQnaNum = eventQnaNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getEventQnaRegDate() {
		return eventQnaRegDate;
	}

	public void setEventQnaRegDate(String eventQnaRegDate) {
		this.eventQnaRegDate = eventQnaRegDate;
	}

	public String getEventQnaContent() {
		return eventQnaContent;
	}

	public void setEventQnaContent(String eventQnaContent) {
		this.eventQnaContent = eventQnaContent;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Qna [eventQnaNum=");
		builder.append(eventQnaNum);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", eventId=");
		builder.append(eventId);
		builder.append(", eventQnaRegDate=");
		builder.append(eventQnaRegDate);
		builder.append(", eventQnaContent=");
		builder.append(eventQnaContent);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}

}
