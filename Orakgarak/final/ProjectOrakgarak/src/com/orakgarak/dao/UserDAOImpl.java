package com.orakgarak.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.orakgarak.vo.SimulatedStock;
import com.orakgarak.vo.User;
import com.orakgarak.vo.UserAdvanced;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insert(User user) {
		return sqlSessionTemplate.insert("User.insertUser", user)>0;
	}

	@Override
	public boolean update(User user) {
		return sqlSessionTemplate.update("User.updateUser", user)>0;

	}

	@Override
	public boolean delete(String email) {
		return sqlSessionTemplate.delete("User.deleteUser", email)>0;

	}

	@Override
	public List<User> selectUserList() {
		
		return sqlSessionTemplate.selectList("User.selectAllUser");
	}

	@Override
	public User slectUserView(String email) {
		
		return sqlSessionTemplate.selectOne("User.selectUserByEmail",email);
	}
	
	@Override
	public User selectUserByName(String name) {
		return sqlSessionTemplate.selectOne("User.selectUserByName",name);
	}

	@Override
	public String login(String email, String password) {
		HashMap<String, String> map=new HashMap<>();
		map.put("email", email);
		map.put("password", password);
		
		return sqlSessionTemplate.selectOne("User.loginUser",map);
	}

	@Override
	public boolean insertFavorite(String userId, String codeForFav) {
		
		HashMap<String, String> map=new HashMap<>();
		map.put("userId", userId);
		map.put("codeForFav", codeForFav);
		
		return sqlSessionTemplate.insert("favoriteAndSimulation.insertFavorite", map) > 0;
	}

	@Override
	public boolean deleteFavorite(String userId, String codeForFav) {
		HashMap<String, String> map=new HashMap<>();
		map.put("userId", userId);
		map.put("codeForFav", codeForFav);
		
		return sqlSessionTemplate.insert("favoriteAndSimulation.deleteFavorite", map) > 0;
	}

	@Override
	public UserAdvanced selectFavorite(String userId) {
		return sqlSessionTemplate.selectOne("favoriteAndSimulation.selectFavorite", userId);
	}

	@Override
	public boolean insertSimulation(SimulatedStock stock) {
		return sqlSessionTemplate.insert("favoriteAndSimulation.insertSimulation", stock) > 0;
	}

	@Override
	public boolean deleteSimulation(int tradeSeq, String userId, String code) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tradeSeq", tradeSeq);
		map.put("userId", userId);
		map.put("code", code);
		return sqlSessionTemplate.delete("favoriteAndSimulation.deleteSimulation", map) >0;
	}

	@Override
	public UserAdvanced selectSimulation(String userId) {
		return sqlSessionTemplate.selectOne("favoriteAndSimulation.selectSimulation", userId);
	}

	@Override
	public boolean insertUserAdvanced(String userId, long originalAsset, long evaluatedAsset,
			long remainCash) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("userId", userId);
		map.put("originalAsset", originalAsset);
		map.put("evaluatedAsset", evaluatedAsset);
		map.put("remainCash", remainCash);
		
		return sqlSessionTemplate.insert("favoriteAndSimulation.insertUserAdvanced", map) > 0;
	}

	@Override
	public boolean updateUserAdvanced(String userId, long originalAsset, long evaluatedAsset,
			long remainCash) {
		
		System.out.println(userId + "|" + originalAsset +"|" + evaluatedAsset +"|" + remainCash);
		
		HashMap<String, Object> map=new HashMap<>();
		map.put("userId", userId);
		map.put("originalAsset", originalAsset);
		map.put("evaluatedAsset", evaluatedAsset);
		map.put("remainCash", remainCash);
		return sqlSessionTemplate.update("favoriteAndSimulation.updateUserAdvanced", map) > 0;
	}

	@Override
	public boolean deleteUserAdvanced(String userId) {
		return sqlSessionTemplate.delete("favoriteAndSimulation.deleteUserAdvanced", userId) > 0;
	}

	@Override
	public UserAdvanced selectUserAdvanced(String userId) {
		return sqlSessionTemplate.selectOne("favoriteAndSimulation.selectUserAdvanced", userId);
	}

	@Override
	public boolean checkDuplicateFavorite(String userId, String codeForFav) {

		HashMap<String, String> map=new HashMap<>();
		map.put("userId", userId);
		map.put("codeForFav", codeForFav);
		
		Object o = null;
		o = sqlSessionTemplate.selectOne("favoriteAndSimulation.checkDuplicateFavorite", map);
		
		if(o==null){
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public int selectVolume(int tradeSeq) {
		return sqlSessionTemplate.selectOne("favoriteAndSimulation.selectVolume",tradeSeq);
	}

	@Override
	public int selectOldPrice(int tradeSeq) {
		return sqlSessionTemplate.selectOne("favoriteAndSimulation.selectOldPrice",tradeSeq);
	}



}
