package com.orakgarak.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.BigDataService;
import com.orakgarak.service.DCFService;
import com.orakgarak.service.MultipleService;
import com.orakgarak.service.PentagonService;
import com.orakgarak.service.RiskService;
import com.orakgarak.service.TrendService;
import com.orakgarak.util.ParseUtil;
import com.orakgarak.vo.Pentagon;
import com.orakgarak.vo.StockInfo;
import com.orakgarak.vo.Trend;


@Controller
public class PentagonController {
	
	
	private PentagonService pentagonService;
	private DCFService dcfService;
	private MultipleService multipleService;
	private RiskService riskService;
	private BigDataService bigDataService;
	private TrendService trendService;
	
	
	@Autowired
	public void setDcfService(DCFService dcfService) {
		this.dcfService = dcfService;
	}

	@Autowired
	public void setMultipleService(MultipleService multipleService) {
		this.multipleService = multipleService;
	}

	@Autowired
	public void setRiskService(RiskService riskService) {
		this.riskService = riskService;
	}

	@Autowired
	public void setBigDataService(BigDataService bigDataService) {
		this.bigDataService = bigDataService;
	}

	@Autowired
	public void setTrendService(TrendService trendService) {
		this.trendService = trendService;
	}

	@Autowired
	public void setPentagonService(PentagonService pentagonService) {
		this.pentagonService = pentagonService;
	}
	

	@RequestMapping("/selectScores.do")
	@ResponseBody
	public HashMap<Object, Object> findScore(String stockCode){
		
		Pentagon pentagon = null;
		
		HashMap<Object, Object> map = new HashMap<>();
		if(pentagonService.findScoresByCode(stockCode)!=null){
			pentagon = pentagonService.findScoresByCode(stockCode);
			
			map.put("status", true);
			map.put("stockCode", stockCode);
			map.put("pentagon", pentagon);
		}else{
			map.put("status", false);
		
		}
		
		
		return map;
		
	}

	@RequestMapping("/pentagonUpdate.do")
	public String pentagonUpdate(Model model) {
		List<Pentagon> list = pentagonService.findAll();
		model.addAttribute("list",list);
		return "pentagonUpdate";
	}
	

	@RequestMapping("/updateAllPentagon.do")
	@ResponseBody
	public HashMap<String,String> updateAllPentagon(String code) {
		
		HashMap<String, String> map = new HashMap<>();
		try {
			
			
			Trend trend = trendService.analyzeAndPackTrend(trendService.getTrendValue(code));
			
			int trendScore = trend.getScore();
			int riskScore = riskService.getRiskValue(trend, code, 5, 10000, 10).getScore();
			int bigDataScore = bigDataService.getBigDataValue(code, multipleService.findMultiple(code).getStockName()).getScore();
			int multipleScore = multipleService.findMultiple(code).getScore();
			String stockName = multipleService.findMultiple(code).getStockName();
			Pentagon pentagon = new Pentagon(code,multipleScore,trendScore,riskScore,bigDataScore,stockName);
			pentagonService.updatePentagonWithoutDCF(pentagon);
			System.out.println(pentagon);
			
			map.put("code", code);
			map.put("status", "완료");
			return map;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("msg",  e.getMessage());
		}
		
		map.put("code", code);
		map.put("status", "실패");
		return map;
		
		
		
		
	}//end updateAllpentagon()
	
	@RequestMapping("/admin_management.do")
	public String admin(Model model){
		model.addAttribute("contentPage","admin/pentagonUpdate.jsp");
		return "index";

	}
	
	@RequestMapping("/get_stock_info.do")
	@ResponseBody
	public HashMap<String,Object> getStockInfo(String code) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		try{
			
			StockInfo stockInfo = ParseUtil.getStockInfo(code);
			map.put("stockInfo", stockInfo);
			map.put("status", 1);
			
		}catch(Exception e){
			e.printStackTrace();
			map.put("status", 2);
		}
		return map;
	}//end getStockInfo
	

	

		

}
