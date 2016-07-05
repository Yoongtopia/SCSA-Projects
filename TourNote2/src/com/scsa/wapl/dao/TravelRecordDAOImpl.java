package com.scsa.wapl.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.TravelRecord;

@Repository
public class TravelRecordDAOImpl implements TravelRecordDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	/*@Override
	public List<TravelRecord> selectTravelRecordList(String ContinentalName,
			String lineup) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("continentalName", ContinentalName);
		map.put("lineup", lineup);
		return sqlSessionTemplate.selectList("TravelRecord.TravelRecordList", map);
	}*/
	
	//동기, 페이징 시도
	@Override
	public List<TravelRecord> selectTravelRecordList(String ContinentalName,
			String lineup, int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("continentalName", ContinentalName);
		map.put("lineup", lineup);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		return sqlSessionTemplate.selectList("TravelRecord.TravelRecordList", map);
	}
	
	//비동기, 페이징 시도
/*	@Override
	public List<TravelRecord> selectTravelRecordList(String ContinentalName,
			String lineup, int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("continentalName", ContinentalName);
		map.put("lineup", lineup);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		return sqlSessionTemplate.selectList("TravelRecord.TravelRecordList", map);
	}
*/
	@Override
	public List<TravelRecord> selectTravelRecordListByKeyword(
			String keyword) {
		return sqlSessionTemplate.selectList("TravelRecord.selectTravelRecordListByKeyword", keyword);
	}

	@Override
	public List<TravelRecord> selectRecordListById(String recordWriter) {
		
		return sqlSessionTemplate.selectList("TravelRecord.selectRecordListById", recordWriter);
	}

	@Override
	public int listCount(String continentalName) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("continentalName", continentalName);
		return sqlSessionTemplate.selectOne("TravelRecord.listCount", map);
	}

}
