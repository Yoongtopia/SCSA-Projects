package com.seoulnori.vo;

public class EventNews {
	
	private String eventNewsTitle;
	private String eventNewsDescription;
	private String eventNewsLink;
	private String eventPublishedDate;
	
	public EventNews() {
		super();
	}

	public EventNews(String eventNewsTitle, String eventNewsDescription,
			String eventNewsLink, String eventPublishedDate) {
		super();
		this.eventNewsTitle = eventNewsTitle;
		this.eventNewsDescription = eventNewsDescription;
		this.eventNewsLink = eventNewsLink;
		this.eventPublishedDate = eventPublishedDate;
	}

	public String getEventNewsTitle() {
		return eventNewsTitle;
	}

	public void setEventNewsTitle(String eventNewsTitle) {
		this.eventNewsTitle = eventNewsTitle;
	}

	public String getEventNewsDescription() {
		return eventNewsDescription;
	}

	public void setEventNewsDescription(String eventNewsDescription) {
		this.eventNewsDescription = eventNewsDescription;
	}

	public String getEventNewsLink() {
		return eventNewsLink;
	}

	public void setEventNewsLink(String eventNewsLink) {
		this.eventNewsLink = eventNewsLink;
	}

	public String getEventPublishedDate() {
		return eventPublishedDate;
	}

	public void setEventPublishedDate(String eventPublishedDate) {
		this.eventPublishedDate = eventPublishedDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EventNews [eventNewsTitle=");
		builder.append(eventNewsTitle);
		builder.append(", eventNewsDescription=");
		builder.append(eventNewsDescription);
		builder.append(", eventNewsLink=");
		builder.append(eventNewsLink);
		builder.append(", eventPublishedDate=");
		builder.append(eventPublishedDate);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
