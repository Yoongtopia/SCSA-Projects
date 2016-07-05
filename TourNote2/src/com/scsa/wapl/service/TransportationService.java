package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.Transportation;
import com.scsa.wapl.entity.TravelTransportation;

public interface TransportationService {
	
	void createTransportation(Transportation transportaion);
	void createTransportationByAdmin(Transportation transportaion);
	void modifyTransportation(Transportation transportaion);
	void removeTransportation(String transportationType,String transportationName,String countryName);
	List<Transportation> findTransportationListByTypeAndCountry(String transportationType,String countryName);
	int countTransportationListByName(String transportationName);
	List<Transportation> findTransportationList(int startNo, int endNo);
	void createTravelTransportation(TravelTransportation travelTransportaion, int recordNum);
	void modifyTravelTransportation(TravelTransportation travelTransportaion);
	void removeTravelTransportation(int spotNum,int transportationOrder,int recordNum);
	void removeTravelTransportationBySpotNumAndRecordNum(int spotNum,int recordNum);
	List<TravelTransportation> findTravelTransportationList();
	List<TravelTransportation> findTravelTransportationListBySpotNumAndRecordNum(int spotNum,int recordNum);
	List<Transportation> findTransportationListbyLink();
	
	public int listCount();
}//end interface