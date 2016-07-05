package com.orakgarak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.TrendService;
import com.orakgarak.vo.Trend;

@Controller
public class TrendController {
	
	
	private TrendService trendService;

	@Autowired
	public void setTrendService(TrendService trendService) {
		this.trendService = trendService;
	}//end setTrendService
	
	@RequestMapping("/trend.do")
	public String trend(String code, Model model){
		model.addAttribute("code", code);
		System.out.println(code);
		return "pentagon/trend";
		
	}//end risk()
	
	@RequestMapping("/getTrend.do")
	@ResponseBody
	public Trend getTrend(String code){
		
		Trend trend = null;
		
		try{
		trend = trendService.getTrendValue(code);
		trend = trendService.analyzeAndPackTrend(trend);
		
		}catch (Exception e){
			e.printStackTrace();
		}
		
		
		
		return trend;
	}//end getTrend
	
	
	
	
	
	
}//end public class
