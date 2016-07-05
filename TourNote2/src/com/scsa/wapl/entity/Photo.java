package com.scsa.wapl.entity;

public class Photo {

	private String photoName;
	private double latitude;
	private double longitude;
	
	public Photo() {
		super();
	}
	
	public Photo(String photoName) {
		super();
		this.photoName = photoName;
	}
	
	public Photo(String photoName, double latitude, double longitude) {
		super();
		this.photoName = photoName;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	public String getPhotoName() {
		return photoName;
	}
	
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	
	public double getLatitude() {
		return latitude;
	}
	
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	
	public double getLongitude() {
		return longitude;
	}
	
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Photo [photoName=");
		builder.append(photoName);
		builder.append(", latitude=");
		builder.append(latitude);
		builder.append(", longitude=");
		builder.append(longitude);
		builder.append("]");
		return builder.toString();
	}
		
}