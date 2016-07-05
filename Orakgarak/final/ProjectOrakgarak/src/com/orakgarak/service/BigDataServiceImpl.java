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
		
		
			//pd=2는1개월, 1은 1주, 4는 1일, 6은 6개월임.
			
			
			try{
				document = Jsoup.connect("http://news.search.naver.com/search.naver?where=news&query="+bigData.getKeyword()+"&pd=4")
						.header("Accept", "*/*").get();
				doc = document.toString();
			//숫자찾는과정 1일을 세팅함
			position = doc.indexOf("title_desc all_my");
			position2 = doc.indexOf("/",position);
			position3 = doc.indexOf("건",position2);
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
			//숫자찾는과정 1주을 세팅함
			position = doc.indexOf("title_desc all_my");
			position2 = doc.indexOf("/",position);
			position3 = doc.indexOf("건",position2);
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
			//숫자찾는과정 1개월을 세팅함
			position = doc.indexOf("title_desc all_my");
			position2 = doc.indexOf("/",position);
			position3 = doc.indexOf("건",position2);
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
			//숫자찾는과정 1년을 세팅함
			position = doc.indexOf("title_desc all_my");
			position2 = doc.indexOf("/",position);
			position3 = doc.indexOf("건",position2);
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
		
		int newsVolumeScore = bigData.getNewsInterestWeek()/500*10; //뉴스의 일주일간의 개수를 구해서 절대치로 조정해줌.
		if(newsVolumeScore >= 10){ //언론의 주목지수의 상한선은 10점임.
			newsVolumeScore = 10;
		}
		int score = (2*bigData.getDayScore()+4*bigData.getWeekScore()+2*bigData.getMonthScore()) / 6 + newsVolumeScore;
	
		
		if(score>=98){
			score = 98;
		}else if (score<=2){
			score = 2;
		}
		//임시 점수임!!
		bigData.setScore(score);
		
		//업데이트하는로직임
		dao.updateScore(score, bigData.getCode());
		
		return bigData;
		
		
	}//end setBigDataFrom
	
	


		
		
	}//end public class
