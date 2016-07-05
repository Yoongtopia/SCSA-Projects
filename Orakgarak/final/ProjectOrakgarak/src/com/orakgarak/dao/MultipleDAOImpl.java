package com.orakgarak.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.orakgarak.vo.Industry;
import com.orakgarak.vo.Multiple;

@Repository
public class MultipleDAOImpl implements MultipleDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public Multiple selectMultiple(String stockCode) {
		return sqlSessionTemplate.selectOne("Multiple.selectMultiple", stockCode);
	}

	@Override
	public List<Multiple> multipleList(String industryCode) {
		
		return sqlSessionTemplate.selectList("Multiple.selectMultipelList", industryCode);
	}

	@Override
	public String selectIndustryCodebyStockCode(String stockCode) {
		return sqlSessionTemplate.selectOne("Multiple.selectIndustryCodebyStockCode",stockCode);
	}

	@Override
	public boolean updateMultiple(Multiple newMultiple) {
		return sqlSessionTemplate.update("Multiple.updateMultiple", newMultiple)>0;
		
	}

	@Override
	public List<HashMap<String,String>> selectCategory(String kindustryCode) {
		List<HashMap<String,String>> list=sqlSessionTemplate.selectList("Multiple.selectCategory",kindustryCode);
		System.out.println(kindustryCode);
		return list;
	}

	@Override
	public float selectIndustryMultiple(int industryCode) {
		return sqlSessionTemplate.selectOne("Multiple.selectIndustryMultiple",industryCode);
	}

	@Override
	public List<Multiple> selectMultipleCodeOrName(String searchStock) {
		if(searchStock != null && searchStock.trim().length() !=0){
			return sqlSessionTemplate.selectList("Multiple.selectMultipleCodeOrName", searchStock);
		}else{
			return null;
		}
	}

	@Override
	public List<Multiple> selectMultipleList() {
		return sqlSessionTemplate.selectList("Multiple.selectMultipleList");
	}

	@Override
	public Industry selectIndustry(String industryCode) {
		return sqlSessionTemplate.selectOne("Multiple.selectIndustry",industryCode);
	}

	@Override
	public String selectStockName(String code) {
		return sqlSessionTemplate.selectOne("Multiple.selectStockName", code);
	}

}
