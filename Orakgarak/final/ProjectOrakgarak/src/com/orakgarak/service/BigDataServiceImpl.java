package com.orakgarak.service;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.BigDataDAO;
import com.orakgarak.util.ConvertFunctions;
import com.orakgarak.vo.BigData;


@Service
public class BigDataServiceImpl implements BigDataService {

	private BigDataDAO dao;
	
	@Autowired
	public void setDao(BigDataDAO dao) {
		this.dao = dao;
	}


	@Override
	public BigData getBigDataValue(String code, String keyword) {
		BigData bigData = new BigData();
		bigData.setCode(code);
		bigData.setKeyword(keyword);
		
		return setBigDataFromNews(bigData);
		
	}//end getBigDataValue()
	

	private BigData setBigDataFromNews(BigData bigData) {
		
		int position = 0;
		int position2 = 0;
		int position3 = 0;
		String numberString = null;
		Document document = null;
		String doc = null;
		
		
			//pd=2��1����, 1�� 1��, 4�� 1��, 6�� 6������.
			
			
			try{
				document = Jsoup.connect("http://news.search.naver.com/search.naver?where=news&query="+bigData.getKeyword()+"&pd=4")
						.header("Accept", "*/*").get();
				doc = document.toString();
			//����ã�°��� 1���� ������
			position = doc.indexOf("title_desc all_my");
			position2 = doc.indexOf("/",position);
			position3 = doc.indexOf("��",position2);
			numberString = doc.substring(position2+2, position3);
			if(numberString!=null){
				int numberInt = Integer.parseInt(numberString.replace(",",""));
				bigData.setNewsInterestDay(numberInt);
			}
			}catch(Exception e){
				bigData.setNewsInterestDay(0);
			}
			
			
			
			
			try{
				document = Jsoup.connect("http://news.search.naver.com/search.naver?where=news&query="+bigData.getKeyword()+"&pd=1")
						.header("Accept", "*/*").get();
				doc = document.toString();
			//����ã�°��� 1���� ������
			position = doc.indexOf("title_desc all_my");
			position2 = doc.indexOf("/",position);
			position3 = doc.indexOf("��",position2);
			numberString = doc.substring(position2+2, position3);
			if(numberString!=null){
				int numberInt = Integer.parseInt(numberString.replace(",",""));
				bigData.setNewsInterestWeek(numberInt);
			}
			}catch(Exception e){
				bigData.setNewsInterestWeek(0);
			}
			
			
			
			
			try{
				document = Jsoup.connect("http://news.search.naver.com/search.naver?where=news&query="+bigData.getKeyword()+"&pd=2")
						.header("Accept", "*/*").get();
				doc = document.toString();
			//����ã�°��� 1������ ������
			position = doc.indexOf("title_desc all_my");
			position2 = doc.indexOf("/",position);
			position3 = doc.indexOf("��",position2);
			numberString = doc.substring(position2+2, position3);
			if(numberString!=null){
				int numberInt = Integer.parseInt(numberString.replace(",",""));
				bigData.setNewsInterestMonth(numberInt);
			}
			}catch(Exception e){
				bigData.setNewsInterestMonth(0);
			}
			
			
			
			try{
				document = Jsoup.connect("http://news.search.naver.com/search.naver?where=news&query="+bigData.getKeyword()+"&pd=6")
						.header("Accept", "*/*").get();
				doc = document.toString();
			//����ã�°��� 1���� ������
			position = doc.indexOf("title_desc all_my");
			position2 = doc.indexOf("/",position);
			position3 = doc.indexOf("��",position2);
			numberString = doc.substring(position2+2, position3);
			if(numberString!=null){
			int numberInt = Integer.parseInt(numberString.replace(",",""));
				bigData.setNewsInterest6Month(numberInt);
			}
		}catch(Exception e){
			bigData.setNewsInterest6Month(0);
		}
			
		
		
		
		try{
		double dayPercent = ((float)bigData.getNewsInterestDay())/((float)bigData.getNewsInterestWeek());
		
		if((int)(dayPercent/0.003571429)<99 && (int)(dayPercent/0.003571429)>0){
		bigData.setDayScore((int)(dayPercent/0.003571429));
		}else if((int)(dayPercent/0.003571429)<0){
			bigData.setDayScore(0);
		}else{
			bigData.setDayScore(99);
		}
		
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(bigData.getCode() + e.getMessage());
			bigData.setDayScore(0);
		}
		try{
		double weekPercent = ((float)bigData.getNewsInterestWeek())/((float)bigData.getNewsInterestMonth());
		
		if((int)(weekPercent/0.005833333)<99 && (int)(weekPercent/0.005833333)>0){
			bigData.setWeekScore((int)(weekPercent/0.005833333));
			}else if((int)(weekPercent/0.005833333)<0){
				bigData.setWeekScore(0);
			}else{
				bigData.setWeekScore(99);
			}
		
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(bigData.getCode() + e.getMessage());
			bigData.setWeekScore(0);
		}
		try{
		double monthPercent = ((float)bigData.getNewsInterestMonth())/((float)bigData.getNewsInterest6Month());
		
		if((int)(monthPercent/0.004166667)<99 && (int)(monthPercent/0.004166667)>0){
			bigData.setMonthScore((int)(monthPercent/0.004166667));
			}else if((int)(monthPercent/0.004166667)<0){
				bigData.setMonthScore(0);
			}else{
				bigData.setMonthScore(99);
			}
		
		
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(bigData.getCode() + e.getMessage());
			bigData.setMonthScore(0);
		}
		
		int newsVolumeScore = bigData.getNewsInterestWeek()/500*10; //������ �����ϰ��� ������ ���ؼ� ����ġ�� ��������.
		if(newsVolumeScore >= 10){ //����� �ָ������� ���Ѽ��� 10����.
			newsVolumeScore = 10;
		}
		int score = (2*bigData.getDayScore()+4*bigData.getWeekScore()+2*bigData.getMonthScore()) / 6 + newsVolumeScore;
	
		
		if(score>=98){
			score = 98;
		}else if (score<=2){
			score = 2;
		}
		//�ӽ� ������!!
		bigData.setScore(score);
		
		//������Ʈ�ϴ·�����
		dao.updateScore(score, bigData.getCode());
		
		return bigData;
		
		
	}//end setBigDataFrom
	
	


		
		
	}//end public class
