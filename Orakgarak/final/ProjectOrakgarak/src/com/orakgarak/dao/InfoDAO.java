package com.orakgarak.dao;

import java.util.List;

import com.orakgarak.vo.BS;
import com.orakgarak.vo.CF;
import com.orakgarak.vo.IS;

public interface InfoDAO {

	List<BS> bsList(String code);
	List<IS> isList(String code);
	List<CF> cfList(String code);
}
