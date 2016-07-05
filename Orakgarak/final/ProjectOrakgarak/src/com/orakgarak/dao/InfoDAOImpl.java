package com.orakgarak.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.orakgarak.vo.BS;
import com.orakgarak.vo.CF;
import com.orakgarak.vo.IS;
@Repository
public class InfoDAOImpl implements InfoDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<BS> bsList(String code) {
		return sqlSessionTemplate.selectList("Info.bsList", code);
	}

	@Override
	public List<IS> isList(String code) {
		return sqlSessionTemplate.selectList("Info.isList", code);
	}

	@Override
	public List<CF> cfList(String code) {
		return sqlSessionTemplate.selectList("Info.cfList", code);
	}

}
