package com.orakgarak.dao;

import java.util.List;

import com.orakgarak.vo.DCF;
import com.orakgarak.vo.DCFCalculateData;

public interface DCFDAO {

	List<DCF> selectDCFList();
	List<DCF> selectDCFByCode(String code);
	
	
	/*DCF selectDCFByCode(String code );*/
	DCF selectRfByDate(int date);
	boolean updateScore(String code, int year, double score);
	Double selectGrowth (String indName);
	Double selectCostOfDebt (String code, int year);
	DCF selectScoreByCode(String code);
	
}
