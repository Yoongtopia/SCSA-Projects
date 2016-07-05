package com.scsa.wapl.entity;

import java.util.List;

public class TravelRecord {

	private int recordNum;
	private String recordWriter;
	private String recordTitle;
	private String recordCont;
	private String recordPhoto;
	private String recordStartTime;
	private int recordHit;
	private int recommend;
	private String openPublic;
	private List<String> continentalName;
	private List<TravelSpot> travelSpotList;
	private List<RecordRoute> routeList;
	
	public TravelRecord() {
		super();
	}
	public TravelRecord(String recordWriter, String recordTitle) {
		super();
		this.recordWriter = recordWriter;
		this.recordTitle = recordTitle;
	}
	
	public TravelRecord(List<String> continentalName) {
		super();
		this.continentalName = continentalName;
	}
	public TravelRecord(int recordNum, String recordWriter, String recordTitle,
			String recordCont, String recordPhoto, String recordStartTime,
			int recordHit, int recommend, String openPublic,
			List<String> continentalName, List<TravelSpot> travelSpotList,
			List<RecordRoute> routeList) {
		super();
		this.recordNum = recordNum;
		this.recordWriter = recordWriter;
		this.recordTitle = recordTitle;
		this.recordCont = recordCont;
		this.recordPhoto = recordPhoto;
		this.recordStartTime = recordStartTime;
		this.recordHit = recordHit;
		this.recommend = recommend;
		this.openPublic = openPublic;
		this.continentalName = continentalName;
		this.travelSpotList = travelSpotList;
		this.routeList = routeList;
	}

	public int getRecordNum() {
		return recordNum;
	}

	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}

	public String getRecordWriter() {
		return recordWriter;
	}

	public void setRecordWriter(String recordWriter) {
		this.recordWriter = recordWriter;
	}

	public String getRecordTitle() {
		return recordTitle;
	}

	public void setRecordTitle(String recordTitle) {
		this.recordTitle = recordTitle;
	}

	public String getRecordCont() {
		return recordCont;
	}

	public void setRecordCont(String recordCont) {
		this.recordCont = recordCont;
	}
	public void setRecordPhoto(String recordPhoto) {
		this.recordPhoto = recordPhoto;
	}
	
	public String getRecordPhoto() {
		return recordPhoto;
	}

	public String getRecordStartTime() {
		return recordStartTime;
	}

	public void setRecordStartTime(String recordStartTime) {
		this.recordStartTime = recordStartTime;
	}

	public int getRecordHit() {
		return recordHit;
	}

	public void setRecordHit(int recordHit) {
		this.recordHit = recordHit;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	
	public String getOpenPublic() {
		return openPublic;
	}
	
	public void setOpenPublic(String openPublic) {
		this.openPublic = openPublic;
	}

	public List<String> getContinentalName() {
		return continentalName;
	}

	public void setContinentalName(List<String> continentalName) {
		this.continentalName = continentalName;
	}

	public List<TravelSpot> getTravelSpotList() {
		return travelSpotList;
	}

	public void setTravelSpotList(List<TravelSpot> travelSpotList) {
		this.travelSpotList = travelSpotList;
	}
	
	public List<RecordRoute> getRouteList() {
		return routeList;
	}

	public void setRouteList(List<RecordRoute> routeList) {
		this.routeList = routeList;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TravelRecord [recordNum=");
		builder.append(recordNum);
		builder.append(", recordWriter=");
		builder.append(recordWriter);
		builder.append(", recordTitle=");
		builder.append(recordTitle);
		builder.append(", recordCont=");
		builder.append(recordCont);
		builder.append(", recordPhoto=");
		builder.append(recordPhoto);
		builder.append(", recordStartTime=");
		builder.append(recordStartTime);
		builder.append(", recordHit=");
		builder.append(recordHit);
		builder.append(", recommend=");
		builder.append(recommend);
		builder.append(", openPublic=");
		builder.append(openPublic);
		builder.append(", continentalName=");
		builder.append(continentalName);
		builder.append(", travelSpotList=");
		builder.append(travelSpotList);
		builder.append(", routeList=");
		builder.append(routeList);
		builder.append("]");
		return builder.toString();
	}
	
}