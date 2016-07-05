package com.seoulnori.vo;

public class Event {
	private String eventId;
	private String eventTitle;
	private String eventAddress;
	private String eventStartDate;
	private String eventEndDate;
	private float eventAvgStar;
	private String eventThumbnail;
	private String eventGu;
	private String categoryNum;
	private int eventCount;
	private int eventIssuePoint;
	private int count;
	
	public Event() {
		super();
	}

	public Event(String eventId, String eventTitle, String eventAddress,
			String eventStartDate, String eventEndDate, float eventAvgStar,
			String eventThumbnail, String eventGu, String categoryNum,
			int eventCount, int eventIssuePoint) {
		super();
		this.eventId = eventId;
		this.eventTitle = eventTitle;
		this.eventAddress = eventAddress;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
		this.eventAvgStar = eventAvgStar;
		this.eventThumbnail = eventThumbnail;
		this.eventGu = eventGu;
		this.categoryNum = categoryNum;
		this.eventCount = eventCount;
		this.eventIssuePoint = eventIssuePoint;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventAddress() {
		return eventAddress;
	}

	public void setEventAddress(String eventAddress) {
		this.eventAddress = eventAddress;
	}

	public String getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public String getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(String eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	public float getEventAvgStar() {
		return eventAvgStar;
	}

	public void setEventAvgStar(float eventAvgStar) {
		this.eventAvgStar = eventAvgStar;
	}

	public String getEventThumbnail() {
		return eventThumbnail;
	}

	public void setEventThumbnail(String eventThumbnail) {
		this.eventThumbnail = eventThumbnail;
	}

	public String getEventGu() {
		return eventGu;
	}

	public void setEventGu(String eventGu) {
		this.eventGu = eventGu;
	}

	public String getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(String categoryNum) {
		this.categoryNum = categoryNum;
	}

	public int getEventCount() {
		return eventCount;
	}

	public void setEventCount(int eventCount) {
		this.eventCount = eventCount;
	}

	public int getEventIssuePoint() {
		return eventIssuePoint;
	}

	public void setEventIssuePoint(int eventIssuePoint) {
		this.eventIssuePoint = eventIssuePoint;
	}

	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [eventId=");
		builder.append(eventId);
		builder.append(", eventTitle=");
		builder.append(eventTitle);
		builder.append(", eventAddress=");
		builder.append(eventAddress);
		builder.append(", eventStartDate=");
		builder.append(eventStartDate);
		builder.append(", eventEndDate=");
		builder.append(eventEndDate);
		builder.append(", eventAvgAtar=");
		builder.append(eventAvgStar);
		builder.append(", eventThumbnail=");
		builder.append(eventThumbnail);
		builder.append(", eventGu=");
		builder.append(eventGu);
		builder.append(", categoryNum=");
		builder.append(categoryNum);
		builder.append(", eventCount=");
		builder.append(eventCount);
		builder.append(", eventIssuePoint=");
		builder.append(eventIssuePoint);
		builder.append("]");
		return builder.toString();
	}
}
