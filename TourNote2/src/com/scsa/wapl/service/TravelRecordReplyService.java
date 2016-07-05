package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.TravelRecordReply;

public interface TravelRecordReplyService {

	public void addTravelRecordReply(TravelRecordReply travelRecordReply);
	
	public List<TravelRecordReply> findTravelRecordReply(int recordNum);
	
	public void removeTravelRecordReply(int replyNum);
}
