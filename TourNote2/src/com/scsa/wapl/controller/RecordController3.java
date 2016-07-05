package com.scsa.wapl.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.wapl.entity.Member;
import com.scsa.wapl.entity.RecordRoute;
import com.scsa.wapl.entity.TravelRecord;
import com.scsa.wapl.entity.TravelRecordReply;
import com.scsa.wapl.service.RecordLocationService;
import com.scsa.wapl.service.RecordService;
import com.scsa.wapl.service.ScrapService;
import com.scsa.wapl.service.TravelRecordReplyService;

@Controller
public class RecordController3 {

	@Autowired
	private RecordService recordService;
	
	@Autowired
	private ScrapService scrapService;
	
	@Autowired
	private TravelRecordReplyService travelRecordReplyService;
	
	@Autowired
	private RecordLocationService recordLocationService;
	
	@RequestMapping("selectRecord2.do")
	public String selectRecord(int recordNum, Model model, HttpServletRequest request){		
		TravelRecord record=recordService.findRecord(recordNum);
		model.addAttribute("record", record);
		request.setAttribute("routeList", record.getRouteList());
		model.addAttribute("recordReply", travelRecordReplyService.findTravelRecordReply(recordNum));
		model.addAttribute("contentPage", "app_recordDetail2.jsp");
		return "app_index.jsp";
	}
	
	@RequestMapping("editRecordList2.do")
	public String editRecordList(Model model, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		if(member!=null){
			model.addAttribute("list", recordService.findRecordById(member.getMemberId()));	
			model.addAttribute("contentPage", "recordListDialog.jsp");	
		} else {
			model.addAttribute("errorMessage", "등록된 여행기 리스트가 없습니다.");
			model.addAttribute("contentPage", "recordListDialog.jsp");	
		}
		return "app_index.jsp";
	}
	
	@RequestMapping("editRecordForm2.do")
	public String editRecordForm(int recordNum, Model model){
		model.addAttribute("record", recordService.findRecord(recordNum));
		model.addAttribute("contentPage", "recordEdit.jsp");	
		return "index.jsp";
	}

	@RequestMapping("insertRecordReply2.do")
	public String insertRecordReply(TravelRecordReply travelRecordReply, int recordNum){
		travelRecordReplyService.addTravelRecordReply(travelRecordReply);		
		return "selectRecord2.do?recordNum="+recordNum;
	}	

	@RequestMapping("deleteReply2.do")
	public String deleteReply(int replyNum, int recordNum){
		travelRecordReplyService.removeTravelRecordReply(replyNum);
		return "selectRecord2.do?recordNum="+recordNum;		
	}
	
	@RequestMapping("insertScrap2.do")
	public String insertScrap(String memberId, int recordNum){
		scrapService.addScrap(memberId, recordNum);		
		return "selectRecord2.do?recordNum="+recordNum;
	}
	
	@RequestMapping("scrap_list2.do")
	public String selectSrap(String memberId, Model model){
		model.addAttribute("scrap", scrapService.findScrap(memberId));
		model.addAttribute("contentPage", "app_scrapList.jsp");
		return "app_index.jsp";
	}
	
	@RequestMapping("delete_scrap2.do")
	public String deleteScrap(HttpSession session, int recordNum){
		Member member = (Member)session.getAttribute("member");
		scrapService.removeScrap(member.getMemberId(), recordNum);		
		return "scrap_list2.do?memberId="+member.getMemberId();
	}
	
	@RequestMapping("check_recommend2.do")
	@ResponseBody
	public HashMap<String, Object> selectRecommend(String memberId, int recordNum){
		HashMap<String, Object> map = new HashMap<>();		
		if(scrapService.findRecommend(memberId, recordNum) != null){
			map.put("status", true);			
		}else{
			map.put("status", false);
			scrapService.addRecommend(memberId, recordNum);
			scrapService.plusRecommend(recordNum);
			TravelRecord record=recordService.findRecord(recordNum);
			map.put("recommend", record.getRecommend());
		}
		return map;
	}
	
	@RequestMapping("editRecord2.do")
	public String editRecord(int recordNum, String recordCont, Model model){
		recordService.editRecord(recordCont, recordNum);
		return "app_index.jsp";
	}
	
	//비동기로 변화된 위치 등록하고, 등록된 전체 경로 list 가져감
	@RequestMapping("regist_route.do")
	@ResponseBody     
	public HashMap<String, Object> registRoute(HttpSession session,HttpServletRequest request, Double latitude, Double longitude){
		int recordNum=(int) session.getAttribute("recordNum");
		
		//변화된 위치 등록
		recordLocationService.createRoute(new RecordRoute(recordNum, latitude, longitude));
		
		//동일한 record num에 있는 모든 경로를 시간순으로 가져감
		List<RecordRoute> routeList=recordLocationService.findRouteByNum(recordNum);
		request.setAttribute("routeList", routeList);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("routeList", routeList);
		map.put("lastIndex", routeList.size());
		
		return map;
	}
	
}
