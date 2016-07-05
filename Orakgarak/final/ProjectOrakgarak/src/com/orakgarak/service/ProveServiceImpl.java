package com.orakgarak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.ProveDAO;
import com.orakgarak.vo.Prove;

@Service("ProveService")
public class ProveServiceImpl implements ProveService {
	
	private ProveDAO proveDao;
	
	
	@Autowired
	public void setProveDao(ProveDAO proveDao) {
		this.proveDao = proveDao;
	}



	@Override
	public Prove selectProveByCode(String code) {
		return proveDao.selectProveByCode(code);
	}

}
