package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.RecordRoute;

public interface RecordLocationDAO {
	void insertRoute(RecordRoute recordRoute);
	void deleteRoute(int recordNum, String recordTime);
	List<RecordRoute> selectRouteByNum(int recordNum);
	void insertContinental(String continentalName, int recordNum);
	void deleteContinental(String continentalName, int recordNum);
}
