package com.scse.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scse.dao.CharacterDAO;
import com.scse.entity.UserCharacter;
import com.scse.service.CharacterService;

@Component("character")
public class CharacterServiceImpl implements CharacterService {

	CharacterDAO characterDao;
	
	@Autowired
	public void setCharacterDao(CharacterDAO characterDao) {
		this.characterDao = characterDao;
	}

	@Override
	public List<Character> allCharacter() throws Exception {
		return characterDao.listCharacter();
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addUserCharacter(List<UserCharacter> chaList)
			throws Exception {
		boolean flag = true;
		for(UserCharacter userCharacter : chaList) {
			flag = flag && characterDao.insertUserCharacter(userCharacter);
		}
		return flag;
	}

	@Override
	public List<UserCharacter> viewUserCharacter(String userId, int chaNum)
			throws Exception {
		return characterDao.selectUserCharacter(userId, chaNum);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean settingCharacter(String userId, int chaNum) throws Exception {
		characterDao.disabledCharacter(userId);
		return characterDao.setCharacter(userId, chaNum);
	}

	@Override
	public com.scse.entity.Character viewOneUserCharacter(String userId)
			throws Exception {
		return characterDao.selectOneUserCharacter(userId);
	}

	@Override
	public List<UserCharacter> viewMyCharacterList(String userId) {
		return characterDao.selectMyCharacters(userId);
	}

	@Override
	public List<UserCharacter> viewMyQuestCharacterList(String userId) {
		return characterDao.selectMyCharactersWithChaName(userId);
	}
}