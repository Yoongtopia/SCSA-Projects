package com.scsa.wapl.entity;

import java.util.List;

public class TravelSpot {

	private int spotNum;
	private String spotWriter;
	private String spotTitle;
	private String spotCont;
	private double spotLatitude;
	private double spotLongitude;
	private String spotTime;
	private int recordNum;
	private String uploadType;
	private List<TravelTransportation> travelTransportationList;
	private List<Photo> photoList;
	
	public TravelSpot() {
		super();
	}

	public TravelSpot(int spotNum, String spotWriter, String spotTitle,
			String spotCont, double spotLatitude, double spotLongitude,
			int recordNum, String uploadType) {
		super();
		this.spotNum = spotNum;
		this.spotWriter = spotWriter;
		this.spotTitle = spotTitle;
		this.spotCont = spotCont;
		this.spotLatitude = spotLatitude;
		this.spotLongitude = spotLongitude;
		this.recordNum = recordNum;
		this.uploadType = uploadType;
	}
	
	public TravelSpot(int spotNum, String spotWriter, String spotTitle,
			String spotCont, double spotLatitude, double spotLongitude,
			String spotTime, int recordNum, String uploadType) {
		super();
		this.spotNum = spotNum;
		this.spotWriter = spotWriter;
		this.spotTitle = spotTitle;
		this.spotCont = spotCont;
		this.spotLatitude = spotLatitude;
		this.spotLongitude = spotLongitude;
		this.spotTime = spotTime;
		this.recordNum = recordNum;
		this.uploadType = uploadType;
	}

	public TravelSpot(int spotNum, String spotWriter, String spotTitle,
			String spotCont, double spotLatitude, double spotLongitude,
			String spotTime, int recordNum, String uploadType,
			List<TravelTransportation> travelTransportationList,
			List<Photo> photoList) {
		super();
		this.spotNum = spotNum;
		this.spotWriter = spotWriter;
		this.spotTitle = spotTitle;
		this.spotCont = spotCont;
		this.spotLatitude = spotLatitude;
		this.spotLongitude = spotLongitude;
		this.spotTime = spotTime;
		this.recordNum = recordNum;
		this.uploadType = uploadType;
		this.travelTransportationList = travelTransportationList;
		this.photoList = photoList;
	}

	public int getSpotNum() {
		return spotNum;
	}

	public void setSpotNum(int spotNum) {
		this.spotNum = spotNum;
	}

	public String getSpotWriter() {
		return spotWriter;
	}

	public void setSpotWriter(String spotWriter) {
		this.spotWriter = spotWriter;
	}

	public String getSpotTitle() {
		return spotTitle;
	}

	public void setSpotTitle(String spotTitle) {
		this.spotTitle = spotTitle;
	}

	public String getSpotCont() {
		return spotCont;
	}

	public void setSpotCont(String spotCont) {
		this.spotCont = spotCont;
	}

	public double getSpotLatitude() {
		return spotLatitude;
	}

	public void setSpotLatitude(double spotLatitude) {
		this.spotLatitude = spotLatitude;
	}

	public double getSpotLongitude() {
		return spotLongitude;
	}

	public void setSpotLongitude(double spotLongitude) {
		this.spotLongitude = spotLongitude;
	}

	public String getSpotTime() {
		return spotTime;
	}

	public void setSpotTime(String spotTime) {
		this.spotTime = spotTime;
	}

	public int getRecordNum() {
		return recordNum;
	}

	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}
	
	public String getUploadType() {
		return uploadType;
	}

	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}
	
	public List<TravelTransportation> getTravelTransportationList() {
		return travelTransportationList;
	}

	public void setTravelTransportationList(
			List<TravelTransportation> travelTransportationList) {
		this.travelTransportationList = travelTransportationList;
	}

	public List<Photo> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TravelSpot [spotNum=");
		builder.append(spotNum);
		builder.append(", spotWriter=");
		builder.append(spotWriter);
		builder.append(", spotTitle=");
		builder.append(spotTitle);
		builder.append(", spotCont=");
		builder.append(spotCont);
		builder.append(", spotLatitude=");
		builder.append(spotLatitude);
		builder.append(", spotLongitude=");
		builder.append(spotLongitude);
		builder.append(", spotTime=");
		builder.append(spotTime);
		builder.append(", recordNum=");
		builder.append(recordNum);
		builder.append(", uploadType=");
		builder.append(uploadType);
		builder.append(", travelTransportationList=");
		builder.append(travelTransportationList);
		builder.append(", photoList=");
		builder.append(photoList);
		builder.append("]");
		return builder.toString();
	}

}//end class
