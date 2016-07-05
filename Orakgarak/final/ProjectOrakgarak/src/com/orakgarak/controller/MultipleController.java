package com.orakgarak.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.MultipleService;
import com.orakgarak.service.PentagonService;
import com.orakgarak.service.ProveService;
import com.orakgarak.util.ParseUtil;
import com.orakgarak.vo.Multiple;

@Controller
public class MultipleController {

	private Logger logger = Logger.getLogger(MultipleController.class);
	
	private static MultipleService multipleService;
	private PentagonService pentagonService;

	
	@Autowired	
	public void setMultipleService(MultipleService multipleService) {
		this.multipleService = multipleService;
	}
	
	@Autowired
	public void setPentagonService(PentagonService pentagonService) {
		this.pentagonService = pentagonService;
	}
	
	


	@RequestMapping("/multiple.do")
	public String multiple(String stockCode, Model model){
		
		String industryCode=multipleService.findIndustryCodebyStockCode(stockCode);
		Multiple multiple=multipleService.findMultiple(stockCode);
		model.addAttribute("multiple",multiple);
		model.addAttribute("multipleList",multipleService.multipleList(industryCode));
		model.addAttribute("industry", multipleService.selectIndustry(industryCode));
	
		HashMap<String, Integer> map=new HashMap<>();
		map.put(stockCode, multiple.getScore());
		pentagonService.updateMultipleScore(map);
		return "pentagon/multiple";
	}
	
/*	@RequestMapping("/check_id.do")
	@ResponseBody
	public HashMap<String, Object> checkId(String code){
		HashMap<String, Object> map=new HashMap<String, Object>();
		Subject subject=subjectService.findSubjectWithEnrollList(code);
		if(subject==null){
			map.put("status", true);
			map.put("message", "사용가능");
		}else{
			map.put("status", false);
			map.put("message", "사용불가");
		}
		return map;
	}*/
	
	
	@RequestMapping("/category.do")
	@ResponseBody
	public HashMap<String,Object> category(String kindustryCode, Model model){
		List<HashMap<String,String>> categoryList=multipleService.selectCategory(kindustryCode);
		
		HashMap<String, Object> map=new HashMap<>();
		if(categoryList!=null){
			map.put("status", true);
			map.put("categoryList", categoryList);
		}else{
			map.put("status", false);
		}
		return map;
	}
	
	@RequestMapping("/industry_multiple.do")
	@ResponseBody
	public HashMap<String, Object> multipleList(String nindustryCode, Model model){
		List<Multiple> multipleList=multipleService.multipleList(nindustryCode);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(multipleList!=null){
			map.put("status", true);
			map.put("multipleList", multipleList);
		}else{
			map.put("status", false);
		}
		return map;
	}
	
	@RequestMapping("/search.do")
	@ResponseBody
	public HashMap<String, Object> searchStock(String searchStock, Model model){
		List<Multiple> list = multipleService.selectMultipleCodeOrName(searchStock);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(list!=null){
			map.put("status", true);
			map.put("companyList", list);
		}else{
			map.put("status", false);
		}
		
		return map;

	}
	
	
	@RequestMapping("/search2go.do")
	@ResponseBody
	public HashMap<String, Object> searchStock2(String searchStock, Model model){

		List<Multiple> list = multipleService.selectMultipleCodeOrName(searchStock);
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(list!=null){
			map.put("status", true);
			map.put("companyList", list);
		}else{
			map.put("status", false);
		}
		
		return map;

	}
	
	@RequestMapping("/stock_detail.do")
	public String stockDetail(@RequestParam(value="stockCode",defaultValue="005930")String stockCode, Model model, HttpSession session){
		System.out.println(stockCode);
//		Pentagon pentagon=pentagonService.findAllByCode(stockCode);
		
//		model.addAttribute("pentagon", pentagon);
		Multiple multiple=multipleService.findMultiple(stockCode);
		model.addAttribute("name", multiple.getStockName());
		model.addAttribute("price", ParseUtil.getCurrentPrice(stockCode));
		model.addAttribute("code", stockCode);
		model.addAttribute("contentPage", "/pentagon/report.jsp");
		
		return "index";
	}
	
/*	@RequestMapping("/multiple_list.do")
	public String multipleList(Multiple multiple, Model model){
		List<Multiple> list = multipleService.selectMultipleList();
		
		
		return null;
		
	}*/
}
