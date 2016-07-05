package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.TravelRecord;

public interface TravelRecordDAO {
	/*
	 * public List<TravelRecord> selectTravelRecordList(String ContinentalName,
	 * String lineup);
	 */

	public List<TravelRecord> selectTravelRecordList(String ContinentalName,
			String lineup, int startNo, int endNo);

	/*
	 * public List<TravelRecord> selectTravelRecordList(String ContinentalName,
	 * String lineup, int startNo, int endNo);
	 */

	public List<TravelRecord> selectTravelRecordListByKeyword(String keyword);

	public List<TravelRecord> selectRecordListById(String recordWriter);

	public int listCount(String continentalName);

}
