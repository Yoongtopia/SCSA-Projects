package com.scsa.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Cmt;

@Repository
public class CmtDAOImpl implements CmtDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public boolean cmtInsert(Cmt cmt) {
		return sqlSessionTemplate.insert("Cmt.cmtInsert", cmt) > 0;
	}

	@Override
	public boolean cmtUpdate(String cmt_content, int cmt_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cmt_content", cmt_content);
		map.put("cmt_num", cmt_num);
		return sqlSessionTemplate.update("Cmt.cmtUpdate", map) > 0 ;
		
	}

	@Override
	public boolean cmtDelete(int cmt_num) {
		return sqlSessionTemplate.delete("Cmt.cmtDelete", cmt_num) > 0;
	}

	@Override
	public List<Cmt> cmtList(int product_num) {
		return sqlSessionTemplate.selectList("Cmt.cmtListByProductNum", product_num);
	}

	@Override
	public List<Cmt> cmtChildListByParentNum(int parent_num) {
		return sqlSessionTemplate.selectList("Cmt.cmtChildListByParentNum", parent_num);
	}

}
