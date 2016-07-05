package com.scsa.service;

import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.KeyDAO;
import com.scsa.dao.UserDAO;
import com.scsa.vo.Key;

@Service("Key")
public class KeyServiceImpl implements KeyService {

	private KeyDAO keyDao;
	private UserDAO userDao;
		
	@Autowired
	public void setKeyDao(KeyDAO keyDao) {
		this.keyDao = keyDao;
	}

	@Autowired
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean keyCreate(String user_id, String key) {
		final String id = user_id;
		boolean flag = keyDao.keyInsert(user_id, key);
		
		new Timer().schedule(new TimerTask() {
			@Override
			public void run() {
				keyDao.keyDelete(id);
			}
		}, 1000*60*3);
		
		return flag;
	}

	@Override
	public boolean certification(String user_id, String ckey) {
		String key = keyDao.certification(user_id);
		if(ckey.equalsIgnoreCase(key)){
			userDao.changeUserStatus(user_id);
			return true;
		}
		return false;
	}

}
