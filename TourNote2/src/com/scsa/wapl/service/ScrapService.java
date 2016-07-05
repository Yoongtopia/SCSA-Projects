package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.TravelRecord;

public interface ScrapService {
	public void addScrap(String memberId, int recordNum);
	public List<TravelRecord> findScrap(String memberId);	
	public void removeScrap(String menberId, int recordNum);
	public String findRecommend(String memberId, int recordNum);
	public void addRecommend(String memberId, int recordNum);
	public void plusRecommend(int recordNum);
}
