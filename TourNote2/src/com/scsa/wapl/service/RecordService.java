package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.TravelRecord;

public interface RecordService {

	public void createRecord(TravelRecord travelRecord);
	public void modifyRecord(TravelRecord travelRecord);
	public void editRecord(String recordCont, int recordNum);
	public void removeRecord(int recordNum);
	public TravelRecord findRecord(int recordNum);
	public List<TravelRecord> findRecordList();
	public List<TravelRecord> findRecordById(String memberId);
	public List<TravelRecord> findRecordByContinental(String continentalName);
	public List<TravelRecord> findNotEndRecordById(String memberId);
	public String findRecordStartTime(int recordNum, String memberId);

}
