package com.scse.dao;

import java.util.List;

import com.scse.entity.UserCharacter;

public interface CharacterDAO {

	List<Character> listCharacter() throws Exception;
	boolean insertUserCharacter(UserCharacter userCharacter) throws Exception;
	List<UserCharacter> selectUserCharacter(String userId, int chaNum) throws Exception;
	com.scse.entity.Character selectOneUserCharacter(String userId) throws Exception;
	boolean setCharacter(String userId, int chaNum) throws Exception;
	
	List<UserCharacter> selectMyCharacters(String userId);
	
	List<UserCharacter> selectMyCharactersWithChaName(String userId);
	
	boolean disabledCharacter(String userId);
	
	
}
