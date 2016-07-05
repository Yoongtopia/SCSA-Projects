package com.orakgarak.dao;

import java.util.List;

import com.orakgarak.vo.Prove;



public interface ProveDAO {
	Prove selectProveByCode(String code);
}
