package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.Photo;
import com.scsa.wapl.entity.TravelSpot;

public interface SpotService {

	void createSpot(TravelSpot spot);
	void createPhoto(Photo photo, int recordNum, int spotNum);
	List<Photo> findPhotoBySpotNumAndRecordNum(int recordNum, int spotNum);
	List<Photo> findPhotoWithGps(int recordNum, int spotNum);
	void modifySpot(TravelSpot spot);
	void modifySpotNum(TravelSpot spot);
	void removeSpot(int recordNum, int spotNum);
	void removePhoto(String photoName, int recordNum, int spotNum);
	void removePhotoBySpotNumAndRecordNum(int recordNum, int spotNum);
	Photo findPhoto(String photoName, int recordNum, int spotNum);
	int countRecordNum(int recordNum);
	//void removePhotoWithSpot(int int);
	TravelSpot findSpot(int recordNum, int spotNum);
	List<TravelSpot> findSpotListByRecordNum(int recordNum);
	
	List<TravelSpot> timeLineList(int recordNum);
	public int listCount(int recordNum);
	
}//end interface