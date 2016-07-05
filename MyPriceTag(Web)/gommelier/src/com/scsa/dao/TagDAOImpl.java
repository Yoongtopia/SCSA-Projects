package com.scsa.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Tag;

@Repository
public class TagDAOImpl implements TagDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<Tag> tagAutoComplete() {
		return sqlSessionTemplate.selectList("Tag.tagAutoComplete");
	}

	@Override
	public List<Tag> selectTagListByTag(String[] tag) {
		for (int i = 0; i < tag.length; i++) {
		}		
		HashMap<String, Object> map = new HashMap<>();
		map.put("tag", tag);
		return sqlSessionTemplate.selectList("Tag.selectTagListByTag", map);
	}

	@Override
	public List<Tag> selectTagListBySquare(int square_num) {
		return sqlSessionTemplate.selectList("Tag.selectTagListBySquare", square_num);
	}

}
