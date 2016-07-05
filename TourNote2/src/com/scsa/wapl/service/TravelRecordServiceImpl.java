package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.wapl.dao.TravelRecordDAO;
import com.scsa.wapl.entity.TravelRecord;

@Component
@Transactional(propagation=Propagation.SUPPORTS)
public class TravelRecordServiceImpl implements TravelRecordService {

	private TravelRecordDAO recordDao;
	
	@Autowired
	public void setRecordDao(TravelRecordDAO recordDao) {
		this.recordDao = recordDao;
	}

	/*@Override
	public List<TravelRecord> findTravelRecordList(String continentalName, String lineup) {
		
		return recordDao.selectTravelRecordList(continentalName, lineup);
	}*/
	
	
	@Override
	public List<TravelRecord> findTravelRecordList(String continentalName, String lineup, int startNo, int endNo) {
		
		return recordDao.selectTravelRecordList(continentalName, lineup, startNo, endNo);
	}
	
	/*@Override
	public List<TravelRecord> findTravelRecordList(String continentalName, String lineup, int startNo, int endNo) {
		
		return recordDao.selectTravelRecordList(continentalName, lineup, startNo, endNo);
	}*/

	@Override
	public List<TravelRecord> findTravelRecordListByKeyword(String keyword) {
		return recordDao.selectTravelRecordListByKeyword(keyword);
	}

	@Override
	public List<TravelRecord> findRecordListById(String recordWriter) {
		return recordDao.selectRecordListById(recordWriter);
	}

	@Override
	public int listCount(String continentalName) {
		return recordDao.listCount(continentalName);
	}

}
