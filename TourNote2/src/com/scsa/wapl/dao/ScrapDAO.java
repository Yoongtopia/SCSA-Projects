package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.TravelRecord;

public interface ScrapDAO {

	public void insertScrap(String memberId, int recordNum);
	
	public List<TravelRecord> selectScrap(String memberId);
	
	public void deleteScrap(String memberId, int recordNum);
	
	public String selectRecommend(String memberId, int recordNum);
	
	public void insertRecommend(String memberId, int recordNum);
	
	public void increaseRecommend(int recordNum);
}
