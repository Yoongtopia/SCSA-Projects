package com.orakgarak.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.DCFService;
import com.orakgarak.service.PentagonService;
import com.orakgarak.service.ProveService;
import com.orakgarak.vo.DCF;

@Controller
public class DCFController {
	
	/*private Logger logger = Logger.getLogger(DCFController.class);*/
	private DCFService DCFService;
	private PentagonService pentagonService;
	private ProveService proveService;
	
	@Autowired
	public void setDCFService(DCFService dCFService) {
		DCFService = dCFService;
	}
	
	
	@Autowired
	public void setPentagonService(PentagonService pentagonService) {
		this.pentagonService = pentagonService;
	}
	
	

	@Autowired
	public void setProveService(ProveService proveService) {
		this.proveService = proveService;
	}


	@RequestMapping("/dcf_list.do")
	public String list(Model model){
		model.addAttribute("dcfList", DCFService.findDCFList());
/*		model.addAttribute("contentPage", "user_list.jsp");
		return "index";*/
		
		return "dcf";
	}
	
	
	@RequestMapping("/select_growth.do")
	@ResponseBody
	public HashMap<String, Object> growth(Model model, String indName){

		double growth=DCFService.findGrowth(indName);
	
		HashMap<String, Object> map = new HashMap<>();
		if(DCFService.findGrowth(indName) != 0){
			map.put("status", true);
			map.put("growth", growth );
		}else{
			map.put("status", false);
			};
		
		
/*		model.addAttribute("contentPage", "user_list.jsp");
		return "index";*/
		
		return map;
	}
	
	

	
	@RequestMapping("/select_dcf.do")
	public String uslist(Model model, String code, int date){
	
		
				model.addAttribute("price", DCFService.getPriceByCode(code));
				model.addAttribute("dcfList", DCFService.findDCFByCode(code));	
				model.addAttribute("rfList", DCFService.findRfByDate(date));
				model.addAttribute("prove", proveService.selectProveByCode(code));
			
				
		/*model.addAttribute("contentPage", "NeWFile.jsp");
		return "index";*/
		return "NewFile";
	}
	
	@RequestMapping("/select_scores.do")
	@ResponseBody
	public String scores(Model model, String code){
		model.addAttribute("scores", DCFService.findScoreByCode(code));
		return "redirect:/select_dcf.do";
	}

	@RequestMapping("/dcf_update.do")
	@ResponseBody
	public HashMap<String, Object> updateScore(Model model, String code, int year, double score){
		HashMap<String, Object> map = new HashMap<>();
		if(DCFService.updateScore(code, year, score) == true){
			map.put("status", true);
		}else{
			map.put("status", false);
			};
		
		
/*		model.addAttribute("contentPage", "user_list.jsp");
		return "index";*/
		
		return map;
	}
	

	@RequestMapping("/dcfPentagon_update.do")
	@ResponseBody
	public HashMap<String, Object> updatePentagon(Model model, String stockCode, int scoreDcf){
		HashMap<String, Object> map = new HashMap<>();
		
		
		if(pentagonService.updateDcfScore(stockCode, scoreDcf) == true){
			map.put("status", true);
		}else{
			map.put("status", false);
			};
			return map;
	
	}
	

	@RequestMapping("/select_costofdebt.do")
	@ResponseBody
	public HashMap<String, Object> costofdebt(Model model, String code, int year){

		double kd = DCFService.findCostOfDebt(code, year);
	
		HashMap<String, Object> map = new HashMap<>();
		if(kd != 0){
			map.put("status", true);
			map.put("kd", kd );
		}else{
			map.put("status", false);
			};
		
		
/*		model.addAttribute("contentPage", "user_list.jsp");
		return "index";*/
		
		return map;
	}
	
	@RequestMapping("/calculateDCF.do")
	@ResponseBody
	public HashMap<String,Object> calculateDcf(String code, Model model){
		HashMap<String, Object> map = new HashMap<>();
		map.put("dcf", DCFService.getFullCalculatedDCF(code));
		return map;
	}
	
	

	
	
}
