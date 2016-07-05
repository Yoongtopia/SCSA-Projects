package com.orakgarak.service;

import java.util.List;

import com.orakgarak.vo.DCF;
import com.orakgarak.vo.DCFCalculate;

public interface DCFService {
	List<DCF> findDCFList();
	/*DCF findDCFByCode(String code);*/
	List<DCF> findDCFByCode(String code);
	long getPriceByCode(String code);
	DCF findRfByDate(int date);
	boolean updateScore(String code, int year, double score);
	Double findGrowth (String indName);
	Double findCostOfDebt (String code, int year);
	DCF findScoreByCode(String code);
	
	DCFCalculate getFullCalculatedDCF(String code); //��� �ڵ�ȭ�� ���� �� �����ִ� ���� �߿��� �޼���� ����� ���
	
}
