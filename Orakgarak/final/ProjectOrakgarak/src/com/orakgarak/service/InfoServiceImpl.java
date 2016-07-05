package com.orakgarak.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.InfoDAO;
import com.orakgarak.vo.BS;
import com.orakgarak.vo.CF;
import com.orakgarak.vo.IS;
import com.orakgarak.vo.News;

@Service
public class InfoServiceImpl implements InfoService {

	private InfoDAO infoDao;
	
	@Autowired
	public void setInfoDao(InfoDAO infoDao) {
		this.infoDao = infoDao;
	}

	@Override
	public List<BS> bsList(String code) {
		return infoDao.bsList(code);
	}

	@Override
	public List<IS> isList(String code) {
		return infoDao.isList(code);
	}

	@Override
	public List<CF> cfList(String code) {
		return infoDao.cfList(code);
	}

	@Override
	public List<News> getNews(String keyword) {
		
		
		System.out.println(keyword);
		
		
		List<News> newsList = null;
		
		try {
			String encodedKeyword = java.net.URLEncoder.encode(keyword,"UTF-8");
			Document document = Jsoup.connect("http://openapi.naver.com/search?key=0d7c72d10cd058f41f2c744506fc442a&query=" 
					+ encodedKeyword +  "&target=news&start=1&display=30&sort=sim").get();
			Elements elements = document.select("item");
			
			newsList = new ArrayList<>();
			
				for(int i = 0 ; i<elements.size() ; i++) {
					
					
					
					newsList.add(new News(elements.get(i).select("title").text().toString().replace("<b>", "").replace("</b>", "").replace("&quot;", "").replace("&gt;", "").replace("&lt;", ""),
							elements.get(i).select("originallink").text().toString(),elements.get(i).select("pubdate").text().toString().replace(":00 +0900", "").substring(4),
							elements.get(i).select("description").text().toString()));
				}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return newsList;
		
	}


}
