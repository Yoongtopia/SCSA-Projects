package com.orakgarak.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BigDataDAOImpl implements BigDataDAO {
private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public boolean updateScore(int score, String code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("score", score);
		map.put("code", code);
		
		return sqlSessionTemplate.update("BigData.updatePentagonBigData", map) > 0;
	}

}
