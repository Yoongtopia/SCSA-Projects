package com.seoulnori.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoulnori.service.MemberService;
import com.seoulnori.service.MyCalendarService;
import com.seoulnori.service.QnaService;
import com.seoulnori.service.ReviewService;
import com.seoulnori.service.StampService;
import com.seoulnori.util.AdvancedPageUtility;
import com.seoulnori.vo.Event;
import com.seoulnori.vo.Member;
import com.seoulnori.vo.Qna;
import com.seoulnori.vo.Review;
import com.seoulnori.vo.Stamp;

@Controller("memberController")
public class MemberController{
	
	private Logger logger =Logger.getLogger(MemberController.class);
	private MemberService memberService;
	private ReviewService reviewService;
	private StampService stampService;
	private MyCalendarService myCalendarService;
	private QnaService qnaService;
	
	@Autowired
	public void setQnaService(QnaService qnaService) {
		this.qnaService = qnaService;
	}

	@Autowired
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	@Autowired
	public void setMyCalendarService(MyCalendarService myCalendarService) {
		this.myCalendarService = myCalendarService;
	}

	@Autowired
	public void setStampService(StampService stampService) {
		this.stampService = stampService;
	}

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
/*	//로그인 동기 @sy
	@RequestMapping("/member_login.do")
	public String login(String userId, String password, String returnUrl, String contextPath,
			HttpSession session){
		int index = returnUrl.indexOf(contextPath) + contextPath.length()+1;
		session.setAttribute("member", memberService.login(userId, password));
		return "redirect:/"+returnUrl.substring(index, returnUrl.length());
	}*/
	
	// [ajax] 로그인
	@ResponseBody
	@RequestMapping("/member_login_ajax.do")
	public HashMap<String, Object> login(String userId, String password,
			HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		if( memberService.login(userId, password) != null){
			map.put("status", true);
			session.setAttribute("member", memberService.login(userId, password));
			session.setAttribute("userId", memberService.login(userId, password).getUserId());
			
		} else {
			map.put("status", false);
		}
		return map;
	}
	
	
	//로그인상태 체크
	@ResponseBody
	@RequestMapping("/login_check.do")
	public HashMap<String, Object> loginCheck(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			map.put("status", true);
			map.put("member", member);
		} else {
			map.put("status", false);
		}
		return map;
	}
	
	//로그아웃
	@RequestMapping("/member_logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/seoulnori.do";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("/member_joinForm.do")
	public String joinForm(Model model){
		model.addAttribute("contentPage", "view_member/joinForm.jsp");
		return "/view_main/index";
	}
	
	//회원가입
	@RequestMapping("/member_join.do")
	public String join(Member member, String eventId, HttpSession session){
	
		if(member.getMemberType().equals("member") ){
			eventId=null;
		}
		
		if(member.getMemberType().equals("manager")){
			member.setMainStamp("defaultStampStaff");
		}else if(member.getMemberType().equals("admin")){
			member.setMainStamp("defaultStampAdmin");
		}else{
			member.setMainStamp("defaultStampMember");
		}
		memberService.addtMember(member, eventId);
		session.setAttribute("member", memberService.login(member.getUserId(), member.getPassword()));
		session.setAttribute("userId", member.getUserId());
		return "redirect:/seoulnori.jsp";
	}
		
	//중복체크
	@ResponseBody
	@RequestMapping("/id_check.do")
	public HashMap<String, Object> idCheck(String userId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(memberService.selectMemberById(userId)!=null){
			map.put("status", false);
		} else{
			map.put("userId", userId);
			map.put("status", true);
		}
		return map;
	}
	
/*	//회원전체목록(ajax)
	@ResponseBody
	@RequestMapping("/member_list_ajax.do")
	public HashMap<String, Object> listAjax(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", memberService.selectMemberList());
		return map;
	}*/
	
/*	//회원전체목록
	@RequestMapping("/member_list.do")
	public String list(Model model, String pageNo,HttpSession session) throws Exception{
		Member member = (Member) session.getAttribute("member");
		System.out.println(member.getMemberType());
		if(member==null||!(member.getMemberType().equals("admin"))){
			System.out.println(member.getMemberType());
			model.addAttribute("error",URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
			return "redirect:/seoulnori.do";
		}
		
		String cPage = pageNo;
		int page = 1;
		
		try {
			if(cPage==""){
				page = 1;
			}else{
			page = Integer.parseInt(cPage);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
				
		final int perPage = 10;
		int startNo = (page-1)*perPage + 1;
		int endNo = page*perPage;
		String memberType="";
		
		AdvancedPageUtility pageUtil = 
				new AdvancedPageUtility(perPage,memberService.findPageCount(memberType), page, "images/");
		
			
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("perPage", perPage);
		model.addAttribute("pageLink", pageUtil.getPageBar());
		model.addAttribute("memberList", memberService.selectMemberList(startNo, endNo));
		model.addAttribute("contentPage", "view_member/member_list.jsp");
		return "/view_member/index_adminpage.jsp";
		}*/
	
	/*	
	 * 회원상세보기
		1. 관리자가 회원의 상세 정보를 조회하는 경우
			1-1. 행사담당자는 행사 정보를 함께 보여준다.
			1-2. 일반회원은 획득 스탬프 정보를 함께 보여준다.
		2. 회원이 자신의 상세정보를 조회하는 경우
			정보를 수정할 수 있는 폼의 형태로 기본 정보만 보여준다.
												*/
	@RequestMapping("/member_view.do")
	public String view(Model model, String userId, String myInfo, HttpSession session) throws UnsupportedEncodingException{
		
		Member member = (Member) session.getAttribute("member");
		
		if(member==null){
			model.addAttribute("error", URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
			return "redirect:/seoulnori.do";
		}
	
		
		if(member.getMemberType().equals("admin")){
			member = memberService.selectMemberById(userId);
			if(member.getMemberType().equals("manager")){
			member = memberService.selectEventListByEventManager(userId);
		
			}
			model.addAttribute("stampList", stampService.findStampListByUserId(userId));
			if(myInfo.equals("no")){
				model.addAttribute("adminPageTabChk", "memberListTab");
				model.addAttribute("contentPage", "view_member/member_detail_admin.jsp");
				model.addAttribute("member",member);
			}else{
				model.addAttribute("adminPageTabChk", "myInfoTab");
				model.addAttribute("contentPage", "view_member/member_detail.jsp");
			}
			
			return "view_member/index_admin_page";
		} else if(member.getMemberType().equals("manager")){
			member = memberService.selectMemberById(userId);
			model.addAttribute("contentPage", "view_member/member_detail.jsp");
			model.addAttribute("managerPageTabChk", "myInfoTab");
			model.addAttribute("member",member);
			return "view_member/index_manager_page";
		} else {
			member = memberService.selectMemberById(userId);
			model.addAttribute("contentPage", "view_member/member_detail.jsp");
			model.addAttribute("myPageTabChk", "myInfoTab");
			model.addAttribute("member",member);
			return "view_member/index_mypage";
		}
	
	}
	
	//회원타입별보기
	@ResponseBody
	@RequestMapping("/order_by_type.do")
	public HashMap<String, Object> orderByMemberType(String memberType){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", memberService.selectMemberByMemberType(memberType));
		return map;
	}
	
	//회원검색
	@ResponseBody
	@RequestMapping("/member_search.do")
	public HashMap<String, Object> searchMember(String userId, String nickname){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberList", memberService.selectMemberByUserIdOrNickname(userId, nickname));
		return map;
	}
	
	//회원정보수정
	@RequestMapping("/member_update.do")
	public String updateMember(Member member, Model model){
		memberService.modifyMember(member);
		return "redirect:/member_mypage.do";
		
	}
	
	//탈퇴
	@RequestMapping("/member_delete.do")
	public String deleteMember(String userId, HttpSession session, Model model){
		memberService.removeMember(userId);
		Member member = (Member) session.getAttribute("member");
		if(member.getMemberType().equals("admin")){
			model.addAttribute("contentPage", "view_admin/member_list.jsp");
			model.addAttribute("adminPageTabChk", "memberListTab");
			model.addAttribute("pageNo", "1");
			return "view_member/index_admin_page";
		} else {
			session.invalidate();
			return "redirect:/seoulnori.do";
		}
	}
	
	//마이페이지 메인
	@RequestMapping("/member_mypage.do")
	public String mypage (String tabId, Model model, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException{
		
		String userId = (String) session.getAttribute("userId");
		if(userId==null){
			model.addAttribute("error",URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
			return "redirect:/seoulnori.do";
		}
	
		
		Member member = memberService.selectMemberById(userId);
		model.addAttribute("member", member);
/*		logger.info(member);*/

		if( tabId == null ){
			model.addAttribute("contentPage", "view_myCalendar/calendar_list.jsp");
			model.addAttribute("myPageTabChk", "myCalTab");
		} else {
			
			if(tabId.equals("myCalTab") || tabId.equals("")){

				model.addAttribute("contentPage", "view_myCalendar/calendar_list.jsp");
				model.addAttribute("myPageTabChk", "myCalTab");
				
			} else if(tabId.equals("myStampTab")){
				
				/*내 스탬프 목록*/
				List<Stamp> stampList = stampService.findStampListByUserId(userId);
				for(Stamp s:stampList){
					String sGetDate = s.getStampGetDate();
					s.setStampGetDate(sGetDate.substring(0, sGetDate.indexOf(":")-3));		
				}
				model.addAttribute("stampList", stampList);
				model.addAttribute("contentPage", "view_stamp/member_stamp_list.jsp");
				model.addAttribute("myPageTabChk", "myStampTab");
				
			} else if(tabId.equals("myReviewTab")){
				
				/*내가 쓴 후기*/
				List<Review> reviewList = reviewService.findReviewListByUserId(userId);
				logger.info("review_list_userId_move: reviewList.size()="
						+ reviewList.size());
				model.addAttribute("reviewList", reviewList);
				model.addAttribute("contentPage", "view_member/member_review_list.jsp");
				model.addAttribute("myPageTabChk", "myReviewTab");
				
			} else if(tabId.equals("myInfoTab")){
				model.addAttribute("contentPage", "view_member/myInfo.jsp");
				model.addAttribute("myPageTabChk", "myInfoTab");
			}
			
		}

		return "view_member/index_mypage";
	}
	
	//정보수정 전 화면(비밀번호 입력)
	@RequestMapping("/member_myInfo_move.do")
	public String myInfo(Model model){
		model.addAttribute("contentPage", "view_member/myInfo.jsp");
		return "view_main/index";	
	}
	
	//관리자 페이지 메인
		@RequestMapping("/admin_page.do")
		public String adminpage(String afterUpdateServer, String pageNo, String tabId, Model model, 
				HttpSession session, HttpServletRequest request) throws Exception{
			
			Member member=(Member) session.getAttribute("member");
			if(member==null||!(member.getMemberType().equals("admin"))){
				model.addAttribute("error",URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
				return "redirect:/seoulnori.do";
			}
			
			/*멤버리스트 출력*/
			
			String cPage = pageNo;
			int page = 1;
			
			try {
				if(cPage==""||cPage==null){
					page = 1;
				}else{
					page = Integer.parseInt(cPage);
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
					
			final int perPage = 10;
			int startNo = (page-1)*perPage + 1;
			int endNo = page*perPage;
			String memberType="";
			AdvancedPageUtility pageUtil = 
					new AdvancedPageUtility(perPage,memberService.findPageCount(memberType), page, "images/");
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("perPage", perPage);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("memberList", memberService.selectMemberList(startNo, endNo));
			

			if( tabId == null ){
				model.addAttribute("contentPage", "view_member/member_list.jsp");
				model.addAttribute("adminPageTabChk", "memberListTab");
			} else {
				
				if(tabId.equals("memberListTab") || tabId.equals("")){

					model.addAttribute("contentPage", "view_member/member_list.jsp");
					model.addAttribute("adminPageTabChk", "memberListTab");
					
				} else if(tabId.equals("stampListTab")){
					
					/*스탬프 관리 페이지*/
					List<Stamp> stampList = stampService.findStampListForAdmin();
					for(Stamp s: stampList){
						String sGetDate = s.getStampGetDate();
						s.setStampGetDate(sGetDate.substring(0, sGetDate.indexOf(" ")));
					}
					model.addAttribute("stampList", stampList);
					model.addAttribute("contentPage", "view_stamp/admin_stamp_list.jsp");
					model.addAttribute("adminPageTabChk", "stampListTab");
					
				} else if(tabId.equals("imageUpdateTab")){
					
					/*사진 수정*/
					model.addAttribute("contentPage", "view_member/adminpage.jsp");
					model.addAttribute("afterUpdateServer", afterUpdateServer);
					
					model.addAttribute("contentPage", "view_member/admin_event_list.jsp");
					model.addAttribute("adminPageTabChk", "imageUpdateTab");
					
				} else if(tabId.equals("myInfoTab")){
					model.addAttribute("contentPage", "view_member/myInfo.jsp");
					model.addAttribute("adminPageTabChk", "myInfoTab");
				}
				
			}

			return "view_member/index_admin_page";
		}
			
		
	//관리자 행사 검색_리스트 페이지
	@RequestMapping("/member_event_list.do")
	public String adminEventList(Model model,HttpSession session) throws UnsupportedEncodingException{
		Member member = (Member) session.getAttribute("member");
		
		if(member==null||!(member.getMemberType().equals("admin"))){
			model.addAttribute("error", URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
			return "redirect:/seoulnori.do";
		}
		
		model.addAttribute("contentPage", "view_member/admin_event_list.jsp");
		return "view_main/index";
	}

	
	//행사 담당자 페이지 메인
	@RequestMapping("/manager_page.do")
	public String managerpage(Model model, String tabId, HttpSession session) throws UnsupportedEncodingException{
		String userId = (String) session.getAttribute("userId");
		Member member =(Member) session.getAttribute("member");
		System.out.println(userId+member);
		if(member==null||!(member.getMemberType().equals("manager"))){
			model.addAttribute("error",URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
			return "redirect:/seoulnori.do";
		}
		
		/*멤버리스트*/
		Member manager = (Member) memberService.selectEventListByEventManager(userId);
		if( tabId == null ){
			model.addAttribute("manager", manager);
			model.addAttribute("contentPage", "view_member/manager_event_list.jsp");
			model.addAttribute("managerPageTabChk", "eventTab");
		} else {
			
			if(tabId.equals("eventTab") || tabId.equals("")){
				
				model.addAttribute("manager", manager);
				model.addAttribute("contentPage", "view_member/manager_event_list.jsp");
				model.addAttribute("managerPageTabChk", "eventTab");
				
			} else if(tabId.equals("qnaTab")){
				
				/*qna 페이지*/
				String eventId = manager.getEventList().get(0).getEventId();	
				List<Qna> qnaList = qnaService.findQnaListByEventId(eventId);
				model.addAttribute("qnaList", qnaList);
				model.addAttribute("event",manager.getEventList().get(0));
				model.addAttribute("contentPage", "view_member/manager_qna.jsp");
				model.addAttribute("managerPageTabChk", "qnaTab");
					
			} else if(tabId.equals("myInfoTab")){
				model.addAttribute("contentPage", "view_member/myInfo.jsp");
				model.addAttribute("managerPageTabChk", "myInfoTab");
			}
			
		}

		return "view_member/index_manager_page";
		
	}
	
	//마이페이지 이동(비밀번호 체크)
	@ResponseBody
	@RequestMapping("/member_password_check.do")
	public HashMap<String, Object> passwordCheck(String userId, String password){
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(memberService.login(userId, password) != null){
			map.put("status", true);
		//	model.addAttribute("contentPage", "view_member/member_detail.jsp");
		} else{
			map.put("status", false);
		}
		return map;
		
	}
	
	//내가 쓴 후기 보기
	@RequestMapping("/member_review_list.do")
	public String memberReviewList(Model model,HttpSession session) throws UnsupportedEncodingException{
		Member member = (Member) session.getAttribute("member");
		
		if(member==null){
			model.addAttribute("error", URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
			return "redirect:/seoulnori.do";
		}
		
		model.addAttribute("contentPage", "view_member/member_review_list.jsp");
		return "view_main/index";	
	}
	
	// (행사담당자) 나의 행사 조회
	@RequestMapping("/manager_event_list.do")
	public String memberManagerEventList(Model model, HttpSession session) throws UnsupportedEncodingException{
		String userId = (String) session.getAttribute("userId");
		Member member =(Member) session.getAttribute("member");
		
		if(member==null||!(member.getMemberType().equals("manager"))){
			model.addAttribute("error",URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
			return "redirect:/seoulnori.do";
		}
		model.addAttribute("member",member);
		logger.info( memberService.selectEventListByEventManager(userId));
		model.addAttribute("contentPage", "view_member/manager_event_list.jsp");
		return "view_main/index";
	}

	//회원 상태 변경(승인/대기)
	@RequestMapping("/manager_update_memberStatus.do")
	public String memberUpdateMemberStatus(String userId, String memberStatus, 
			Model model, HttpSession session) throws UnsupportedEncodingException{
				
		if(userId==null||userId.trim()==""){
			model.addAttribute("error",URLEncoder.encode("접근권한이 없습니다.\n로그인후 정상적으로 이용해주세요.", "UTF-8"));
			return "redirect:/seoulnori.do";			
		}
		memberService.modifyMemberStatus(userId, memberStatus);
		return "redirect:/admin_page.do?pageNo=1";
	}
	
}