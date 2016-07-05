package com.orakgarak.dao;

import java.util.HashMap;
import java.util.List;

import com.orakgarak.vo.Multiple;
import com.orakgarak.vo.Industry;

public interface MultipleDAO {
	public Multiple selectMultiple(String stockCode);
	public List<Multiple> multipleList(String industryCode);
	public String selectIndustryCodebyStockCode(String stockCode);
	public boolean updateMultiple(Multiple newMultiple);
	public List<HashMap<String, String>> selectCategory(String kindustryCode);
	public float selectIndustryMultiple(int industryCode);
	public List<Multiple> selectMultipleCodeOrName(String searchStock);
	public List<Multiple> selectMultipleList();
	public Industry selectIndustry(String industryCode);
	public String selectStockName(String code);
}
