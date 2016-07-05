package com.scsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.UnivDAO;
import com.scsa.vo.Univ;

@Service("univ")
public class UnivServiceImpl implements UnivService {

	private UnivDAO univDao;
	
	@Autowired
	public void setUnivDao(UnivDAO univDao) {
		this.univDao = univDao;
	}

	@Override
	public List<Univ> findUnivList() {
		return univDao.selectUnivList();
	}

	@Override
	public Univ findUnivByUnivCode(String univ_code) {
		return univDao.selectUnivByUnivCode(univ_code);
	}

	@Override
	public List<Univ> findUnivListBySquareNum(int square_num) {
		return univDao.selectUnivListBySquareNum(square_num);
	}

	@Override
	public int findSquareNumByUniv(String univ_name) {
		return univDao.selectSquareNum("%"+univ_name+"%");
	}

}
