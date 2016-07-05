package com.scsa.wapl.dao;

import java.util.HashMap;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.RecordRoute;
@Repository
public class RecordLocationDAOImpl implements RecordLocationDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessiontemplate(SqlSessionTemplate sqlSessiontemplate) {
		this.sqlSessionTemplate = sqlSessiontemplate;
	}
	
	@Override
	public void insertRoute(RecordRoute recordRoute) {
		sqlSessionTemplate.insert("RecordLocation.insertRoute", recordRoute);	
	}

	@Override
	public void deleteRoute(int recordNum, String recordTime) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<RecordRoute> selectRouteByNum(int recordNum) {
		return sqlSessionTemplate.selectList("RecordLocation.selectRouteByNum", recordNum);
	}
	
	@Override
	public void insertContinental(String continentalName, int recordNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("continentalName", continentalName);
		map.put("recordNum", recordNum);
		sqlSessionTemplate.insert("RecordLocation.insertContinental", map);
	}

	@Override
	public void deleteContinental(String continentalName, int recordNum) {
		// TODO Auto-generated method stub
		
	}

}
