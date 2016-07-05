package com.orakgarak.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.RiskDAO;
import com.orakgarak.util.MathValues;
import com.orakgarak.vo.Risk;
import com.orakgarak.vo.Trend;

@Service
public class RiskServiceImpl implements RiskService {

	private RiskDAO dao;
	
	
	
	@Autowired
	public void setDao(RiskDAO dao) {
		this.dao = dao;
	}

	
	@Override
	public Risk getRiskValue(Trend trend, String code, int confidence,
			long asset, int days) {
		
		//풀패키지로 가져오는 trend를 뜻합니다.
		Risk risk = new Risk();
		
		risk.setConfidenceLevel(MathValues.zValueMap.get(100-confidence));
		double stdev = MathValues.getStd(trend);
		
		risk.setCode(code);
		risk.setStdev(stdev);
		
		risk.setAsset(asset);
		risk.setDays(days);
		
		double riskAsset = asset * stdev * (MathValues.zValueMap.get(100-confidence)) * Math.sqrt(days);
		//최대치를 넘으면, 그냥 자산가격이 세팅이됨.
		if(riskAsset>=asset){
			risk.setRiskAsset(asset);
		}else{
		risk.setRiskAsset(riskAsset);
		}
		//일단은 점수기준을 이렇게 놓습니다.
		
		int score = 0;
		
		System.out.println(riskAsset);
		
		if(riskAsset>5000){
			score = 1;
		}else if(riskAsset>3000){
			score = 2;
		}else if(riskAsset>2500){
			score = 3;
		}else if(riskAsset>2000){
			score = 4;
		}else if(riskAsset>1875){
			score = 5;
		}else if(riskAsset<=1875 && riskAsset>=500){
		
		score = (int) (96-(riskAsset-500)/15);
		if(score>=96) {
			score = 96;
		}else if(score<=3){
			score = 3;
		}
		
		}else if(riskAsset<20){
			score = 40;
		}else if(riskAsset<100){
			score = 70;
		}else{
			score = 97;
		}
		
		risk.setScore(score);
		
		return risk;
		
	}//end getRiskValue()
	
	//두번 인터넷접속을 하지 않기위해서 위와는 다르게 바로 표준편차를 줘서 구하는
	//방식으로 getRiskValue()가 오버로딩되어있음
	public Risk getRiskValue(double stdev, String code, int confidence,
			long asset, int days){
		
		Risk risk = new Risk();
		
		risk.setCode(code);
		risk.setStdev(stdev);
		risk.setConfidenceLevel(MathValues.zValueMap.get(100-confidence));
		risk.setAsset(asset);
		risk.setDays(days);
		
		double riskAsset = asset * stdev * (MathValues.zValueMap.get(100-confidence)) * Math.sqrt(days);
		risk.setRiskAsset(riskAsset);
		//일단은 점수기준을 이렇게 놓습니다.
		risk.setScore((int)stdev*1000);
		
		dao.updateScore(risk.getScore(), risk.getCode());
		
		return risk;
		
	}//end getRiskValue()
	

}//end public class
