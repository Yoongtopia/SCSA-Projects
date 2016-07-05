package com.scsa.service;

import com.scsa.vo.User;

public interface UserService {
	
	User login (String user_id, String user_password);
	boolean userCreate (User user);
	boolean userModify (User user);
	boolean byebye (String user_id);
	User idCheck (String user_id);
	boolean changeUserStatus(String user_id);
	User findUserByUserId(String user_id);
	boolean regIdcreate (String reg_id, String user_id);
	User findUserByRegId (String reg_id);
}
