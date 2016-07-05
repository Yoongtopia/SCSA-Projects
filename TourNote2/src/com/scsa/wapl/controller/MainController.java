package com.scsa.wapl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scsa.wapl.entity.Member;
import com.scsa.wapl.entity.TravelRecord;
import com.scsa.wapl.service.RecordService;
import com.scsa.wapl.service.TravelRecordService;
import com.scsa.wapl.util.AdvancedPageUtility;

@Controller
public class MainController {

	private TravelRecordService recordService;

	@Autowired
	public void setRecordService(TravelRecordService recordService) {
		this.recordService = recordService;
	}

	@RequestMapping("main.do")
	public String rlist(String continentalName, String lineup, Model model,
			HttpServletRequest request, HttpSession session) {

		String cPage = request.getParameter("pageNo");
		int page = 1;

		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			final int perPage = 15;
			int startNo = (page - 1) * perPage + 1;
			int endNo = page * perPage;
			AdvancedPageUtility pageUtil = new AdvancedPageUtility(perPage,
					recordService.listCount(continentalName), page, "images/");
			model.addAttribute("travelRecordList", recordService
					.findTravelRecordList(continentalName, lineup, startNo,
							endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			String recordWriter= ((Member)session.getAttribute("member")).getMemberId();
			List<TravelRecord> recordList = recordService.findRecordListById(recordWriter);
			model.addAttribute("recordList", recordList);
			model.addAttribute("contentPage", "mainPage.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index.jsp";
	}
	
	@RequestMapping("main2.do")
	public String rlist2(String continentalName, String lineup, Model model,
			HttpServletRequest request) {

		String cPage = request.getParameter("pageNo");
		int page = 1;

		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			final int perPage = 15;
			int startNo = (page - 1) * perPage + 1;
			int endNo = page * perPage;
			AdvancedPageUtility pageUtil = new AdvancedPageUtility(perPage,
					recordService.listCount(continentalName), page, "images/");
			model.addAttribute("travelRecordList", recordService
					.findTravelRecordList(continentalName, lineup, startNo,
							endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "app_travelRecordList2.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "app_index.jsp";
	}
	
	@RequestMapping("main3.do")
	public String rlist3(String continentalName, String lineup, Model model,
			HttpServletRequest request) {

		String cPage = request.getParameter("pageNo");
		int page = 1;

		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			final int perPage = 15;
			int startNo = (page - 1) * perPage + 1;
			int endNo = page * perPage;
			AdvancedPageUtility pageUtil = new AdvancedPageUtility(perPage,
					recordService.listCount(continentalName), page, "images/");
			model.addAttribute("travelRecordList", recordService
					.findTravelRecordList(continentalName, lineup, startNo,
							endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "app_main.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "app_index.jsp";
	}
	
	@RequestMapping("main4.do")
	public String rlist21(String continentalName, String lineup, Model model,
			HttpServletRequest request) {

		String cPage = request.getParameter("pageNo");
		int page = 1;

		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			final int perPage = 15;
			int startNo = (page - 1) * perPage + 1;
			int endNo = page * perPage;
			AdvancedPageUtility pageUtil = new AdvancedPageUtility(perPage,
					recordService.listCount(continentalName), page, "images/");
			model.addAttribute("travelRecordList", recordService
					.findTravelRecordList(continentalName, lineup, startNo,
							endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "travelRecordList2.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index.jsp";
	}
}
