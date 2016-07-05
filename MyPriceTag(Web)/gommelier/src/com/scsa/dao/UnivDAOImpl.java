package com.scsa.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Univ;

@Repository
public class UnivDAOImpl implements UnivDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<Univ> selectUnivList() {
		return sqlSessionTemplate.selectList("Univ.selectUnivList");
	}

	@Override
	public Univ selectUnivByUnivCode(String univ_code) {
		return sqlSessionTemplate.selectOne("Univ.selectUnivByUnivCode", univ_code);
	}

	@Override
	public List<Univ> selectUnivListBySquareNum(int square_num) {
		return sqlSessionTemplate.selectList("Univ.selectUnivListBySquareNum", square_num);
	}

	@Override
	public int selectSquareNum(String univ_name) {
		int square_num = 0;
		Univ univ = sqlSessionTemplate.selectOne("Univ.selectSquareNumByUniv", univ_name);
		if (univ != null) square_num = univ.getSquare_num();
		return square_num;
	}

}
