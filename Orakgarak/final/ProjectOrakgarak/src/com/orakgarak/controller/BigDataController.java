package com.orakgarak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.BigDataService;
import com.orakgarak.service.MultipleService;
import com.orakgarak.vo.BigData;

@Controller
public class BigDataController {

	private BigDataService bigService;
	private MultipleService multipleService;
	
	
	@Autowired
	public void setMultipleService(MultipleService multipleService) {
		this.multipleService = multipleService;
	}

	@Autowired
	public void setBigService(BigDataService bigService) {
		this.bigService = bigService;
	}

	@RequestMapping("/bigdata.do")
	public String bigdata(String code,String name, Model model){
		model.addAttribute("code", code);
		model.addAttribute("name", multipleService.findMultiple(code).getStockName());
		
		return "pentagon/bigdata";
		
	}//end risk()
	
	@RequestMapping("/getBigData.do")
	@ResponseBody
	public BigData getBigData(String code, String keyword){
		
		return bigService.getBigDataValue(code, keyword);
		
	}//end getBigData
	
	
	
	
}//end public class
