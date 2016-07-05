package com.orakgarak.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.PentagonService;
import com.orakgarak.vo.Pentagon;


@Controller
public class RankAndDetailSearchController {

	private PentagonService pentagonService;

	@Autowired
	public void setPentagonService(PentagonService pentagonService) {
		this.pentagonService = pentagonService;
	}
	
	@RequestMapping("/rank_and_search.do")
	public String rankAndSearch(Model model){
		
		//여기 컨텐트 채우는 메서드 넣어야함.
		model.addAttribute("contentPage","rank/rank.jsp");
		return "index";
		
	}//end rankAndSearch()
	
	@RequestMapping("/rank_and_search_syn.do")
	@ResponseBody
	public HashMap<String,Object> rankAndSearchSyn(Model model){
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("dcfList",pentagonService.getAllPentagonOrderByDcf());
		map.put("multipleList",pentagonService.getAllPentagonOrderByMultiple());
		map.put("riskList",pentagonService.getAllPentagonOrderByRisk());
		map.put("bigdataList",pentagonService.getAllPentagonOrderByBigData());
		map.put("trendList",pentagonService.getAllPentagonOrderByTrend());
		
		return map;
		
	}//end rankAndSearch()
	
	@RequestMapping("/detail_search.do") //해당하는 메서드는 그냥화면을 이동시키기만 하는 메서드임
	public String detailSearch(Model model){
		model.addAttribute("contentPage", "rank/detail_search.jsp");
		return "index";
	};
	
	@RequestMapping("/detail_search_limit.do")
	@ResponseBody
	public HashMap<String, Object> detailSearchLimit(int limitDcf, int limitMultiple, int limitRisk, int limitBigdata, int limitTrend) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		List<Pentagon> list = null;
		//exception처리 해줘야할 필요가 있음
		try{
		list = pentagonService.getCustomized(limitDcf, limitMultiple, limitRisk, limitBigdata, limitTrend);
		
		map.put("limitSearchList", list);
		map.put("status", 1);
		}catch(Exception e){
			map.put("status", 2);
		}
		return map;
	}
	
	@RequestMapping("/detail_search_least_most.do")
	@ResponseBody
	public HashMap<String, Object> detailSearchLeastAndMost(int leastDcf, int mostDcf, int leastMultiple, 
			int mostMultiple, int leastRisk, int mostRisk, int leastBigdata, int mostBigdata, int leastTrend, int mostTrend) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		List<Pentagon> list = null;
		//exception처리 해줘야할 필요가 있음
		try{
			
		list = pentagonService.getCustomizedRange(leastDcf, mostDcf, leastMultiple, 
				mostMultiple, leastRisk, mostRisk, leastBigdata, mostBigdata, leastTrend, mostTrend);
		map.put("leastAndMostSearchList", list);
		map.put("status", 1);
		}catch(Exception e){
			map.put("status", 2);
		}
		return map;
		
	}//end detailSearchLeastAndMost
	
	@RequestMapping("/preferTestResult.do")
	@ResponseBody
	public HashMap<String, Object> preferTestResult(int scoreDcf, int scoreMultiple, int scoreRisk, int scoreBigdata, int scoreTrend, Model model){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int leastDcf=0;
		int mostDcf=0;
		int leastMultiple=0;
		int mostMultiple=0;
		int leastRisk=0;
		int mostRisk=0;
		int leastBigdata=0;
		int mostBigdata=0;
		int leastTrend=0;
		int mostTrend=0;
		
		System.out.println("scoreDcf : "+scoreDcf);
		System.out.println("scoreMultiple : "+scoreMultiple);
		System.out.println("scoreRisk : "+scoreRisk);
		System.out.println("scoreBigdata : "+scoreBigdata);
		System.out.println("scoreTrend : "+scoreTrend);
		
		if(scoreDcf == 10){
			leastDcf=95;
			mostDcf=100;
		}else if(scoreDcf==5){
			leastDcf=40;
			mostDcf=97;
		}else{
			leastDcf=0;
			mostDcf=50;
		}
		
		if(scoreMultiple == 10){
			leastMultiple=80;
			mostMultiple=100;
		}else if(scoreMultiple == 5){
			leastMultiple = 50;
			mostMultiple=93;
		}else{
			leastMultiple=0;
			mostMultiple=70;
		}
		
		if(scoreRisk == 10){
			leastRisk=90;
			mostRisk=100;
		}else if(scoreRisk == 5){
			leastRisk=50;
			mostRisk=93;
		}else{
			leastRisk=0;
			mostRisk=70;
		}
		
		if(scoreBigdata == 10){
			leastBigdata=85;
			mostBigdata=100;
		}else if(scoreBigdata == 5){
			leastBigdata=40;
			mostBigdata=90;
		}if(scoreBigdata == 0){
			leastBigdata=0;
			mostBigdata=50;
		}
		
		if(scoreTrend == 10){
			leastTrend =70;
			mostTrend=100;
		}else if(scoreTrend==5){
			leastTrend =40;
			mostTrend=79;
		}if(scoreTrend == 0){
			leastTrend =0;
			mostTrend=59;
		}
		List<Pentagon> list = null;
		list = pentagonService.getCustomizedRange(leastDcf, mostDcf, leastMultiple, 
				mostMultiple, leastRisk, mostRisk, leastBigdata, mostBigdata, leastTrend, mostTrend);
		System.out.println(list);
		map.put("result", list);
		
		return map;
	}
	
	
	
}
