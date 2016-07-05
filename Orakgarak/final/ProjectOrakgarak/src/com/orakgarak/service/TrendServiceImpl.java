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

	
	
	//�ü��� �ִ� Trend��ü�� �޾Ƽ� �м��� �����ϰ�, 10��, 30��, 50���� �м��ϰ�, ������ �Ű��� Trend��ü�� �ٽ� ��ȯ�մϴ�.
		public Trend analyzeAndPackTrend(Trend trend){
			
			ArrayList<TrendData> list = (ArrayList<TrendData>) trend.getTrendDatalist();
			
			float sum = 0;
			int score = 50; //�⺻������ 50���� �ΰ� �����մϴ�.
			
			//������ ���鼭 ��·��� �����ݴϴ�.
			for(int i = 0 ; i<list.size()-1 ; i++){
				
				float price1 = list.get(i).getPrice();
				float price2 = list.get(i+1).getPrice();
				float growthRate = price1/price2-1;
				list.get(i).setGrowthRate(growthRate);
				
				sum += growthRate;
				
				//10��, 30��, 50�ϵ����� ���ͷ��� ������ݴϴ�.
				if(i==9){
					trend.setTrendTenDay(sum);
				}else if(i==29){
					trend.setTrendThirtyDay(sum);
				}else if(i==list.size()-2){
					trend.setTrendFiftyDay(sum);
				}
				
			}
			
			
			//�̺κп� 50�ϰ� ���ͷ��� 30�ϰ� ���ͷ�, 10�ϰ����ͷ��� ���ؼ� score�� �ִ� ������ ���ϴ�. ���� ������ �ӽ���
			
			
			
			
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
		
		
		
		//50�ϰ��� �ֽĽü��� ���̹����� �ۿɴϴ�. �м��ϰ� ������ �ִ°��� ���� �޼���� �����ϴ�.
		public Trend getTrendValue(String code) throws Exception{
			
			Trend trend = new Trend();
			trend.setCode(code);
			
			ArrayList<TrendData> trendDataList = new ArrayList<TrendData>();
			
			//�������� ���鼭 100���� �ü������� ��� �Ľ��س���. (100����, VaR�� ���ϱ� ����)
			for(int page = 1; page<11 ; page++){
			//jsoup�̶�� �ļ�������̺귯�� �Ļ� Connection��. �Ϲ����� DBĿ�ؼ��� ������� �� Connection�� �ƴ�!
			Connection conn = Jsoup.connect("http://finance.naver.com/item/sise_day.nhn?code="
					+ code + "&page=" + page);
			
			//Jsoup ���̺귯�� Document. html�� document��ü�� �ҷ��鿩 JQueryó�� �̿밡���ϰ� ���ݴϴ�.
			Document document = conn.get();
			
			Elements rows = document.select("tr");
			
			for(int i = 0 ; i < 15 ; i++){
				if(i==0 || i==1 || i==7 || i==8 || i==9){ //�̻��� ���̺���� ���ְ� ��.
					continue;
				}else{
					Elements spans = rows.get(i).select("td span");
					try{
						String tradeDate = spans.get(0).text(); //��¥�� �����ɴϴ�.
							TrendData trendData = new TrendData();	
						int price = Integer.parseInt(spans.get(1).text().replaceAll(",","")); //��ǥ�� ������ ������ �ҷ��ɴϴ�.
						int volume = Integer.parseInt(spans.get(6).text().replaceAll(",","")); //��ǥ�� ������ �ŷ����� �ҷ��ɴϴ�.
						trendData.setTradeDate(tradeDate);
						trendData.setPrice(price);
						trendData.setVolume(volume);
						
						trendDataList.add(trendData);
						
						}catch(NumberFormatException e){ //�����Ͱ� ���� ����� ó������
							return null;
						}
						
				}//end else
				
			}//end paging	
				
			}//end ex for
			
			trend.setTrendDatalist(trendDataList);
			
			
			
			return trend;
			
		}//end getTrendValue()
	
	
}//end public class
