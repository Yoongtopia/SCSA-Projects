package com.seoulnori.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoulnori.service.EventService;
import com.seoulnori.service.MemberService;
import com.seoulnori.service.ReviewService;
import com.seoulnori.service.StampService;
import com.seoulnori.vo.Member;
import com.seoulnori.vo.Review;
import com.seoulnori.vo.Stamp;


@Controller
public class StampController {
	private Logger logger =Logger.getLogger(StampController.class);
	
	private StampService stampService;

	private EventService eventService;
	
	private MemberService memberService;
	
	private ReviewService reviewService;

	@Autowired
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	@Autowired
	public void setStampService(StampService stampService) {
		this.stampService = stampService;
	}

	@Autowired
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}
	
	@Autowired
	public void setMemberService(MemberService memberService){
		this.memberService = memberService;
	}

	
	//사용자가 사진+후기 입력시 스탬프 자동 생성
	//스탬프 번호는 각 행사 카테고리의 영어단어
	@RequestMapping("stamp_add.do")
	public void addStamp(String eventId, HttpSession session){
		Stamp stamp = new Stamp();
		stamp.setUserId((String)session.getAttribute("userId"));
		stamp.setEventId(eventId);
		
		String stampNum="";
		String categoryNum = eventService.getCategoryNumByEventId(eventId);
		//System.out.println(categoryNum);
		logger.info("stamp_add: categoroyNum="+categoryNum);
	
		if(categoryNum.equals("A02070100")||categoryNum.equals("A02070200")){
			stampNum="festival";
		}else if(categoryNum.equals("A02080100")||categoryNum.equals("A02081300")){
			stampNum="etc";
		}else if(categoryNum.equals("A02080200")||categoryNum.equals("A02080300")||categoryNum.equals("A02081000")){
			stampNum="performance";
		}else if(categoryNum.equals("A02080500")||categoryNum.equals("A02080600")||categoryNum.equals("A02080700")){
			stampNum="exhibition";
		}else{
			stampNum="classic";
		}

		stamp.setStampNum(stampNum);

		logger.info("stamp_add: stamp="+stamp);
		
		boolean addFlag = stampService.addStamp(stamp);
		if(!addFlag){
			System.out.println("stamp_add: 에러");
		}else{
			System.out.println("stamp_add: 성공");
		}
		
		
	}
	
	
	
	//관리자 스탬프 목록 조회
	@RequestMapping("stamp_list_admin.do")
	public String stampListAdmin(Model model){
		List<Stamp> stampList = stampService.findStampListForAdmin();
		for(Stamp s: stampList){
			String sGetDate = s.getStampGetDate();
			s.setStampGetDate(sGetDate.substring(0, sGetDate.indexOf(" ")));
		}
		 model.addAttribute("stampList", stampList);
		 model.addAttribute("contentPage", "view_stamp/member_stamp_list.jsp");
		 return "view_main/index";
		
	}
	
	
	
	//사용자 스탬프 목록 조회
	@RequestMapping("/stamp_list_member.do")
	public String stampListMember(HttpSession session, Model model){
		String userId = (String) session.getAttribute("userId");
		List<Stamp> stampList = stampService.findStampListByUserId(userId);
		for(Stamp s:stampList){
			String sGetDate = s.getStampGetDate();
			s.setStampGetDate(sGetDate.substring(0, sGetDate.indexOf(":")-3));		
		}
		model.addAttribute("stampList", stampList);
		model.addAttribute("contentPage", "view_member/member_page.jsp");
		model.addAttribute("myContent", "view_stamp/member_stamp_list.jsp");
		return "view_main/index";
	}
	
	
	
	
	//메인 스탬프로 지정
	@RequestMapping("stamp_main_stamp.do")
	public String makeMainStamp(String stampNum, String eventId, HttpSession session, Model model){
		String userId = (String) session.getAttribute("userId");
		stampService.makeMainStamp(stampNum, userId, eventId);
		return "redirect:/member_mypage.do?tabId=myStampTab";
	}
	
	
	//스탬프 명예의 전당 
	@RequestMapping("stamp_hall_of_fame.do")
	public String stampHallOfFame(Model model){
		//스탬프 순위로 회원아이디와 스탬프 개수 가져오기
		List<Member> memberList = stampService.findStampListForUser();
		List<List<Stamp>> stampList = new ArrayList<>();
		List<Member> memberList2 = new ArrayList<>();
		//회원 아이디로 stamp리스트 가져오기
		for(Member m: memberList){
		stampList.add(stampService.findStampListByUserId(m.getUserId()));
		Member member = memberService.selectMemberById(m.getUserId());
		member.setStampCount(m.getStampCount());
		memberList2.add(member);
		}
		
		
		model.addAttribute("memberList", memberList2);
		model.addAttribute("contentPage", "view_stamp/stamp_hall_of_fame.jsp");
		return "view_main/index";
	}
	
	
	
	//스탬프 상태 바꾸기
	@RequestMapping("stamp_changeStamp.do")
	public String changeStamp(String stampNum, String userId, String eventId){
		stampService.updateStamp(stampNum, userId, eventId);
		System.out.println(stampNum+userId+eventId);
		return "redirect:/admin_page.do?tabId=stampListTab&pageNo=1";
	}

	
/**고쳐야 할 부분*/
	//관리자 스탬프 리스트 페이징
	@RequestMapping("stamp_list_admin_with_page.do")
	public String stampListAdminWithPage(int startNo, int endNo, Model model){
		List<Stamp> stampList = stampService.findStampListForAdminWithPage(startNo, endNo);
		for(Stamp s: stampList){
			String sGetDate = s.getStampGetDate();
			s.setStampGetDate(sGetDate.substring(0, sGetDate.indexOf(" ")));
		}
		 model.addAttribute("stampList", stampList);
		 model.addAttribute("contentPage", "view_stamp/member_stamp_list.jsp");
		 return "view_main/index";
		
	}
	
/**고쳐야 할 부분*/
	//사용자 스탬프 리스트 페이징
	@RequestMapping("stamp_list_member_with_page.do")
	public String stampListMemberWithPage(int startNo, int endNo,HttpSession session, Model model){
		String userId = (String) session.getAttribute("userId");
		List<Stamp> stampList = stampService.findStampListByUserIdWithPage(userId, startNo, endNo);
		for(Stamp s:stampList){
			String sGetDate = s.getStampGetDate();
			s.setStampGetDate(sGetDate.substring(0, sGetDate.indexOf(":")-3));		
		}
		model.addAttribute("stampList", stampList);
		 model.addAttribute("contentPage", "view_stamp/member_stamp_list.jsp");
		 return "view_main/index";
		
	}
	
	//스탬프 상태 확인을 위한 리뷰 보기
	@ResponseBody
	@RequestMapping("stamp_review_ajax.do")
	public HashMap<String, Object> stampReviewAjax(String userId, String eventId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Review review = reviewService.findReviewByEventIdAndUserId(eventId, userId);
		if(review==null){
			map.put("status", false);
			map.put("review", "");
		} else{
			map.put("review", review);
			map.put("status", true);
		}
		
		return map;
	}
}//end class
