package com.scsa.wapl.entity;

public class Transportation {
	
	private String transportationType;
	private String transportationName;
	private String countryName;
	private String cityName;
	private String link;
	
	public Transportation() {
		super();
	}
	public Transportation(String transportationType, String transportationName,
			String countryName) {
		super();
		this.transportationType = transportationType;
		this.transportationName = transportationName;
		this.countryName = countryName;
	}
	public Transportation(String transportationType, String transportationName,
			String countryName, String cityName, String link) {
		super();
		this.transportationType = transportationType;
		this.transportationName = transportationName;
		this.countryName = countryName;
		this.cityName = cityName;
		this.link = link;
	}
	
	public String getTransportationType() {
		return transportationType;
	}
	
	public void setTransportationType(String transportationType) {
		this.transportationType = transportationType;
	}
	
	public String getTransportationName() {
		return transportationName;
	}
	
	public void setTransportationName(String transportationName) {
		this.transportationName = transportationName;
	}
	
	public String getCountryName() {
		return countryName;
	}
	
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	
	public String getCityName() {
		return cityName;
	}
	
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
	public String getLink() {
		return link;
	}
	
	public void setLink(String link) {
		this.link = link;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Transportation [transportationType=");
		builder.append(transportationType);
		builder.append(", transportationName=");
		builder.append(transportationName);
		builder.append(", countryName=");
		builder.append(countryName);
		builder.append(", cityName=");
		builder.append(cityName);
		builder.append(", link=");
		builder.append(link);
		builder.append("]");
		return builder.toString();
	}
	
}