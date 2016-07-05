package com.orakgarak.util;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.orakgarak.vo.StockInfo;

public class ParseUtil {

	public static long getCurrentPrice(String code){
		
		Document document;
		try {
			document = Jsoup.connect("http://finance.naver.com/item/main.nhn?code="+code).get();
			String price = document.select(".no_today .blind").text().replace(",", "");
			System.out.println(price);
			if(price!="") {
				return Long.parseLong(price);
			}else{
				return 0;
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}//end getCurrentPrice(String code)
	
	public static long getCurrentMarketValue(String code){
		
		Document document;
		try {
			document = Jsoup.connect("http://finance.naver.com/item/main.nhn?code="+code).get();
			String price = document.select("#_market_sum").text().replace(",", "");
			if(price!=null){
				return Long.parseLong(price)*100000000l;
			}else{
				return 0;
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}//end function()
	
	
	
public static StockInfo getStockInfo(String code){
		
		Document document;
		try {
			document = Jsoup.connect("http://finance.naver.com/item/main.nhn?code="+code).get();
			
			int updown = 0;
			
			
			if(document.select(".today .ico.up").size()>0){
				updown =1;	//상승
			}else if(document.select(".today .ico.down").size()>0){
				updown =2;	//하락
			}else if(document.select(".today .ico.sam").size()>0){
				updown =3; //보합
			}
			
			Elements values = document.select(".today .blind");
			
			long price = Long.parseLong(values.get(0).text().replace(",", ""));
			long priceVar = (Long.parseLong(values.get(1).text().replace(",", "")));
			double percentage = Double.parseDouble(values.get(2).text().replace(",", ""));
			
			StockInfo stockInfo = new StockInfo(code,price,priceVar,updown,percentage);
			System.out.println(stockInfo);
			return stockInfo;
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}//end getCurrentPrice(String code)
	
	
	
}//end public class
