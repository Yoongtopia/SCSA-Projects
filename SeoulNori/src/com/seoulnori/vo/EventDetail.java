package com.seoulnori.vo;

public class EventDetail extends Event {
	
	private String mapX;
	private String mapY;
	private String eventPhone;
	private String eventContent;
	private String eventAgeLimit;
	private String eventCost;
	private String bookingPlace;
	private String eventHompage;
	private String eventPlace;
	private String playTime;
	
	public EventDetail() {
		super();
	}

	

	public EventDetail(String mapX, String mapY, String eventPhone,
			String eventContent, String eventAgeLimit, String eventCost,
			String bookingPlace, String eventHompage, String eventPlace,
			String playTime) {
		super();
		this.mapX = mapX;
		this.mapY = mapY;
		this.eventPhone = eventPhone;
		this.eventContent = eventContent;
		this.eventAgeLimit = eventAgeLimit;
		this.eventCost = eventCost;
		this.bookingPlace = bookingPlace;
		this.eventHompage = eventHompage;
		this.eventPlace = eventPlace;
		this.playTime = playTime;
	}



	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}

	public String getEventPhone() {
		return eventPhone;
	}

	public void setEventPhone(String eventPhone) {
		this.eventPhone = eventPhone;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventAgeLimit() {
		return eventAgeLimit;
	}

	public void setEventAgeLimit(String eventAgeLimit) {
		this.eventAgeLimit = eventAgeLimit;
	}

	public String getEventCost() {
		return eventCost;
	}

	public void setEventCost(String eventCost) {
		this.eventCost = eventCost;
	}

	
	
	public String getBookingPlace() {
		return bookingPlace;
	}

	public void setBookingPlace(String bookingPlace) {
		this.bookingPlace = bookingPlace;
	}

	public String getEventHompage() {
		return eventHompage;
	}

	public void setEventHompage(String eventHompage) {
		this.eventHompage = eventHompage;
	}

	public String getEventPlace() {
		return eventPlace;
	}

	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}

	public String getPlayTime() {
		return playTime;
	}

	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EventDetail [EventId()=");
		builder.append(getEventId());
		builder.append(", EventTitle()=");
		builder.append(getEventTitle());
		builder.append(", EventAddress()=");
		builder.append(getEventAddress());
		builder.append(", EventStartDate()=");
		builder.append(getEventStartDate());
		builder.append(", EventEndDate()=");
		builder.append(getEventEndDate());
		builder.append(", EventAvgStar()=");
		builder.append(getEventAvgStar());
		builder.append(", EventThumbnail()=");
		builder.append(getEventThumbnail());
		builder.append(", EventGu()=");
		builder.append(getEventGu());
		builder.append(", CategoryNum()=");
		builder.append(getCategoryNum());
		builder.append(", EventCount()=");
		builder.append(getEventCount());
		builder.append(", EventIssuePoint()=");
		builder.append(getEventIssuePoint());
		builder.append(", mapX=");
		builder.append(mapX);
		builder.append(", mapY=");
		builder.append(mapY);
		builder.append(", eventPhone=");
		builder.append(eventPhone);
		builder.append(", eventContent=");
		builder.append(eventContent);
		builder.append(", eventAgeLimit=");
		builder.append(eventAgeLimit);
		builder.append(", eventCost=");
		builder.append(eventCost);
		builder.append("]");
		return builder.toString();
	}
	
	
}
