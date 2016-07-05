package com.orakgarak.service;

import com.orakgarak.vo.BigData;

public interface BigDataService {
	
	//몇개의 키워드를 받을지 몰라 일단, 이렇게 정했음.. 대부분은 기업명이 들어갈거임.
	public BigData getBigDataValue(String code, String keyword);
	
	
}
