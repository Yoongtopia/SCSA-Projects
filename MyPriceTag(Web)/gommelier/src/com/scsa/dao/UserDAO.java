package com.scsa.dao;

import com.scsa.vo.User;

public interface UserDAO {
	User login (String user_id, String user_password);
	boolean userInsert (User user);
	boolean userUpdate (User user);
	boolean byebye (String user_id);
	User idCheck (String user_id);
	boolean changeUserStatus (String user_id);
	User selectUserByUserId(String user_id);
	boolean regIdInsert (String reg_id, String user_id);
	User selectUserByRegId (String reg_id);
}
