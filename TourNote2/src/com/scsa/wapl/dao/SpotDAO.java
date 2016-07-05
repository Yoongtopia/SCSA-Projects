package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.Photo;
import com.scsa.wapl.entity.TravelSpot;

public interface SpotDAO {

	void insertSpot(TravelSpot spot);
	void insertPhoto(Photo photo, int recordNum, int spotNum);
	List<Photo> selectPhotoBySpotNumAndRecordNum(int recordNum, int spotNum);
	List<Photo> selectPhotoWithGps(int recordNum, int spotNum);
	void updateSpot(TravelSpot spot);
	void updateSpotNum(TravelSpot spot);
	void deleteSpot(int recordNum, int spotNum);
	void deletePhoto(String photoName, int recordNum, int spotNum);
	void deletePhotoBySpotNumAndRecordNum(int recordNum, int spotNum);
	Photo selectPhoto(String photoName, int recordNum, int spotNum);
	int countRecordNum(int recordNum);
	//void deletePhotoWithSpot(int int);
	TravelSpot selectSpot(int recordNum, int spotNum);
	List<TravelSpot> selectSpotListByRecordNum(int recordNum);
	
	List<TravelSpot> timeLineList(int recordNum);
	public int listCount(int recordNum);
	
}//end interface