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
	UserAdvanced selectUserAdvanced(String userId); //�̰� ���� �����ʰ�, ���� �ùķ��̼��� ����ɰ���. �̰� �׳� �ӽ÷� �����а���.
	User selectUserByName(String name);
	
	int selectVolume(int tradeSeq);
	int selectOldPrice(int tradeSeq);
	
}
