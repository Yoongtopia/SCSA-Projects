package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.wapl.dao.ScrapDAO;
import com.scsa.wapl.entity.TravelRecord;

@Repository
@Transactional(propagation=Propagation.SUPPORTS, readOnly = true)
public class ScrapServiceImpl implements ScrapService {

	private ScrapDAO scrapDao;
	
	@Autowired	
	public void setScrapDao(ScrapDAO scrapDao) {
		this.scrapDao = scrapDao;
	}

	@Override
	public void addScrap(String memberId, int recordNum) {
		scrapDao.insertScrap(memberId, recordNum);
	}

	@Override
	public List<TravelRecord> findScrap(String memberId) {
		return scrapDao.selectScrap(memberId);
	}

	@Override
	
	public void removeScrap(String memberId, int recordNum) {
		scrapDao.deleteScrap(memberId, recordNum);		
	}

	@Override
	public String findRecommend(String memberId, int recordNum) {
		return scrapDao.selectRecommend(memberId, recordNum);
	}

	@Override
	public void addRecommend(String memberId, int recordNum) {
		scrapDao.insertRecommend(memberId, recordNum);		
	}

	@Override
	public void plusRecommend(int recordNum) {
		scrapDao.increaseRecommend(recordNum);
		
	}

}
