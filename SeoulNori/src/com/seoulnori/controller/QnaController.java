package com.seoulnori.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoulnori.service.QnaService;
import com.seoulnori.vo.Member;
import com.seoulnori.vo.Qna;

@Controller
public class QnaController {
	
	private QnaService qnaService;
	
	@Autowired
	public void setQnaService(QnaService qnaService) {
		this.qnaService = qnaService;
	}

	/* QnA 생성 @sy */
	@RequestMapping("/add_qna.do")
	public String addQna(String sendQnaEventId, String eventQnaContent, HttpSession session){
		Member member = (Member) session.getAttribute("member");
		Qna qna = new Qna();
		qna.setUserId(member.getUserId());
		qna.setEventId(sendQnaEventId);
		qna.setEventQnaContent(eventQnaContent);
		qnaService.addQna(qna);
		return "redirect:/event_detail.do?eventId="+sendQnaEventId+"#contentQnaList";
	}
	
	
	/*행사담당자 페이지에서 QnA 생성 @OA */
	@RequestMapping("/add_qna_manager_page.do")
	public String addQnaManagerPage(String sendQnaEventId, String eventQnaContent, HttpSession session){
		Member member = (Member) session.getAttribute("member");
		Qna qna = new Qna();
		qna.setUserId(member.getUserId());
		qna.setEventId(sendQnaEventId);
		qna.setEventQnaContent(eventQnaContent);
		qnaService.addQna(qna);
		return "redirect:/manager_page.do?tabId=qnaTab";
	}

	
	/* 답글 생성 @sy */
	@RequestMapping("/qna_add_reply.do")
	public String addReply(String sendReplyEventId, String eventReplyContent, int eventQnaNumMod, HttpSession session){
		String userId = (String) session.getAttribute("userId");
		Qna qna = new Qna();
		qna.setEventQnaNum(eventQnaNumMod);
		qna.setUserId(userId);
		qna.setEventId(sendReplyEventId);
		qna.setEventQnaContent(eventReplyContent);
		qnaService.addReply(qna);
		return "redirect:/event_detail.do?eventId="+sendReplyEventId+"#contentQnaList";
	}
	
	
	/*  행사담당자 페이지에서 답글 생성 @OA */
	@RequestMapping("/add_qna_reply_manager_page.do")
	public String addReplyManagerPage(String sendReplyEventId, String eventReplyContent, int eventQnaNumMod, HttpSession session){
		Member member = (Member) session.getAttribute("member");
		Qna qna = new Qna();
		qna.setEventQnaNum(eventQnaNumMod);
		qna.setUserId(member.getUserId());
		qna.setEventId(sendReplyEventId);
		qna.setEventQnaContent(eventReplyContent);
		qnaService.addReply(qna);
		return "redirect:/manager_page.do?tabId=qnaTab";
	}
	
	
	/* 답글 클릭시 해당 질문에 답글 있는지 확인하고 결과값 리턴 @sy */
	@ResponseBody
	@RequestMapping("/qna_check_reply.do")
	public HashMap<String, String> checkReply(int eventQnaNum){
		HashMap<String, String> map = new HashMap<String, String>();
		Qna qna = qnaService.findQnaByEventQnaNum(eventQnaNum+1);
		if(qna != null){
			map.put("status", "true");
		} else {
			map.put("status", "false");
		}
		return map;
	}
	
	/* QnA list @sy */
	@RequestMapping("/qna_list_move.do")
	public String qnaList(String eventId, Model model, HttpSession session){
		Member member = (Member) session.getAttribute("member");
		
		if(member != null){
			if(member.getUserId().equals( qnaService.findManagerIdByEventId(eventId) )){
				model.addAttribute("rightEventManager", "Y");
			} else {
				model.addAttribute("rightEventManager", "N");
			}
		}
		model.addAttribute("qnaList", qnaService.findQnaListByEventId(eventId));
		return "redirect:/event_detail.do";
	}
	
	/* [ajax] Qna 삭제 @sy */
	@ResponseBody
	@RequestMapping("/qna_delete.do")
	public HashMap<String, String> deleteQna(int eventQnaNum, String eventId){
		HashMap<String, String> map = new HashMap<String, String>();
		boolean flag = qnaService.deleteQna(eventQnaNum);
		if(flag){
			map.put("status", "true");
			map.put("talkId", "qnaTalk"+eventQnaNum);
		} else {
			map.put("status", "false");
		}
		List<Qna> qnaList = qnaService.findQnaListByEventId(eventId);
		if(qnaList.size() == 0){
			map.put("emptyList", "true");
		}
		return map;
	}
	
}
