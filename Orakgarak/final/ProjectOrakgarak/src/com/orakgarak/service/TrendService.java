package com.orakgarak.service;

import org.springframework.stereotype.Service;

import com.orakgarak.vo.Trend;


public interface TrendService {

	
	/* 
	private double trendTenDay;
	private double trendThirtyDay;
	private double trendFiftyDay;
	private int score;
	아래 첫번째 analuzeAndPackTrend()에서는 위 네가지 변수를 추가적으로 더 설정합니다. (상속같은 개념이 아닌, Trend객체는 재사용함)
	*/
	
	//시세가 있는 Trend객체를 받아서 분석을 시작하고, 10일, 30일, 50일을 분석하고, 총점이 매겨진 Trend객체를 다시 반환합니다.
	public Trend analyzeAndPackTrend(Trend trend) throws Exception;
	
	
	//50일간의 주식시세를 네이버에서 퍼옵니다. 분석하고 점수를 주는것은 위의 메서드로 뺐습니다.
	public Trend getTrendValue(String code) throws Exception;
	
	
}
