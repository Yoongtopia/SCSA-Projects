package com.orakgarak.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.orakgarak.dao.MultipleDAO;
import com.orakgarak.dao.UserDAO;
import com.orakgarak.util.ParseUtil;
import com.orakgarak.vo.SimulatedStock;
import com.orakgarak.vo.User;
import com.orakgarak.vo.UserAdvanced;

@Service
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class UserServiceImpl implements UserService {

	private UserDAO userDao;
	private MultipleDAO multipleDao;
	
	
	@Autowired
	public void setMultipleDao(MultipleDAO multipleDao) {
		this.multipleDao = multipleDao;
	}

	@Autowired
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean create(User user) {
		userDao.insertUserAdvanced(user.getEmail(), 0, 0,100000000);
		return userDao.insert(user);
		

	}

	@Override
	public boolean update(User user) {
		return userDao.update(user);
	}

	@Override
	public boolean remove(String email) {
		return userDao.delete(email);
	}

	@Override
	public List<User> findUserList() {
		return userDao.selectUserList();
	}

	@Override
	public User findUserView(String email) {
		return userDao.slectUserView(email);
	}

	@Override
	public User findUserByName(String name) {
		return userDao.selectUserByName(name);
	}
	
	@Override
	public String login(String email, String password) {
		
		return userDao.login(email, password);
	}

	@Override
	public UserAdvanced getUserFav(String userId) {
		
		return userDao.selectFavorite(userId);
		
	}//end getUserFav()

	@Override
	public UserAdvanced getUserSim(String userId) {
		return userDao.selectSimulation(userId);
	}//end getUserSim()

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean addFav(String userId, String code) {
		
		System.out.println(userId+ code);
		
		if(userDao.checkDuplicateFavorite(userId, code)){
			userDao.insertFavorite(userId, code);
			return true;
		}
			return false;
	}

	@Override
	public boolean delFav(String userId, String code) {
		return userDao.deleteFavorite(userId, code);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean buy(String userId, int volume, String code) {
		
		//�⺻������ �� �޼��忡�� ������ ���� ���� üũ�ؼ� ��¼���ؾ���
		
		long totalPrice = 0;
		long price = 0;
		//�ܾ��� ����� �����ִ����� ���� ����
		try{		
		price = ParseUtil.getCurrentPrice(code);
		if(price == 0){
			return false;
		}
		totalPrice = volume * price;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
		//���ɻ� �����ϰ� �����θ� ������ ���ðɷ� ����� 
		UserAdvanced userAdvanced = userDao.selectSimulation(userId);
		long remainCash = userAdvanced.getRemainCash();
		
		//���� �����ѵ� ����� �ϸ� ������!
		if(totalPrice >= remainCash){
			return false;
		}else{
			userDao.insertSimulation(new SimulatedStock(userId, code, multipleDao.selectStockName(code), price, volume));
			
			long a = userAdvanced.getOriginalAsset() + totalPrice;
			long b = userAdvanced.getEvaluatedAsset() + totalPrice;
			
			System.out.println(a);
			System.out.println(b);
			
			userDao.updateUserAdvanced(userId,a,b, remainCash - totalPrice); //�ȿ��ִ� �Լ��� �ٽþ�
		}
		
		return true;
		
	}//end buy
	
	//�ڻ��� ������Ʈ�ϰ� �ٽ� �� ������Ʈ�� �ڻ��� ������, �����ִ� ���� ���� �Ƚᵵ��
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public UserAdvanced updateAndSelectSimulationWithCurrentPrice(String userId){
		
		ArrayList<SimulatedStock> list = null;
		UserAdvanced userAdvanced = userDao.selectSimulation(userId);
		
		if(userAdvanced.getSimList()==null){
			return null;
		}else{
			list = (ArrayList<SimulatedStock>)userAdvanced.getSimList();
		}
		
		
		
		//�ϳ��ϳ� ���ư��鼭 ���簡������ ������Ʈ��.
		for(SimulatedStock s : list){
			//outer �������� �����Ա⶧����, null�� ���� ���ٵ� �̷���� �׳� for���� Ż���մϴ�.
			if(s.getCode()==null){
				break;
			}
			long price = ParseUtil.getCurrentPrice(s.getCode());
			s.setCurrentPrice(price);
			if(price == 0){
				return null;
			}
			long totalPrice = s.getOldVolume() * price;
			userAdvanced.setEvaluatedAsset(userAdvanced.getOriginalAsset()-
					(s.getOldPrice()*s.getOldVolume())+totalPrice); //�춧�� �������� �׻� ����� �ؾ���
			userDao.updateUserAdvanced(userId, userAdvanced.getOriginalAsset(),userAdvanced.getEvaluatedAsset(), userAdvanced.getRemainCash());
			
		}
		
		return userAdvanced;
		
	}//end updateEvaluatedAsset()

	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public boolean sellStock(int tradeSeq, String userId, String code) {
		
		int oldPrice = userDao.selectOldPrice(tradeSeq);
		long price = ParseUtil.getCurrentPrice(code);
		int volume = userDao.selectVolume(tradeSeq);
		
		if(price == 0){
			return false;
		}
		
		//�ϴ� ��Ʈ��ũ���ϸ� ���̱����� ������ ������  selectUserAdvanced(userId)�� �ҷ���
		UserAdvanced userAdvancedWithSimpleInfo = userDao.selectUserAdvanced(userId);
		
		//�ٽ� ��������DB���� ������Ʈ �����ְ�
		userDao.updateUserAdvanced(userId,userAdvancedWithSimpleInfo.getOriginalAsset()-oldPrice*volume ,
				userAdvancedWithSimpleInfo.getEvaluatedAsset()-price*volume ,
				userAdvancedWithSimpleInfo.getRemainCash() + price*volume);
		//�״����� DB�����ùķ��̼��� �����մϴ�.
		userDao.deleteSimulation(tradeSeq, userId, code);
		
		
		return true;
		
		
	}//end sellStock()

	@Override
	public boolean checkFav(String userId, String code) {
	
		return userDao.checkDuplicateFavorite(userId, code);
	}

	
	
	

}
