package com.orakgarak.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.admin.PentagonAdmin;
import com.orakgarak.dao.PentagonDAO;
import com.orakgarak.vo.Pentagon;

@Service("pentagonService")
public class PentagonServiceImpl implements PentagonService {
	
	private PentagonDAO pentagonDao;

	@Autowired
	public void setPentagonDao(PentagonDAO pentagonDao) {
		this.pentagonDao = pentagonDao;
	}

	

	@Override
	public boolean createPentagon(Pentagon pentagon) {
		return pentagonDao.insertPentagon(pentagon);
	}

	@Override
	public boolean updateDcfScore(String stockCode, int scoreDcf) {
		return pentagonDao.updateDcfScore(stockCode, scoreDcf);
	}

	@Override
	public boolean updateMultipleScore(HashMap<String, Integer> map) {
		return pentagonDao.updateMultipleScore(map);
	}

	@Override
	public boolean updateTrendScore(HashMap<String, Integer> map) {
		return pentagonDao.updateTrendScore(map);
	}

	@Override
	public boolean updateVarScore(HashMap<String, Integer> map) {
		return pentagonDao.updateVarScore(map);
	}

	@Override
	public boolean updateBigdataScore(HashMap<String, Integer> map) {
		return pentagonDao.updateBigdataScore(map);
	}

	@Override
	public boolean updateSumScore(HashMap<String, Integer> map) {
		return pentagonDao.updateSumScore(map);
	}





	@Override
	public Pentagon findPentagon(String stockCode) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public Pentagon findScoresByCode(String stockCode) {
		return pentagonDao.selectAllByCode(stockCode);
	}


	@Override
	public boolean updatePentagon(Pentagon pentagon) {
		return pentagonDao.updatePentagon(pentagon);
	}

	@Override
	public boolean addPentagonAdmin(PentagonAdmin pentagonAdmin) {
		return pentagonDao.insertPentagonAdmin(pentagonAdmin);
	}

	@Override
	public List<Pentagon> findAll() {
		return pentagonDao.selectAll();
	}



	@Override
	public Pentagon findAllByCode(String stockCode) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public boolean updatePentagonWithoutDCF(Pentagon pentagon) {
		return pentagonDao.updatePentagonWithoutDCF(pentagon);
	}



	@Override
	public List<Pentagon> getAllPentagonOrderByDcf() {
		return pentagonDao.selectAllPentagonOrderByDcf();
	}



	@Override
	public List<Pentagon> getAllPentagonOrderByMultiple() {
		return pentagonDao.selectAllPentagonOrderByMultiple();
	}



	@Override
	public List<Pentagon> getAllPentagonOrderByRisk() {
		return pentagonDao.selectAllPentagonOrderByRisk();
	}



	@Override
	public List<Pentagon> getAllPentagonOrderByBigData() {
		return pentagonDao.selectAllPentagonOrderByBigData();
	}



	@Override
	public List<Pentagon> getAllPentagonOrderByTrend() {
		return pentagonDao.selectAllPentagonOrderByTrend();
	}



	@Override
	public List<Pentagon> getCustomized(int limitDcf, int limitMultiple,
			int limitRisk, int limitBigdata, int limitTrend) {
		return pentagonDao.selectCustomized(limitDcf, limitMultiple, limitRisk, limitBigdata, limitTrend);
	}



	@Override
	public List<Pentagon> getCustomizedRange(int leastDcf, int mostDcf,
			int leastMultiple, int mostMultiple, int leastRisk, int mostRisk,
			int leastBigdata, int mostBigdata, int leastTrend, int mostTrend) {
		return pentagonDao.selectCustomizedRange(leastDcf, mostDcf, leastMultiple, mostMultiple, leastRisk, mostRisk, leastBigdata, mostBigdata, leastTrend, mostTrend);
	}


	@Override
	public List<Pentagon> preferTestResult(int leastDcf, int mostDcf,
			int leastMultiple, int mostMultiple, int leastRisk, int mostRisk,
			int leastBigdata, int mostBigdata, int leastTrend, int mostTrend) {
				
		return pentagonDao.selectPreferTestResult(leastDcf, mostDcf, leastMultiple, mostMultiple, leastRisk, mostRisk, leastBigdata, mostBigdata, leastTrend, mostTrend);
	}

	
}
