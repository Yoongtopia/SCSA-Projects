package com.scsa.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Push;

@Repository
public class PushDAOImpl implements PushDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public boolean pushInsert(Push push) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_id", push.getUser_id());
		map.put("push_price", push.getUser_id());
		map.put("push_square", push.getUser_id());
		map.put("pushTagList", push.getPushTagList());
		return sqlSessionTemplate.insert("Push.pushInsert", push) >0;
	}

	@Override
	public List<Push> pushListById(String user_id) {
		return sqlSessionTemplate.selectList("Push.pushListById", user_id);
	}

	@Override
	public Push pushDetailByNum(int push_num) {
		return sqlSessionTemplate.selectOne("Push.pushDetailByNum", push_num);
	}

	@Override
	public boolean pushUpdateByNum(int push_num, int push_price) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("push_num", push_num);
		map.put("push_price", push_price);
		return sqlSessionTemplate.update("Push.pushUpdateByNum", map) > 0;
	}

	@Override
	public boolean pushSquareUpdateByNum(int push_num, int push_square) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("push_num", push_num);
		map.put("push_square", push_square);
		return sqlSessionTemplate.update("Push.pushSquareUpdateByNum", map) >0;
	}

	@Override
	public boolean pushTagInsertByNum(int push_num, String[] push_tag) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("push_num", push_num);
		map.put("push_tag", push_tag);
		return sqlSessionTemplate.insert("Push.pushTagInsertByNum", map)>0;
	}

	@Override
	public boolean pushTagDeleteByNum(int push_num) {
		return sqlSessionTemplate.delete("Push.pushTagDeleteByNum", push_num) >0;
	}

	@Override
	public boolean pushDeleteByNum(int push_num) {
		return sqlSessionTemplate.delete("Push.pushDeleteByNum", push_num) >0;
	}

	@Override
	public boolean pushStatusUpdate(int push_num, int push_status) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("push_num", push_num);
		map.put("push_status", push_status);
		return sqlSessionTemplate.update("Push.pushStatusUpdate", map) >0; 
	}
	
	@Override
	public List<Push> pushService(int product_square, int product_price,
			String[] tag) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("product_square", product_square);
		map.put("product_price", product_price);
		map.put("tag", tag);
		return sqlSessionTemplate.selectList("Push.pushService", map);
	}

	@Override
	public boolean pushCheck(int push_check, int product_num, int push_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("push_check", push_check);
		map.put("product_num",product_num);
		map.put("push_num", push_num);
		return sqlSessionTemplate.update("Push.pushCheck", map) > 0;
	}


}
