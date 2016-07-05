package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.TravelRecord;

public interface RecordDAO {

	public void insertRecord(TravelRecord travelRecord);
	public void updateRecord(TravelRecord travelRecord);
	public void editRecord(String recordCont, int recordNum);
	public void deleteRecord(int recordNum);
	public TravelRecord selectRecord(int recordNum);
	public void updateRecordHit(int recordNum);
	public List<TravelRecord> selectRecordList();
	public List<TravelRecord> selectRecordById(String memberId);
	public List<TravelRecord> selectRecordByContinental(String continentalName);
	public List<TravelRecord> selectRecordListByTitle(String recordTitle);
	public List<TravelRecord> selectNotEndRecordById(String memberId);
	public String selectRecordStartTime(int recordNum, String memberId);
	
}//end interface