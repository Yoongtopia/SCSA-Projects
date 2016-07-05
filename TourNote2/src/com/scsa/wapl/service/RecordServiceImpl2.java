package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.wapl.dao.RecordDAO;
import com.scsa.wapl.entity.TravelRecord;

@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
@Repository
public class RecordServiceImpl2 implements RecordService {

	@Autowired
	private RecordDAO recordDao;
	
	@Override
	public void createRecord(TravelRecord travelRecord) {
		recordDao.insertRecord(travelRecord);

	}

	@Override
	public void modifyRecord(TravelRecord travelRecord) {
		recordDao.updateRecord(travelRecord);
	}

	@Override
	public void removeRecord(int recordNum) {
		recordDao.deleteRecord(recordNum);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public TravelRecord findRecord(int recordNum) {
		recordDao.updateRecordHit(recordNum);
		return recordDao.selectRecord(recordNum);
	}

	@Override
	public List<TravelRecord> findRecordList() {
		return recordDao.selectRecordList();
	}

	@Override
	public List<TravelRecord> findRecordById(String memberId) {
		return recordDao.selectRecordById(memberId);
	}

	@Override
	public List<TravelRecord> findRecordByContinental(String continentalName) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<TravelRecord> findNotEndRecordById(String memberId) {
		return recordDao.selectNotEndRecordById(memberId);
	}
	
	@Override
	public String findRecordStartTime(int recordNum, String memberId) {
		return recordDao.selectRecordStartTime(recordNum, memberId);
	}

	@Override
	public void editRecord(String recordCont, int recordNum) {
		recordDao.editRecord(recordCont, recordNum);
	}
}
