package com.orakgarak.service;

import com.orakgarak.vo.Risk;
import com.orakgarak.vo.Trend;

public interface RiskService {
	
	public Risk getRiskValue(Trend trend, String code, int confidence, long asset, int days);
	
	//두번 인터넷접속을 하지 않기위해서 위와는 다르게 바로 표준편차를 줘서 구하는
	//방식으로 getRiskValue()가 오버로딩되어있음
	public Risk getRiskValue(double stdev, String code, int confidence, long asset, int days);
	
	
}
