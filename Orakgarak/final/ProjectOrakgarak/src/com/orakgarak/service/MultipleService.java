package com.orakgarak.service;

import java.util.HashMap;
import java.util.List;

import com.orakgarak.vo.Industry;
import com.orakgarak.vo.Multiple;

public interface MultipleService {

	Multiple findMultiple(String stockCode);
	List<Multiple> multipleList(String industryCode);
	String findIndustryCodebyStockCode(String stockCode);
	List<HashMap<String, String>> selectCategory(String kindustryCode);
	List<Multiple> selectMultipleCodeOrName(String searchStock);
	List<Multiple> selectMultipleList();
	Industry selectIndustry(String industryCode);
	String findStockName(String code);

}
 