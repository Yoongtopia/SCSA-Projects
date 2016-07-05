package com.seoulnori.vo;

public class EventPoint {
	private String eventId;
	private int naverTrendPoint;
	private int tweetPoint;
	
	public EventPoint() {
		super();
	}
	
	public EventPoint(String eventId) {
		super();
		this.eventId = eventId;
	}

	public EventPoint(String eventId, int naverTrendPoint) {
		super();
		this.eventId = eventId;
		this.naverTrendPoint = naverTrendPoint;
	}

	public EventPoint(String eventId, int naverTrendPoint, int tweetPoint) {
		super();
		this.eventId = eventId;
		this.naverTrendPoint = naverTrendPoint;
		this.tweetPoint = tweetPoint;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public int getNaverTrendPoint() {
		return naverTrendPoint;
	}

	public void setNaverTrendPoint(int naverTrendPoint) {
		this.naverTrendPoint = naverTrendPoint;
	}

	public int getTweetPoint() {
		return tweetPoint;
	}

	public void setTweetPoint(int tweetPoint) {
		this.tweetPoint = tweetPoint;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EventPoint [eventId=");
		builder.append(eventId);
		builder.append(", naverTrendPoint=");
		builder.append(naverTrendPoint);
		builder.append(", tweetPoint=");
		builder.append(tweetPoint);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
