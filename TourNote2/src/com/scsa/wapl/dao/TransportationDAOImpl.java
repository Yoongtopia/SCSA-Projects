package com.scsa.wapl.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.Transportation;
import com.scsa.wapl.entity.TravelTransportation;

@Repository
public class TransportationDAOImpl implements TransportationDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void insertTransportation(Transportation transportaion) {
		sqlSessionTemplate.insert("Transportation.insertTransportation",transportaion);	
	}
	@Override
	public void insertTransportationByAdmin(Transportation transportaion) {
		sqlSessionTemplate.insert("Transportation.insertTransportationByAdmin",transportaion);	
	}

	@Override
	public void updateTransportation(Transportation transportaion) {
		sqlSessionTemplate.insert("Transportation.updateTransportation", transportaion);
	}

	@Override
	public void deleteTransportation(String transportationType,
			String transportationName, String countryName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("transportationType", transportationType);
		map.put("transportationName", transportationName);
		map.put("countryName", countryName);
		sqlSessionTemplate.delete("Transportation.deleteTransportation", map);
	}

	@Override
	public List<Transportation> selectTransportationListByTypeAndCountry(
			String transportationType, String countryName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("transportationType", transportationType);
		map.put("countryName", countryName);
		return sqlSessionTemplate.selectList("Transportation.selectTransportationListByTypeAndCountry", map);
	}

	@Override
	public int countTransportationListByName(String transportationName) {
		return sqlSessionTemplate.selectOne("Transportation.countTransportationListByName",transportationName);
	}

	@Override
	public List<Transportation> selectTransportationList( int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		return sqlSessionTemplate.selectList("Transportation.selectTransportationList", map);
	}

	@Override
	public void insertTravelTransportation(
			TravelTransportation travelTransportaion, int recordNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("spotNum", travelTransportaion.getSpotNum());
		map.put("transportationOrder", travelTransportaion.getTransportationOrder());
		map.put("recordNum", recordNum);
		map.put("countryName", travelTransportaion.getCountryName());
		map.put("transportationName", travelTransportaion.getTransportationName());
		map.put("transportationType", travelTransportaion.getTransportationType());
		sqlSessionTemplate.insert("Transportation.insertTravelTransportation",map);		
	}

	@Override
	public void updateTravelTransportation(
			TravelTransportation travelTransportaion) {		
	}

	@Override
	public void deleteTravelTransportation(int spotNum,
			int transportationOrder, int recordNum) {		
	}

	@Override
	public List<TravelTransportation> selectTravelTransportationList() {
		return null;
	}

	@Override
	public List<Transportation> selectTransportationListbyLink() {
		return null;
	}

	@Override
	public int listCount() {
		return sqlSessionTemplate.selectOne("Transportation.listCount");
	}
	
	@Override
	public void deleteTravelTransportationBySpotNumAndRecordNum(int spotNum,
			int recordNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordNum",recordNum);
		map.put("spotNum",spotNum);
		sqlSessionTemplate.delete("TravelTransportation.deleteTravelTransportationBySpotNumAndRecordNum", map);
	}
	
	@Override
	public List<TravelTransportation> selectTravelTransportationListBySpotNumAndRecordNum(int spotNum,
			int recordNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("recordNum",recordNum);
		map.put("spotNum",spotNum);		
		return sqlSessionTemplate.selectList("TravelTransportation.selectTravelTransportationListBySpotNumAndRecordNum", map);
	}

}//end class