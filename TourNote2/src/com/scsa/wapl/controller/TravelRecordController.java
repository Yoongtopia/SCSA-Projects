package com.scsa.wapl.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.scsa.wapl.entity.Member;
import com.scsa.wapl.entity.TravelRecord;
import com.scsa.wapl.service.TravelRecordService;
import com.scsa.wapl.util.AdvancedPageUtility;

@Controller
@SessionAttributes
public class TravelRecordController {

	private Logger logger = Logger.getLogger(TravelRecordController.class);
	
	private TravelRecordService recordService;

	@Autowired
	public void setRecordService(TravelRecordService recordService) {
		this.recordService = recordService;
	}
	
	
	
	/*@ResponseBody
	@RequestMapping("/findTravelRecordList.do")
	public HashMap<String, Object> findTravelRecordList(String continentalName, String lineup){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TravelRecord> list = recordService.findTravelRecordList(continentalName, lineup);
		map.put("travelRecordList", list);
		
		return map;
	}*/
	
	/* 동기, 페이징*/
	@RequestMapping("/findTravelRecordList.do")
	public String findTravelRecordList(String continentalName, String lineup, String pageNo, Model model, 
			HttpServletRequest request){
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
			System.out.println(recordService.listCount(continentalName));
			AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, recordService.listCount(continentalName), page,"images/");
			
			model.addAttribute("travelRecordList", 
					recordService.findTravelRecordList(continentalName, lineup, startNo, endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "travelRecordList2.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index.jsp";
	}
	
	/*폰갭 동기, 페이징 시도*/
	@RequestMapping("/findTravelRecordList2.do")
	public String findTravelRecordList2(String continentalName, String lineup, Model model, 
			HttpServletRequest request){
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
			System.out.println(recordService.listCount(continentalName));
			AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, recordService.listCount(continentalName), page,"images/");
			
			model.addAttribute("travelRecordList", 
					recordService.findTravelRecordList(continentalName, lineup, startNo, endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "app_travelRecordList2.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "app_index.jsp";
	}
	
	
	
	/*@ResponseBody 비동기, 페이징 시도
	@RequestMapping("/findTravelRecordList.do")
	public HashMap<String, Object> findTravelRecordList(String continentalName, String lineup, HttpServletRequest request, Model model){
		HashMap<String, Object> map = new HashMap<String, Object>();
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
				AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, recordService.listCount(), page,"images/");
				map.put("boardList", 
						recordService.findTravelRecordList(continentalName, lineup, startNo, endNo));
				map.put("startNo", startNo);
				map.put("endNo", endNo);
				map.put("pageLink", pageUtil.getPageBar());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return map;
	}*/
	
	/*키워드로 여행기 검색*/
	@RequestMapping("/findTravelRecordListByKeyword.do")
	public String findTravelRecordListByKeyWord(String keyword, Model model){
		
		System.out.println(keyword);
		List<TravelRecord> list = recordService.findTravelRecordListByKeyword(keyword);
		System.out.println(list);
		model.addAttribute("RecordList", list);
		model.addAttribute("contentPage", "searchList.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("/findRecordListById.do")
	public String findRecordListById(Model model, HttpSession session){
		String recordWriter= ((Member)session.getAttribute("member")).getMemberId();
		List<TravelRecord> recordList = recordService.findRecordListById(recordWriter);
		model.addAttribute("recordList", recordList);
		model.addAttribute("contentPage", "myTravelRecord.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("/findRecordListById2.do")
	public String findRecordListById2(Model model, HttpSession session){
		String recordWriter= ((Member)session.getAttribute("member")).getMemberId();
		List<TravelRecord> recordList = recordService.findRecordListById(recordWriter);
		model.addAttribute("travelRecordList", recordList);
		model.addAttribute("contentPage", "app_travelRecordList3.jsp");
		return "app_index.jsp";
	}
	
}
