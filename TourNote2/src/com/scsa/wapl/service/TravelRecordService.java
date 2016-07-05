package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.TravelRecord;

public interface TravelRecordService {
	
	/*
	 * public List<TravelRecord> findTravelRecordList(String ContinentalName,
	 * String lineup);
	 */
	
	public List<TravelRecord> findTravelRecordList(String ContinentalName,
			String lineup, int startNo, int endNo);

	/*
	 * public List<TravelRecord> findTravelRecordList(String ContinentalName,
	 * String lineup, int startNo, int endNo);
	 */
	
	public List<TravelRecord> findTravelRecordListByKeyword(String keyword);

	public List<TravelRecord> findRecordListById(String recordWriter);

	public int listCount(String continentalName);

}
