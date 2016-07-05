package com.scsa.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Key;

@Repository
public class KeyDAOImpl implements KeyDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public boolean keyInsert(String user_id, String key) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("key", key);
		return sqlSessionTemplate.insert("Key.keyInsert", map) >0;
	}

	@Override
	public String certification(String user_id) {
		return sqlSessionTemplate.selectOne("Key.certification", user_id);
	}

	@Override
	public boolean keyDelete(String user_id) {
		return sqlSessionTemplate.delete("Key.keyDelete", user_id) > 0;
	}

}
