package com.scsa.wapl.entity;

public class TravelTransportation {

	private int spotNum;
	private int transportationOrder;
	private String transportationType;
	private String transportationName;
	private String countryName;
	private Transportation transportation;
	public TravelTransportation() {
		super();
	}
	
	public TravelTransportation(int spotNum, int transportationOrder,
			String transportationType, String transportationName,
			String countryName) {
		super();
		this.spotNum = spotNum;
		this.transportationOrder = transportationOrder;
		this.transportationType = transportationType;
		this.transportationName = transportationName;
		this.countryName = countryName;
	}

	public TravelTransportation(int spotNum, int transportationOrder,
			String transportationType, String transportationName,
			String countryName, Transportation transportation) {
		super();
		this.spotNum = spotNum;
		this.transportationOrder = transportationOrder;
		this.transportationType = transportationType;
		this.transportationName = transportationName;
		this.countryName = countryName;
		this.transportation = transportation;
	}
	public int getSpotNum() {
		return spotNum;
	}
	public void setSpotNum(int spotNum) {
		this.spotNum = spotNum;
	}
	public int getTransportationOrder() {
		return transportationOrder;
	}
	public void setTransportationOrder(int transportationOrder) {
		this.transportationOrder = transportationOrder;
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
	public Transportation getTransportation() {
		return transportation;
	}
	public void setTransportation(Transportation transportation) {
		this.transportation = transportation;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TravelTransportation [spotNum=");
		builder.append(spotNum);
		builder.append(", transportationOrder=");
		builder.append(transportationOrder);
		builder.append(", transportationType=");
		builder.append(transportationType);
		builder.append(", transportationName=");
		builder.append(transportationName);
		builder.append(", countryName=");
		builder.append(countryName);
		builder.append(", transportation=");
		builder.append(transportation);
		builder.append("]");
		return builder.toString();
	}
}