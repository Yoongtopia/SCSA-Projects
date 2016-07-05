package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Component;

import com.scsa.wapl.dao.RecordLocationDAO;
import com.scsa.wapl.entity.RecordRoute;
import com.scsa.wapl.entity.TravelRecord;

@Component
public class RecordLocationServiceImpl implements RecordLocationService {
	
	@Autowired
	private RecordLocationDAO recordLocationDao;
	
	public void setRecordLocationDao(RecordLocationDAO recordLocationDao) {
		this.recordLocationDao = recordLocationDao;
	}

	@Override
	public void createRoute(RecordRoute recordRoute) {
		recordLocationDao.insertRoute(recordRoute);
	}
	
	@Override
	public List<RecordRoute> findRouteByNum(int recordNum) {
		return recordLocationDao.selectRouteByNum(recordNum);
	}
	
	@Override
	public void removeRoute(int recordNum, String recordTime) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createContinental(String continentalName, int recordNum) {
		recordLocationDao.insertContinental(continentalName, recordNum);	
	}

	@Override
	public void removeContinental(String continentalName, int recordNum) {
		// TODO Auto-generated method stub
		
	}

}
