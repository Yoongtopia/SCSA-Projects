package com.seoulnori.vo;

public class Stamp {
	private String stampNum;
	private String stampContent;
	private int stampStatus;
	private String stampImage;
	private String userId;
	private String stampGetDate;
	private String eventId;
	private String eventTitle;
	private Event event;
	

	
	
	public Stamp() {
		super();
	}

	public Stamp(String stampNum, String userId, String eventId){
		super();
		this.stampNum = stampNum;
		this.userId = userId;
		this.eventId = eventId;
	}


	//stamp 등록시 
	public Stamp(String stampNum, String stampContent, int stampStatus,
			String stampImage, String userId, String eventId) {
		super();
		this.stampNum = stampNum;
		this.stampContent = stampContent;
		this.stampStatus = stampStatus;
		this.stampImage = stampImage;
		this.userId = userId;
		this.eventId = eventId;
	}





	public Stamp(String stampNum, String stampContent, int stampStatus,
			String stampImage, String userId, String stampGetDate,
			String eventId) {
		super();
		this.stampNum = stampNum;
		this.stampContent = stampContent;
		this.stampStatus = stampStatus;
		this.stampImage = stampImage;
		this.userId = userId;
		this.stampGetDate = stampGetDate;
		this.eventId = eventId;
	}





	public Stamp(String stampNum, String stampContent, int stampStatus,
			String stampImage, String userId, String stampGetDate,
			String eventId, Event event) {
		super();
		this.stampNum = stampNum;
		this.stampContent = stampContent;
		this.stampStatus = stampStatus;
		this.stampImage = stampImage;
		this.userId = userId;
		this.stampGetDate = stampGetDate;
		this.eventId = eventId;
		this.event = event;
	}

	public int getStampStatus() {
		return stampStatus;
	}

	public void setStampStatus(int stampStatus) {
		this.stampStatus = stampStatus;
	}

	public String getStampNum() {
		return stampNum;
	}
	public void setStampNum(String stampNum) {
		this.stampNum = stampNum;
	}
	public String getStampContent() {
		return stampContent;
	}
	public void setStampContent(String stampContent) {
		this.stampContent = stampContent;
	}
	public String getStampImage() {
		return stampImage;
	}
	public void setStampImage(String stampImage) {
		this.stampImage = stampImage;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStampGetDate() {
		return stampGetDate;
	}
	public void setStampGetDate(String stampGetDate) {
		this.stampGetDate = stampGetDate;
	}
	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Stamp [stampNum=");
		builder.append(stampNum);
		builder.append(", stampContent=");
		builder.append(stampContent);
		builder.append(", stampStatus=");
		builder.append(stampStatus);
		builder.append(", stampImage=");
		builder.append(stampImage);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", stampGetDate=");
		builder.append(stampGetDate);
		builder.append(", eventId=");
		builder.append(eventId);
		builder.append("]");
		return builder.toString();
	}



	
}
