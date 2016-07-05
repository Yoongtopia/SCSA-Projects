package com.orakgarak.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.orakgarak.vo.DCF;
import com.orakgarak.vo.DCFCalculateData;


@Repository("DCFDAO")
public class DCFDAOImpl implements DCFDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<DCF> selectDCFList() {
		return sqlSessionTemplate.selectList("DCF.selectAllDCF");
	}

/*	@Override
	public DCF selectDCFByCode(String code) {
		try{
			return sqlSessionTemplate.selectOne("DCF.selectDCFByCode", code);
		}catch(Exception e){
			return null;
		}
	}*/

	@Override
	public DCF selectRfByDate(int date) {
		try{
		return sqlSessionTemplate.selectOne("DCF.selectRfByDate", date);
		}catch(Exception e){
			return null;
		}
	}

@Override
public List<DCF> selectDCFByCode(String code) {
	return sqlSessionTemplate.selectList("DCF.selectDCFByCode", code);
}

@Override
public boolean updateScore(String code, int year, double score) {
	boolean flag = false;
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("code", code);
	map.put("year", year);
	map.put("score", score);
	
	if(sqlSessionTemplate.selectOne("DCF.updateScore", map)!=null){
		flag = true;
	}else{
		flag = false;
	}
	return flag;
}

@Override
public Double selectGrowth(String indName ) {
	
	return sqlSessionTemplate.selectOne("DCF.selectIndustryGrowth", indName);
}

@Override
public Double selectCostOfDebt(String code, int year) {
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("code", code);
	map.put("year", year);
	return sqlSessionTemplate.selectOne("DCF.selectCostOfDebt", map);
}

@Override
public DCF selectScoreByCode(String code) {
	
	return (DCF) sqlSessionTemplate.selectList("DCF.selectScoreByCode", code);
}




}
