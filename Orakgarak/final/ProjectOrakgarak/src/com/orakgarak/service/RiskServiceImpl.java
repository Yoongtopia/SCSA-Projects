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
		
		//Ǯ��Ű���� �������� trend�� ���մϴ�.
		Risk risk = new Risk();
		
		risk.setConfidenceLevel(MathValues.zValueMap.get(100-confidence));
		double stdev = MathValues.getStd(trend);
		
		risk.setCode(code);
		risk.setStdev(stdev);
		
		risk.setAsset(asset);
		risk.setDays(days);
		
		double riskAsset = asset * stdev * (MathValues.zValueMap.get(100-confidence)) * Math.sqrt(days);
		//�ִ�ġ�� ������, �׳� �ڻ갡���� �����̵�.
		if(riskAsset>=asset){
			risk.setRiskAsset(asset);
		}else{
		risk.setRiskAsset(riskAsset);
		}
		//�ϴ��� ���������� �̷��� �����ϴ�.
		
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
	
	//�ι� ���ͳ������� ���� �ʱ����ؼ� ���ʹ� �ٸ��� �ٷ� ǥ�������� �༭ ���ϴ�
	//������� getRiskValue()�� �����ε��Ǿ�����
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
		//�ϴ��� ���������� �̷��� �����ϴ�.
		risk.setScore((int)stdev*1000);
		
		dao.updateScore(risk.getScore(), risk.getCode());
		
		return risk;
		
	}//end getRiskValue()
	

}//end public class
