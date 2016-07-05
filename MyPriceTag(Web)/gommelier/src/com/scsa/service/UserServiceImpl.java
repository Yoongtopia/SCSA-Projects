package com.scsa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.UserDAO;
import com.scsa.vo.User;

@Service("user")
public class UserServiceImpl implements UserService {
	
	private UserDAO userDao;
	
	@Autowired
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public User login(String user_id, String user_password) {
		return userDao.login(user_id, user_password);
	}

	@Override
	public boolean userCreate(User user) {
		return userDao.userInsert(user);
	}

	@Override
	public boolean userModify(User user) {
		return userDao.userUpdate(user);
	}

	@Override
	public boolean byebye(String user_id) {
		return userDao.byebye(user_id);
	}

	@Override
	public User idCheck(String user_id) {
		return userDao.idCheck(user_id);
	}

	@Override
	public boolean changeUserStatus(String user_id) {
		return userDao.changeUserStatus(user_id);
	}

	@Override
	public User findUserByUserId(String user_id) {
		return userDao.selectUserByUserId(user_id);
	}

	@Override
	public boolean regIdcreate(String reg_id, String user_id) {
		return userDao.regIdInsert(reg_id, user_id);
	}

	@Override
	public User findUserByRegId(String reg_id) {
		return userDao.selectUserByRegId(reg_id);
	}

}
