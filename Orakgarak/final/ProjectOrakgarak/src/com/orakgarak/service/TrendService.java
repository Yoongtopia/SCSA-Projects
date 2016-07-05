package com.orakgarak.service;

import org.springframework.stereotype.Service;

import com.orakgarak.vo.Trend;


public interface TrendService {

	
	/* 
	private double trendTenDay;
	private double trendThirtyDay;
	private double trendFiftyDay;
	private int score;
	�Ʒ� ù��° analuzeAndPackTrend()������ �� �װ��� ������ �߰������� �� �����մϴ�. (��Ӱ��� ������ �ƴ�, Trend��ü�� ������)
	*/
	
	//�ü��� �ִ� Trend��ü�� �޾Ƽ� �м��� �����ϰ�, 10��, 30��, 50���� �м��ϰ�, ������ �Ű��� Trend��ü�� �ٽ� ��ȯ�մϴ�.
	public Trend analyzeAndPackTrend(Trend trend) throws Exception;
	
	
	//50�ϰ��� �ֽĽü��� ���̹����� �ۿɴϴ�. �м��ϰ� ������ �ִ°��� ���� �޼���� �����ϴ�.
	public Trend getTrendValue(String code) throws Exception;
	
	
}
