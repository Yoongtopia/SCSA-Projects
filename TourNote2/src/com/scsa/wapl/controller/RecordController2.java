package com.scsa.wapl.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.wapl.entity.Member;
import com.scsa.wapl.entity.TravelRecord;
import com.scsa.wapl.entity.TravelRecordReply;
import com.scsa.wapl.service.RecordService;
import com.scsa.wapl.service.ScrapService;
import com.scsa.wapl.service.TravelRecordReplyService;

@Controller
public class RecordController2 {

	private RecordService recordService;
	
	private ScrapService scrapService;
	
	private TravelRecordReplyService travelRecordReplyService;
	
	@Autowired
	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	@Autowired
	public void setScrapService(ScrapService scrapService) {
		this.scrapService = scrapService;
	}

	@Autowired
	public void setTravelRecordReplyService(
			TravelRecordReplyService travelRecordReplyService) {
		this.travelRecordReplyService = travelRecordReplyService;
	}

	@RequestMapping("selectRecord.do")
	public String selectRecord(int recordNum, Model model, HttpServletRequest request){		
		TravelRecord record=recordService.findRecord(recordNum);
		model.addAttribute("record", record);
		request.setAttribute("routeList", record.getRouteList());
		model.addAttribute("recordReply", travelRecordReplyService.findTravelRecordReply(recordNum));
		model.addAttribute("contentPage", "recordDetail.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("editRecordList.do")
	public String editRecordList(Model model, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		if(member!=null){
			model.addAttribute("list", recordService.findRecordById(member.getMemberId()));	
		} else {
			model.addAttribute("errorMessage", "등록된 여행기 리스트가 없습니다.");
		}
		return "recordListDialog.jsp";
	}
	
	@RequestMapping("editRecordForm.do")
	public String editRecordForm(int recordNum, Model model){
		model.addAttribute("record", recordService.findRecord(recordNum));
		model.addAttribute("contentPage", "recordEdit.jsp");
		return "index.jsp";
	}

	@RequestMapping("insertRecordReply.do")
	public String insertRecordReply(TravelRecordReply travelRecordReply, int recordNum){
		travelRecordReplyService.addTravelRecordReply(travelRecordReply);		
		return "selectRecord.do?recordNum="+recordNum;
	}	

	@RequestMapping("deleteReply.do")
	public String deleteReply(int replyNum, int recordNum){
		travelRecordReplyService.removeTravelRecordReply(replyNum);
		return "selectRecord.do?recordNum="+recordNum;		
	}
	
	@RequestMapping("insertScrap.do")
	public String insertScrap(String memberId, int recordNum){
		scrapService.addScrap(memberId, recordNum);		
		return "selectRecord.do?recordNum="+recordNum;
	}
	
	@RequestMapping("scrap_list.do")
	public String selectSrap(String memberId, Model model){
		model.addAttribute("scrap", scrapService.findScrap(memberId));
		model.addAttribute("contentPage", "scrapList.jsp");
		return "index.jsp";		
	}
	
	@RequestMapping("delete_scrap.do")
	public String deleteScrap(HttpSession session, int recordNum){
		Member member = (Member)session.getAttribute("member");
		scrapService.removeScrap(member.getMemberId(), recordNum);		
		//return "scrapList.do?memberId="+memberId;
		return "scrap_list.do?memberId="+member.getMemberId();
	}
	
	@RequestMapping("check_recommend.do")
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
	
	@RequestMapping("editRecord.do")
	@ResponseBody
	public String editRecord(int recordNum, String recordCont){
		recordService.editRecord(recordCont, recordNum);
		return "selectRecord.do?recordNum=";
	}
	
	@RequestMapping("deleteRecord.do")
	public String deleteRecord(int recordNum, Model model){
		recordService.removeRecord(recordNum);
		return "redirect://findRecordListById.do";
	}
}
