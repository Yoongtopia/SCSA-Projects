package com.orakgarak.service;

import java.util.List;

import com.orakgarak.vo.User;
import com.orakgarak.vo.UserAdvanced;

public interface UserService {
	
	boolean create(User user);
	boolean update(User user);
	boolean remove(String userId);
	List<User> findUserList();
	User findUserView(String userId);
	String login(String userId, String password);
	UserAdvanced getUserFav(String userId);
	UserAdvanced getUserSim(String userId);
	boolean addFav(String userId, String code);
	boolean delFav(String userId, String code);
	boolean sellStock(int tradeSeq, String userId, String code);
	
	boolean buy(String userId, int volume, String code);
	UserAdvanced updateAndSelectSimulationWithCurrentPrice(String userId);
	User findUserByName(String name);
	boolean checkFav(String userId, String code);
	
}
