package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.TravelRecordReply;

public interface TravelRecordReplyDAO {

	public void insertTravelRecordReply(TravelRecordReply travelRecordReply);
	
	public List<TravelRecordReply> selectTravelRecordReply(int recordNum);
	
	public void deleteTreavelRecordReply(int replyNum);
}
