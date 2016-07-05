package com.scsa.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Wish;

@Repository
public class WishDAOImpl implements WishDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<Wish> wishListById(String user_id) {
		return sqlSessionTemplate.selectList("Wish.wishListById", user_id);
	}

	@Override
	public boolean wishDelete(String user_id, int product_num) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("product_num", product_num);
		
		return sqlSessionTemplate.delete("Wish.wishDeleteByNum", map) >0;
	}

	@Override
	public boolean wishInsert(String user_id, int product_num) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("product_num", product_num);
		
		return sqlSessionTemplate.insert("Wish.wishInsert", map) >0;
	}

	@Override
	public Wish wishCheck(String user_id, int product_num) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("product_num", product_num);
		
		return sqlSessionTemplate.selectOne("Wish.wishCheck", map);
	}

}
