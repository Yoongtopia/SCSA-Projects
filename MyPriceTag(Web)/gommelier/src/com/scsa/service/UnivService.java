package com.scsa.service;

import java.util.List;

import com.scsa.vo.Univ;

public interface UnivService {
	List<Univ> findUnivList ();
	Univ findUnivByUnivCode(String univ_code);
	List<Univ> findUnivListBySquareNum(int square_num);	
	int findSquareNumByUniv(String univ_name);
}
