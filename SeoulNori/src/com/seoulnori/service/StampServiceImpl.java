package com.seoulnori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.seoulnori.dao.StampDAO;
import com.seoulnori.vo.Member;
import com.seoulnori.vo.Stamp;

@Service

public class StampServiceImpl implements StampService {

	private StampDAO stampDao;
	
		
	@Autowired
	public void setStampDao(StampDAO stampDao) {
		this.stampDao = stampDao;
	}
	
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean addStamp(Stamp stamp) {
		return stampDao.insertStamp(stamp);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean updateStamp(String stampNum, String userId, String eventId) {
		return stampDao.updateStamp(stampNum, userId, eventId);
	}

	@Override
	public boolean checkMainStamp(String stampNum, String userId, String eventId) {
		return stampDao.checkMainStamp(stampNum, userId, eventId);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean updateMainStamp(String stampNum, String userId,
			String eventId) {
		return stampDao.updateMainStamp(stampNum, userId, eventId);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean removeStamp(String stampNum, String userId, String eventId) {
		return stampDao.deleteStamp(stampNum, userId, eventId);
	}

	@Override
	public Stamp findStampByUserIdStampNumEventId(String stampNum,
			String userId, String eventId) {
		return stampDao.selectStampByUserIdStampNumEventId(stampNum, userId, eventId);
	}

	@Override
	public List<Stamp> findStampListByUserId(String userId) {
		return stampDao.selectStampListByUserId(userId);
	}

	@Override
	public List<Stamp> findStampListForAdmin() {
		return stampDao.selectStampListForAdmin();
	}

	@Override
	public List<Member> findStampListForUser() {
		return stampDao.selectStampListForUser();
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean makeMainStamp(String stampNum, String userId, String eventId) {
		return stampDao.makeMainStamp(stampNum, userId, eventId);
	}


	@Override
	public Integer countStampCategory(String userId, String stampNum) {
		return stampDao.countStampCategory(userId, stampNum);
	}
	
	@Override
	public List<Stamp> findStampListForAdminWithPage(int startNo, int endNo) {
		return stampDao.selectStampListForAdminWithPage(startNo, endNo);
	}
	
	@Override
	public List<Stamp> findStampListByUserIdWithPage(String userId, int startNo, int endNo) {
		return stampDao.selectStampListByUserIdWithPage(userId,startNo,endNo);
	}

}
