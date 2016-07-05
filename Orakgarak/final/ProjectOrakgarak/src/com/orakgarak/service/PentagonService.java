package com.orakgarak.service;

import java.util.HashMap;
import java.util.List;

import com.orakgarak.admin.PentagonAdmin;
import com.orakgarak.vo.Pentagon;

public interface PentagonService {
	
	Pentagon findPentagon(String stockCode);
	boolean createPentagon(Pentagon pentagon);
	boolean updateDcfScore(String stockCode, int scoreDcf);
	boolean updateMultipleScore(HashMap<String, Integer> map);
	boolean updateTrendScore(HashMap<String, Integer> map);
	boolean updateVarScore(HashMap<String, Integer> map);
	boolean updateBigdataScore(HashMap<String, Integer> map);
	boolean updateSumScore(HashMap<String, Integer> map);
	Pentagon findScoresByCode(String stockCode);
	boolean updatePentagon(Pentagon pentagon);
	boolean updatePentagonWithoutDCF(Pentagon pentagon);
	boolean addPentagonAdmin(PentagonAdmin pentagonAdmin);
	Pentagon findAllByCode(String stockCode);
	List<Pentagon> findAll();
	
	List<Pentagon> getAllPentagonOrderByDcf();
	List<Pentagon> getAllPentagonOrderByMultiple();
	List<Pentagon> getAllPentagonOrderByRisk();
	List<Pentagon> getAllPentagonOrderByBigData();
	List<Pentagon> getAllPentagonOrderByTrend();
	
	List<Pentagon> getCustomized(int limitDcf, int limitMultiple, int limitRisk, int limitBigdata, int limitTrend);
	List<Pentagon> getCustomizedRange(int leastDcf,int mostDcf, int leastMultiple,int mostMultiple, int leastRisk,int mostRisk, int leastBigdata,int mostBigdata, int leastTrend, int mostTrend);
	List<Pentagon> preferTestResult(int leastDcf, int mostDcf,
			int leastMultiple, int mostMultiple, int leastRisk, int mostRisk,
			int leastBigdata, int mostBigdata, int leastTrend, int mostTrend);

}
