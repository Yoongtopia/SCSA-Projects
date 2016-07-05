package com.scse.service;

import java.util.List;

import com.scse.entity.UserCharacter;

public interface CharacterService {

	List<Character> allCharacter() throws Exception;
	boolean addUserCharacter(List<UserCharacter> chaList) throws Exception;
	List<UserCharacter> viewUserCharacter(String userId, int chaNum) throws Exception;
	boolean settingCharacter(String userId, int chaNum) throws Exception;
	com.scse.entity.Character viewOneUserCharacter(String userId)throws Exception;
	
	List<UserCharacter> viewMyCharacterList(String userId);
	List<UserCharacter> viewMyQuestCharacterList(String userId);
}
