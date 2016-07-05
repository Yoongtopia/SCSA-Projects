package com.orakgarak.service;

import java.util.List;

import com.orakgarak.vo.BS;
import com.orakgarak.vo.CF;
import com.orakgarak.vo.IS;
import com.orakgarak.vo.News;

public interface InfoService {

	List<BS> bsList(String code);
	List<IS> isList(String code);
	List<CF> cfList(String code);
	List<News> getNews(String keyword);
}
