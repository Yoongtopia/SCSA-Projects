package com.scsa.wapl.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.TravelRecord;

@Repository
public class RecordDAOImpl2 implements RecordDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertRecord(TravelRecord travelRecord) {
		sqlSessionTemplate.insert("TravelRecord.insertRecord", travelRecord);
	}

	@Override
	public void updateRecord(TravelRecord travelRecord) {
		sqlSessionTemplate.update("TravelRecord.updateRecord", travelRecord);
	}
	
	@Override
	public void editRecord(String recordCont, int recordNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordCont", recordCont);
		map.put("recordNum", recordNum);
		sqlSessionTemplate.update("TravelRecord.editRecord", map);
	}

	@Override
	public void deleteRecord(int recordNum) {
		sqlSessionTemplate.delete("TravelRecord.deleteRecord", recordNum);
	}

	@Override
	public TravelRecord selectRecord(int recordNum) {
		return sqlSessionTemplate.selectOne("TravelRecord.selectRecord", recordNum);
	}

	@Override
	public List<TravelRecord> selectRecordList() {
		return sqlSessionTemplate.selectList("TravelRecord.selectRecordList");
	}

	@Override
	public List<TravelRecord> selectRecordById(String memberId) {
		return sqlSessionTemplate.selectList("TravelRecord.selectRecordById",memberId);
	}

	@Override
	public List<TravelRecord> selectRecordByContinental(String continentalName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TravelRecord> selectRecordListByTitle(String recordTitle) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<TravelRecord> selectNotEndRecordById(String memberId) {
		List<TravelRecord> list=sqlSessionTemplate.selectList("TravelRecord.selectNotEndRecordById", memberId);
		if (list.size() > 0){
			return list;
		} else {
			return null;
		}
	}
	
	@Override
	public String selectRecordStartTime(int recordNum, String memberId) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordNum", recordNum);
		map.put("memberId", memberId);
		return sqlSessionTemplate.selectOne("TravelRecord.selectRecordStartTime", map);
	}

	@Override
	public void updateRecordHit(int recordNum) {
		sqlSessionTemplate.update("TravelRecord.updateRecordHit", recordNum);
		
	}



}
