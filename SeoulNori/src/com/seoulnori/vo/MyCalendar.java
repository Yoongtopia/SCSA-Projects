package com.seoulnori.vo;

import java.util.List;

public class MyCalendar {
	
	private String userId;
	private String eventId;
	private String calendarMemo;
	private String calendarStatus;
	private String calendarEventDate;
	private List<Event> eventList;
	
	public MyCalendar() {
		super();
	}

	public MyCalendar(String userId, String eventId, String calendarMemo,
			String calendarStatus, String calendarEventDate) {
		super();
		this.userId = userId;
		this.eventId = eventId;
		this.calendarMemo = calendarMemo;
		this.calendarStatus = calendarStatus;
		this.calendarEventDate = calendarEventDate;
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

	public String getCalendarMemo() {
		return calendarMemo;
	}

	public void setCalendarMemo(String calendarMemo) {
		this.calendarMemo = calendarMemo;
	}

	public String getCalendarStatus() {
		return calendarStatus;
	}

	public void setCalendarStatus(String calendarStatus) {
		this.calendarStatus = calendarStatus;
	}

	public String getCalendarEventDate() {
		return calendarEventDate;
	}

	public void setCalendarEventDate(String calendarEventDate) {
		this.calendarEventDate = calendarEventDate;
	}

	public List<Event> getEventList() {
		return eventList;
	}

	public void setEventList(List<Event> eventList) {
		this.eventList = eventList;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MyCalendar [userId=");
		builder.append(userId);
		builder.append(", eventId=");
		builder.append(eventId);
		builder.append(", calendarMemo=");
		builder.append(calendarMemo);
		builder.append(", calendarStatus=");
		builder.append(calendarStatus);
		builder.append(", calendarEventDate=");
		builder.append(calendarEventDate);
		builder.append(", eventList=");
		builder.append(eventList);
		builder.append("]");
		return builder.toString();
	}

}
