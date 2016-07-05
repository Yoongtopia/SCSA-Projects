package com.orakgarak.vo;

import java.util.ArrayList;
import java.util.List;

//시뮬레이션을 위한 모의투자용 아이디와, Favorite 저장을 위한 아이디를 만듭니다.
public class UserAdvanced{

	private String userId;
	private ArrayList<Pentagon> favList; //펜타곤의 즐겨찾기 기능을 추가하기 위해 만들었음
	private long originalAsset; //계산을 위해 만들었음
	private long evaluatedAsset; //평가된 자산을 만들기 위해 만들었음
	private long remainCash;  // 남은 현금을 표시하기 위해 만들었음
	private ArrayList<SimulatedStock> simList;
	public UserAdvanced() {
		super();
	}
	public UserAdvanced(String userId, ArrayList<Pentagon> favList,
			long originalAsset, long evaluatedAsset, long remainCash,
			ArrayList<SimulatedStock> simList) {
		super();
		this.userId = userId;
		this.favList = favList;
		this.originalAsset = originalAsset;
		this.evaluatedAsset = evaluatedAsset;
		this.remainCash = remainCash;
		this.simList = simList;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public ArrayList<Pentagon> getFavList() {
		return favList;
	}
	public void setFavList(ArrayList<Pentagon> favList) {
		this.favList = favList;
	}
	public long getOriginalAsset() {
		return originalAsset;
	}
	public void setOriginalAsset(long originalAsset) {
		this.originalAsset = originalAsset;
	}
	public long getEvaluatedAsset() {
		return evaluatedAsset;
	}
	public void setEvaluatedAsset(long evaluatedAsset) {
		this.evaluatedAsset = evaluatedAsset;
	}
	public long getRemainCash() {
		return remainCash;
	}
	public void setRemainCash(long remainCash) {
		this.remainCash = remainCash;
	}
	public ArrayList<SimulatedStock> getSimList() {
		return simList;
	}
	public void setSimList(ArrayList<SimulatedStock> simList) {
		this.simList = simList;
	}
	@Override
	public String toString() {
		return "UserAdvanced [userId=" + userId + ", favList=" + favList
				+ ", originalAsset=" + originalAsset + ", evaluatedAsset="
				+ evaluatedAsset + ", remainCash=" + remainCash + ", simList="
				+ simList + "]";
	}
	
	
	
	
	
	
	

	
	
	
}//end public class
