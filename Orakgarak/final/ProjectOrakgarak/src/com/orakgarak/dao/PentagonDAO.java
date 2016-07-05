package com.orakgarak.dao;

import java.util.HashMap;
import java.util.List;

import com.orakgarak.admin.PentagonAdmin;
import com.orakgarak.vo.Pentagon;

public interface PentagonDAO {

	/*Pentagon selectPentagon(String stockCode);*/
	boolean insertPentagon(Pentagon pentagon);
	boolean updateDcfScore(String stockCode, int scoreDcf);
	boolean updateMultipleScore(HashMap<String, Integer> map);
	boolean updateTrendScore(HashMap<String, Integer> map);
	boolean updateVarScore(HashMap<String, Integer> map);
	boolean updateBigdataScore(HashMap<String, Integer> map);
	boolean updateSumScore(HashMap<String, Integer> map);
	Pentagon selectAllByCode(String stockCode);
	Pentagon selectPentagon(String stockCode);
	boolean updatePentagon(Pentagon pentagon);
	boolean updatePentagonWithoutDCF(Pentagon pentagon);
	boolean insertPentagonAdmin(PentagonAdmin pentagonAdmin);
	List<Pentagon> selectAll();
	
	List<Pentagon> selectAllPentagonOrderByDcf();
	List<Pentagon> selectAllPentagonOrderByMultiple();
	List<Pentagon> selectAllPentagonOrderByRisk();
	List<Pentagon> selectAllPentagonOrderByBigData();
	List<Pentagon> selectAllPentagonOrderByTrend();
	
	List<Pentagon> selectCustomized(int limitDcf, int limitMultiple, int limitRisk, int limitBigdata, int limitTrend);
	List<Pentagon> selectCustomizedRange(int leastDcf,int mostDcf, int leastMultiple,int mostMultiple, int leastRisk,int mostRisk, int leastBigdata,int mostBigdata, int leastTrend, int mostTrend);
	List<Pentagon> selectPreferTestResult(int leastDcf, int mostDcf,
			int leastMultiple, int mostMultiple, int leastRisk, int mostRisk,
			int leastBigdata, int mostBigdata, int leastTrend, int mostTrend);
	
	
	
}
