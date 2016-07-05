package com.orakgarak.service;

import java.util.ArrayList;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.TrendDAO;
import com.orakgarak.vo.Trend;
import com.orakgarak.vo.TrendData;


@Service
public class TrendServiceImpl implements TrendService {

private TrendDAO dao;
	
	
	
	@Autowired
	public void setDao(TrendDAO dao) {
		this.dao = dao;
	}

	
	
	//시세가 있는 Trend객체를 받아서 분석을 시작하고, 10일, 30일, 50일을 분석하고, 총점이 매겨진 Trend객체를 다시 반환합니다.
		public Trend analyzeAndPackTrend(Trend trend){
			
			ArrayList<TrendData> list = (ArrayList<TrendData>) trend.getTrendDatalist();
			
			float sum = 0;
			int score = 50; //기본점수를 50으로 두고 시작합니다.
			
			//루프를 돌면서 상승률을 구해줍니다.
			for(int i = 0 ; i<list.size()-1 ; i++){
				
				float price1 = list.get(i).getPrice();
				float price2 = list.get(i+1).getPrice();
				float growthRate = price1/price2-1;
				list.get(i).setGrowthRate(growthRate);
				
				sum += growthRate;
				
				//10일, 30일, 50일동안의 수익률을 계산해줍니다.
				if(i==9){
					trend.setTrendTenDay(sum);
				}else if(i==29){
					trend.setTrendThirtyDay(sum);
				}else if(i==list.size()-2){
					trend.setTrendFiftyDay(sum);
				}
				
			}
			
			
			//이부분에 50일간 수익률과 30일간 수익률, 10일간수익률을 비교해서 score를 주는 로직이 들어갑니다. 지금 로직은 임시임
			
			
			
			
			score += trend.getTrendThirtyDay() * 100;
			
			
			//////////////////////////////////////////////////////////////////////
			
			if(score>=100){
				score =100;
			}else if(score<=0){
				score=0;
			}
			
			trend.setScore(score);
			dao.updateScore(trend.getScore(),trend.getCode());
			return trend;
			
		}//end analyzeTrend()
		
		
		
		//50일간의 주식시세를 네이버에서 퍼옵니다. 분석하고 점수를 주는것은 위의 메서드로 뺐습니다.
		public Trend getTrendValue(String code) throws Exception{
			
			Trend trend = new Trend();
			trend.setCode(code);
			
			ArrayList<TrendData> trendDataList = new ArrayList<TrendData>();
			
			//페이지를 돌면서 100일의 시세정보를 모두 파싱해놓음. (100일은, VaR을 구하기 위해)
			for(int page = 1; page<11 ; page++){
			//jsoup이라는 파서도움라이브러리 파생 Connection임. 일반적인 DB커넥션을 얻기위한 그 Connection이 아님!
			Connection conn = Jsoup.connect("http://finance.naver.com/item/sise_day.nhn?code="
					+ code + "&page=" + page);
			
			//Jsoup 라이브러리 Document. html을 document객체로 불러들여 JQuery처럼 이용가능하게 해줍니다.
			Document document = conn.get();
			
			Elements rows = document.select("tr");
			
			for(int i = 0 ; i < 15 ; i++){
				if(i==0 || i==1 || i==7 || i==8 || i==9){ //이상한 테이블들은 빼주고 함.
					continue;
				}else{
					Elements spans = rows.get(i).select("td span");
					try{
						String tradeDate = spans.get(0).text(); //날짜를 가져옵니다.
							TrendData trendData = new TrendData();	
						int price = Integer.parseInt(spans.get(1).text().replaceAll(",","")); //쉼표를 포함한 종가를 불러옵니다.
						int volume = Integer.parseInt(spans.get(6).text().replaceAll(",","")); //쉼표를 포함한 거래량을 불러옵니다.
						trendData.setTradeDate(tradeDate);
						trendData.setPrice(price);
						trendData.setVolume(volume);
						
						trendDataList.add(trendData);
						
						}catch(NumberFormatException e){ //데이터가 없는 기업은 처리해줌
							return null;
						}
						
				}//end else
				
			}//end paging	
				
			}//end ex for
			
			trend.setTrendDatalist(trendDataList);
			
			
			
			return trend;
			
		}//end getTrendValue()
	
	
}//end public class
