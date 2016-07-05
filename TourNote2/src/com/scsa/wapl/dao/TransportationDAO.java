package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.Transportation;
import com.scsa.wapl.entity.TravelTransportation;

public interface TransportationDAO {
	
	void insertTransportation(Transportation transportaion);
	void insertTransportationByAdmin(Transportation transportaion);
	void updateTransportation(Transportation transportaion);
	void deleteTransportation(String transportationType,String transportationName,String countryName);
	List<Transportation> selectTransportationListByTypeAndCountry(String transportationType,String countryName);
	int countTransportationListByName(String transportationName);
	List<Transportation> selectTransportationList(int startNo, int endNo);
	List<Transportation> selectTransportationListbyLink();
	void insertTravelTransportation(TravelTransportation travelTransportaion, int recordNum);
	void updateTravelTransportation(TravelTransportation travelTransportaion);
	void deleteTravelTransportation(int spotNum,int transportationOrder,int recordNum);
	void deleteTravelTransportationBySpotNumAndRecordNum(int spotNum,int recordNum);
	List<TravelTransportation> selectTravelTransportationList();
	List<TravelTransportation> selectTravelTransportationListBySpotNumAndRecordNum(int spotNum,int recordNum);
	public int listCount();
		
}//end interface