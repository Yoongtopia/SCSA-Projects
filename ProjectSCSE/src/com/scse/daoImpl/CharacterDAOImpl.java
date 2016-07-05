package com.scse.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scse.dao.CharacterDAO;
import com.scse.entity.UserCharacter;

@Repository("characterDao")
public class CharacterDAOImpl implements CharacterDAO{

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<Character> listCharacter() throws Exception {
		return sqlSessionTemplate.selectList("Character.selectAllCharacter");
	}

	@Override
	public boolean insertUserCharacter(UserCharacter userCharacter)
			throws Exception {
		return sqlSessionTemplate.insert("Character.insertUserCharacter", userCharacter)>0;
	}

	@Override
	public List<UserCharacter> selectUserCharacter(String userId, int chaNum)
			throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chaNum", chaNum);
		return sqlSessionTemplate.selectList("Character.selectUserCharacter", map);
	}
	
	@Override
	public com.scse.entity.Character selectOneUserCharacter(String userId)
			throws Exception {
		return sqlSessionTemplate.selectOne("Character.selectUserCharacter", userId);
	}

	@Override
	public boolean setCharacter(String userId, int chaNum)
			throws Exception {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("chaNum", chaNum);
		
		return sqlSessionTemplate.update("Character.updateUserCharacter",map)>0;
	}

	@Override
	public List<UserCharacter> selectMyCharacters(String userId) {
		return sqlSessionTemplate.selectList("Character.myCharacters", userId);
	}

	@Override
	public boolean disabledCharacter(String userId) {
		return sqlSessionTemplate.update("Character.disableCharacter", userId) > 0;
	}

	@Override
	public List<UserCharacter> selectMyCharactersWithChaName(String userId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Character.selectMyCharactersWithChaName", userId);
	}
	
	

	
}