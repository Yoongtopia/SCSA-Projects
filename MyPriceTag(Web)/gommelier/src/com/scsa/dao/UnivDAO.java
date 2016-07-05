package com.scsa.dao;

import java.util.List;

import com.scsa.vo.Univ;

public interface UnivDAO {
	List<Univ> selectUnivList ();
	Univ selectUnivByUnivCode(String univ_code);
	List<Univ> selectUnivListBySquareNum(int square_num);
	int selectSquareNum(String univ_name);
}
