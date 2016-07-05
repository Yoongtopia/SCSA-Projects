package com.scsa.wapl.entity;

public class RecordRoute {

	private int recordNum;
	private String recordTime;
	private double recordLatitude;
	private double recordLongitude;
	
	public RecordRoute() {
		super();
	}
	public RecordRoute(int recordNum, double recordLatitude,
			double recordLongitude) {
		super();
		this.recordNum = recordNum;
		this.recordLatitude = recordLatitude;
		this.recordLongitude = recordLongitude;
	}
	public RecordRoute(int recordNum, String recordTime, double recordLatitude,
			double recordLongitude) {
		super();
		this.recordNum = recordNum;
		this.recordTime = recordTime;
		this.recordLatitude = recordLatitude;
		this.recordLongitude = recordLongitude;
	}

	public int getRecordNum() {
		return recordNum;
	}

	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}

	public String getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
	}

	public double getRecordLatitude() {
		return recordLatitude;
	}

	public void setRecordLatitude(double recordLatitude) {
		this.recordLatitude = recordLatitude;
	}

	public double getRecordLongitude() {
		return recordLongitude;
	}

	public void setRecordLongitude(double recordLongitude) {
		this.recordLongitude = recordLongitude;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecordRoute [recordNum=");
		builder.append(recordNum);
		builder.append(", recordTime=");
		builder.append(recordTime);
		builder.append(", recordLatitude=");
		builder.append(recordLatitude);
		builder.append(", recordLongitude=");
		builder.append(recordLongitude);
		builder.append("]");
		return builder.toString();
	}
	
	
}
