package com.scsa.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.User;

@Repository
public class UserDAOImpl implements UserDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public User idCheck(String user_id) {
		return sqlSessionTemplate.selectOne("User.idCheck", user_id);
	}

	@Override
	public boolean userInsert(User user) {
		return sqlSessionTemplate.insert("User.userInsert", user) >0;
	}

	@Override
	public User login(String user_id, String user_password) {
		User user = new User();
		user.setUser_id(user_id);
		user.setUser_password(user_password);
		return sqlSessionTemplate.selectOne("User.login", user);
	}

	@Override
	public boolean userUpdate(User user) {
		return sqlSessionTemplate.update("User.userUpdate", user) >0;
	}

	@Override
	public boolean byebye(String user_id) {
		return sqlSessionTemplate.delete("User.byebye", user_id) >0;
	}

	@Override
	public boolean changeUserStatus(String user_id) {
		return sqlSessionTemplate.update("User.changeUserStatus", user_id) >0;
	}

	@Override
	public User selectUserByUserId(String user_id) {
		return sqlSessionTemplate.selectOne("User.selectUserByUserId", user_id);
	}

	@Override
	public boolean regIdInsert(String reg_id, String user_id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("reg_id", reg_id);
		map.put("user_id", user_id);
		return sqlSessionTemplate.update("User.regIdInsert", map) > 0;
	}

	@Override
	public User selectUserByRegId(String reg_id) {
		return sqlSessionTemplate.selectOne("User.selectUserByRegId", reg_id);
	}

}
