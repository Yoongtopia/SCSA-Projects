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
		
		//기본적으로 이 메서드에서 볼륨에 대한 것을 체크해서 어쩌고해야함
		
		long totalPrice = 0;
		long price = 0;
		//잔액이 충분히 남아있는지에 대한 검증
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
		
		//성능상 심플하게 리메인만 가지고 오늘걸로 고고함 
		UserAdvanced userAdvanced = userDao.selectSimulation(userId);
		long remainCash = userAdvanced.getRemainCash();
		
		//돈이 부족한데 사려고 하면 꺼지셈!
		if(totalPrice >= remainCash){
			return false;
		}else{
			userDao.insertSimulation(new SimulatedStock(userId, code, multipleDao.selectStockName(code), price, volume));
			
			long a = userAdvanced.getOriginalAsset() + totalPrice;
			long b = userAdvanced.getEvaluatedAsset() + totalPrice;
			
			System.out.println(a);
			System.out.println(b);
			
			userDao.updateUserAdvanced(userId,a,b, remainCash - totalPrice); //안에있는 함수를 다시씀
		}
		
		return true;
		
	}//end buy
	
	//자산을 업데이트하고 다시 그 업데이트된 자산을 돌려줌, 돌려주는 값은 굳이 안써도됨
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	public UserAdvanced updateAndSelectSimulationWithCurrentPrice(String userId){
		
		ArrayList<SimulatedStock> list = null;
		UserAdvanced userAdvanced = userDao.selectSimulation(userId);
		
		if(userAdvanced.getSimList()==null){
			return null;
		}else{
			list = (ArrayList<SimulatedStock>)userAdvanced.getSimList();
		}
		
		
		
		//하나하나 돌아가면서 현재가격으로 업데이트함.
		for(SimulatedStock s : list){
			//outer 조인으로 가져왔기때문에, null로 값이 올텐데 이럴경우 그냥 for문을 탈출합니다.
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
					(s.getOldPrice()*s.getOldVolume())+totalPrice); //살때를 기준으로 항상 계싼을 해야함
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
		
		//일단 네트워크부하를 줄이기위해 간단한 버전인  selectUserAdvanced(userId)를 불러옴
		UserAdvanced userAdvancedWithSimpleInfo = userDao.selectUserAdvanced(userId);
		
		//다시 현금으로DB에서 업데이트 시켜주고
		userDao.updateUserAdvanced(userId,userAdvancedWithSimpleInfo.getOriginalAsset()-oldPrice*volume ,
				userAdvancedWithSimpleInfo.getEvaluatedAsset()-price*volume ,
				userAdvancedWithSimpleInfo.getRemainCash() + price*volume);
		//그다음에 DB에서시뮬레이션을 삭제합니다.
		userDao.deleteSimulation(tradeSeq, userId, code);
		
		
		return true;
		
		
	}//end sellStock()

	@Override
	public boolean checkFav(String userId, String code) {
	
		return userDao.checkDuplicateFavorite(userId, code);
	}

	
	
	

}
