package com.scsa.wapl.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.wapl.entity.Transportation;
import com.scsa.wapl.service.TransportationService;
import com.scsa.wapl.util.AdvancedPageUtility;

@Controller
public class TransportationController {
	
	private Logger logger = Logger.getLogger(SpotController.class);
	
	private TransportationService transportationService;

	@Autowired
	public void setTransportationSevice(TransportationService transportationSevice) {
		this.transportationService = transportationSevice;
	}

	// 교통 정보 - 비동기
	@RequestMapping("/get_transportationList.do")
	@ResponseBody
	public HashMap<String, Object> transportationList(String country, String transportationType){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<Transportation> transportList=transportationService.findTransportationListByTypeAndCountry(transportationType, country);

		if (transportList.size() != 0){
			map.put("status", true);
			map.put("transportList",transportList);
			map.put("transportationType",transportationType);
		} else {
			map.put("status", false);
			map.put("transportationType",transportationType);
		}
		return map;
	}
	
	//관리자 교통정보 수정페이지
	@RequestMapping("/goTransportationUpdate.do")
	public String transportationManage(Model model, HttpServletRequest request){
		String cPage=request.getParameter("pageNo");
		int page=1;
		
		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
		final int perPage=15;
		int startNo=(page-1)*perPage+1;
		int endNo=page*perPage;
			AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, transportationService.listCount(), page,"images/");
			model.addAttribute("transportationList", 
					transportationService.findTransportationList(startNo, endNo));
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "transportationUpdate.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index.jsp";
		
	}
	
	//교통정보 삭제 페이지
	@RequestMapping("/goTransportationDelete.do")
	public String GoTransportationDelete(Model model, HttpServletRequest request){
		String cPage=request.getParameter("pageNo");
		int page=1;
		
		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			final int perPage=15;
			int startNo=(page-1)*perPage+1;
			int endNo=page*perPage;
			AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, transportationService.listCount(), page,"images/");
			model.addAttribute("transportationList", 
					transportationService.findTransportationList(startNo, endNo));
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "transportationDelete.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index.jsp";
		
	}
	
	//교통정보 등록페이지
	@RequestMapping("/goRegistTransportation.do")
	public String goRegistTransportation(Model model){
		model.addAttribute("contentPage", "registTransportation.jsp");
		return "/index.jsp";
	}
	
	//교통정보 등록
	@RequestMapping("/registTransportationByAdmin.do")
	public String registTransportation(Transportation transportation, Model model){
		transportationService.createTransportationByAdmin(transportation);
		model.addAttribute("contentPage", "registTransportation.jsp");
		return "/index.jsp";
	}
	
	//교통정보 업데이트
	@RequestMapping("/updateTransportation.do")
	public String updateTransportation(Transportation transportaion){
		transportationService.modifyTransportation(transportaion);
		return "goTransportationUpdate.do";
	}
	
	//교통정보 삭제
	@RequestMapping("/removeTransportation.do")
	public String removeTransportation(Transportation transportation, Model model){
		
		transportationService.removeTransportation(transportation.getTransportationType(),
				transportation.getTransportationName(), transportation.getCountryName());
		return "goTransportationDelete.do";
	}
	
	
}//end class