package com.scsa.wapl.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.TravelRecord;

@Repository
public class ScrapDAOImpl implements ScrapDAO {

	private SqlSessionTemplate sqlSessionTemplate;
			
	@Autowired	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void insertScrap(String memberId, int recordNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("recordNum", recordNum);
		sqlSessionTemplate.insert("Scrap.insertScrap", map);		
	}

	@Override
	public List<TravelRecord> selectScrap(String memberId) {
		return sqlSessionTemplate.selectList("Scrap.selectScrap", memberId);
	}


	@Override
	public void deleteScrap(String memberId, int recordNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("recordNum", recordNum);
		sqlSessionTemplate.delete("Scrap.deleteScrap", map);			
}

	@Override
	public String selectRecommend(String memberId, int recordNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("recordNum", recordNum);		
		return sqlSessionTemplate.selectOne("Scrap.selectRecommend", map);
	}

	@Override
	public void insertRecommend(String memberId, int recordNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("recordNum", recordNum);
		sqlSessionTemplate.insert("Scrap.insertRecommend", map);		
	}

	@Override
	public void increaseRecommend(int recordNum) {
		sqlSessionTemplate.update("Scrap.increaseRecommend", recordNum);
		
	}




}
