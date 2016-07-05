package com.orakgarak.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.InfoService;
import com.orakgarak.service.MultipleService;

@Controller
public class InfoController {

	private InfoService infoService;
	private MultipleService multipleService;
	
	@Autowired	
	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}
	@Autowired
	public void setMultipleService(MultipleService multipleService) {
		this.multipleService = multipleService;
	}

	@RequestMapping("/info.do")
	public String bsList(String code, Model model){
		
		model.addAttribute("bsList", infoService.bsList(code));
		model.addAttribute("isList", infoService.isList(code));
		model.addAttribute("cfList", infoService.cfList(code));
		model.addAttribute("code",code);
		return "pentagon/info";
	}
	
	@RequestMapping("/ggparser.do")
	@ResponseBody
	public HashMap<String, Object> ggparser(Model model, String code){
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("address", "http://dart.fss.or.kr/api/search.xml?auth=f82b30410b781329ac2a086daa64f89260e364f2&crp_cd=" 
		+ code + "&start_dt=19990101&bsn_tp=A001&bsn_tp=A002&bsn_tp=A003");
		
		return map;
		
	}//end ggparser()
	
	@RequestMapping("/get_news.do")
	@ResponseBody
	public HashMap<String, Object> getNews(Model model, String code){
		
		HashMap<String, Object> map = new HashMap<>();
		
		String keyword = multipleService.findStockName(code);
		//여기다 뉴스 파싱할거임
		map.put("newsList", infoService.getNews(keyword));
		
		return map;
	}
	
	

	
}
