package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.RecordRoute;

public interface RecordLocationService {
	void createRoute(RecordRoute recordRoute);
	void removeRoute(int recordNum, String recordTime);
	List<RecordRoute> findRouteByNum(int recordNum);
	void createContinental(String continentalName, int recordNum);
	void removeContinental(String continentalName, int recordNum);
}
