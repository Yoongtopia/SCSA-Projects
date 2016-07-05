package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.wapl.dao.TravelRecordReplyDAO;
import com.scsa.wapl.entity.TravelRecordReply;

@Repository
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class TravelRecordReplyServiceImpl implements TravelRecordReplyService {
	
	private TravelRecordReplyDAO travelRecordReplyDao;
		
	@Autowired
	public void setTravelRecordReplyDao(TravelRecordReplyDAO travelRecordReplyDao) {
		this.travelRecordReplyDao = travelRecordReplyDao;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addTravelRecordReply(TravelRecordReply travelRecordReply) {
		travelRecordReplyDao.insertTravelRecordReply(travelRecordReply);
	}

	@Override
	public List<TravelRecordReply> findTravelRecordReply(int recordNum) {
		return travelRecordReplyDao.selectTravelRecordReply(recordNum);

	}

	@Override
	public void removeTravelRecordReply(int replyNum) {
		travelRecordReplyDao.deleteTreavelRecordReply(replyNum);
		
	}

}
