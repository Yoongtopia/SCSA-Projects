package com.orakgarak.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.orakgarak.vo.Prove;

@Repository("ProveDAO")
public class ProveDAOImpl implements ProveDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public Prove selectProveByCode(String code) {
		return (Prove) sqlSessionTemplate.selectOne("Prove.selectProveByCode", code);
	}

}
