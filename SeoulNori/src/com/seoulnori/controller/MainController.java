package com.seoulnori.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoulnori.service.EventService;

@Controller
public class MainController {
	
	private EventService eventService;
	
	@Autowired
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	@RequestMapping("/seoulnori.do")
	public String moveList(String selectedDate, Model model, String error, HttpServletRequest request, HttpSession session){
		
		String keyword=(String) session.getAttribute("keyword");
		String adminkeyword=(String) session.getAttribute("adminkeyword");
		String detailKeyword=(String) session.getAttribute("detailKeyword");
		
		if(keyword!=null){
			session.setAttribute("keyword", "");
		}
		if(adminkeyword!=null){
			session.setAttribute("adminkeyword", "");
		}
		if(detailKeyword!=null){
			session.setAttribute("detailKeyword", "");
		}
		
		if(selectedDate == null || selectedDate == ""){
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String todayStr = sdf.format(today).toString();
			model.addAttribute("selectedDate", todayStr);
			model.addAttribute("eventListByDate", eventService.findEventListByCalendarDate(todayStr, null));
			
		}
		if(error!=null&&error.trim()!=""){
		model.addAttribute("error",error );
		model.addAttribute("errorFix","errorFix" );
		}
		model.addAttribute("mainEventList", eventService.findEventListByEventCategory(null, null));
		model.addAttribute("fromMain", "fromMain");
		
		return "view_main/index";
	}

}
