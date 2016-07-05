package com.orakgarak.dao;

import java.util.List;

import com.orakgarak.vo.SimulatedStock;
import com.orakgarak.vo.User;
import com.orakgarak.vo.UserAdvanced;

public interface UserDAO {

	boolean insert(User user);
	boolean update(User user);
	boolean delete(String userId);
	List<User> selectUserList();
	User slectUserView(String userId);
	String login(String userId, String password);
	
	boolean insertFavorite(String userId, String codeForFav);
	boolean deleteFavorite(String userId, String codeForFav);
	UserAdvanced selectFavorite(String userId);
	boolean checkDuplicateFavorite(String userId, String codeForFav);
	
	boolean insertSimulation(SimulatedStock stock);
	boolean deleteSimulation(int tradeSeq, String userId, String code);
	
	UserAdvanced selectSimulation(String userId);
	
	boolean insertUserAdvanced(String userId, long originalAsset, long evaluatedAsset, long remainCash);
	boolean updateUserAdvanced(String userId, long originalAsset, long evaluatedAsset, long remainCash);
	boolean deleteUserAdvanced(String userId);
	UserAdvanced selectUserAdvanced(String userId); //이건 거의 쓰지않고, 앞의 시뮬레이션을 쓰면될것임. 이건 그냥 임시로 만들어둔거임.
	User selectUserByName(String name);
	
	int selectVolume(int tradeSeq);
	int selectOldPrice(int tradeSeq);
	
}
