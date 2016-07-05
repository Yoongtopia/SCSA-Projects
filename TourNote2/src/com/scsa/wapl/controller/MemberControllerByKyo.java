package com.scsa.wapl.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.scsa.wapl.entity.Member;
import com.scsa.wapl.service.MemberService;

@Controller
@SessionAttributes
public class MemberControllerByKyo {

	private Logger logger = Logger.getLogger(MemberControllerByKyo.class);

	private MemberService memberService;

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	//ȸ�� ����
	@RequestMapping("/regist.do")
	public String regist(Member member, Model model) {
		memberService.createMember(member);
		return "index.jsp";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm(Model model) {
		model.addAttribute("contentPage", "login.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("/loginForm2.do")
	public String loginForm2() {
		return "app_login.jsp";
	}

	@RequestMapping("/login.do")
	private void user_login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		
		/*if(memberId=="" || memberId==null){
			request.setAttribute("errorMessage", "���̵� �Է��� �ּ���.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		
		if(password=="" || password ==null){
			request.setAttribute("errorMessage", "�н����带 �Է��� �ּ���.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}*/
		
		Member member = memberService.login(memberId, password);
			if (member != null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				response.sendRedirect("main.do");
			} else {
				request.setAttribute("errorMessage", "�α��ο� �����߽��ϴ�. ���̵�� ��й�ȣ�� Ȯ���ϼ���.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
	}	
		
	@RequestMapping("/login3.do")
	private void user_login3(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		Member member = memberService.login(memberId, password);
			if (member != null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				response.sendRedirect("main3.do");
			} else {
				request.setAttribute("errorMessage", "�α��ο� �����߽��ϴ�. ���̵�� ��й�ȣ�� Ȯ���ϼ���.");
				request.getRequestDispatcher("app_login.jsp").forward(request, response);
			}
	}	
	
	// logout controller
	@RequestMapping("/logout.do")
	private void user_logout(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		response.sendRedirect("main.do");
		return;
	}
	
	@RequestMapping("/logout2.do")
	private void user_logout2(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		response.sendRedirect("main3.do");
		return;
	}
		
	//������������ �̵�
	@RequestMapping("/goMyPage.do")
	public String goMyPage(Model model){
		model.addAttribute("contentPage", "myPage.jsp");
		return "index.jsp";
	}
	
	//���� ������������ �̵�
	@RequestMapping("/goMyPage2.do")
	public String goMyPage2(Model model){
		model.addAttribute("contentPage", "app_myPage.jsp");
		return "app_index.jsp";
	}
	
	//ȸ������ �������� �̵�
	@RequestMapping("/join.do")
	public String join(Model model){
		model.addAttribute("contentPage", "join.jsp");
		return "index.jsp";
	}


	//ȸ������ ���� �������� �̵�
	@RequestMapping("/goMyInfoUpdate.do")
	public String goMyInfoUpdate(Model model, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		System.out.println(member);
		model.addAttribute("member", member);
		model.addAttribute("contentPage", "myInfoUpdate.jsp");
		return "index.jsp";
	}
	
	//������ ȸ������ ����
	@RequestMapping("/goMyInfoUpdate2.do")
	public String goMyInfoUpdate2(Model model, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		System.out.println(member);
		model.addAttribute("member", member);
		model.addAttribute("contentPage", "app_myInfoUpdate.jsp");
		return "app_index.jsp";
	}
	
	//ȸ������ ����
	@RequestMapping("/updateMember.do")
	public String update(Member member, Model model, HttpSession session) {
		memberService.modifyMember(member);
		Member modifiredMember=memberService.findMember(member.getMemberId());
		session.setAttribute("member", modifiredMember);
		model.addAttribute("contentPage", "myPage.jsp");
		
		return "/index.jsp";
	}
	
	//���� ȸ������ ����
	@RequestMapping("/updateMember2.do")
	public String update2(Member member, Model model, HttpSession session) {
		memberService.modifyMember(member);
		Member modifiredMember=memberService.findMember(member.getMemberId());
		session.setAttribute("member", modifiredMember);
		model.addAttribute("contentPage", "app_myPage.jsp");
		
		return "app_index.jsp";
	}

	//ȸ�� Ż�� �� Ȯ�� ������
	@RequestMapping("/checkMemberStatusUpdate.do")
	public String checkMemberStatusUpdate(Model model){
		model.addAttribute("contentPage", "memberOut.jsp");
		return "index.jsp";
	}
	
	//���� ȸ�� Ż�� �� Ȯ�� ������
	@RequestMapping("/checkMemberStatusUpdate2.do")
	public String checkMemberStatusUpdate2(Model model){
		model.addAttribute("contentPage", "app_memberOut.jsp");
		return "app_index.jsp";
	}
	
	//ȸ�� Ż��: ���¸� Ż��� ����
	@RequestMapping("/updateMemberStatus.do")
	public String updateStatus(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		String memberId= member.getMemberId();
		memberService.modifyMemberStatus(memberId);
		session.invalidate();
		return "index.jsp";
	}
	
	//���� ȸ�� Ż��: ���¸� Ż��� ����
	@RequestMapping("/updateMemberStatus2.do")
	public String updateStatus2(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		String memberId= member.getMemberId();
		memberService.modifyMemberStatus(memberId);
		session.invalidate();
		return "app_index.jsp";
	}

	//��� �� ��������
	@RequestMapping("/memberDetail.do")
	public String memberDetail(String memberId, Model model) {
		Member member = memberService.findMember(memberId);
		model.addAttribute("member", member);
		model.addAttribute("contentPage", "memberDetail.jsp");
		return "index.jsp";
	}

	//��� ����Ʈ ��ȸ
	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
		List<Member> memberList = memberService.findMemberLsit();
		model.addAttribute("memberList", memberList);
		model.addAttribute("contentPage", "memberList.jsp");
		return "index.jsp";
	}

	//���º�(����, Ż��) ��ȸ
	@RequestMapping("/memberListByStatus.do")
	public String memberLsitByStatus(String status, Model model) {
		List<Member> memberList = memberService.findMemberLsitByStatus(status);
		model.addAttribute("memberList", memberList);
		model.addAttribute("contentPage", "memberList.jsp");
		return "index.jsp";
	}
	
	//ȸ�� ���Խ� ���̵� �ߺ� üũ
	@ResponseBody
	@RequestMapping("/idCheck.do")
	public HashMap<String, Object> idCheck(String memberId, Model model){
		String memberIdResult = memberService.findMemberId(memberId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (memberIdResult != null) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		return map;
	}
	
	//ȸ�� ���Խ� �̸��� �ߺ� üũ
	@ResponseBody
	@RequestMapping("/emailCheck.do")
	public HashMap<String, Object> emailCheck(String memberEmail, Model model){
		String memberEmailResult = memberService.findMemberEmail(memberEmail);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (memberEmailResult != null) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		return map;
	}
	
	//�Ŵ��� �������� �̵�
	@RequestMapping("/goManagerPage.do")
	public String goManagerPage (Model model){
		model.addAttribute("contentPage", "managerPage.jsp");
		return "index.jsp";
	}
	
	//ȸ�� ��� ���� �� ���� �������� �̵�(������ ����)
	@RequestMapping("/memberModifyPageByAdmin.do")
	public String memberModifyByAdmin(String memberId, Model model){
		Member member = memberService.findMember(memberId);
		model.addAttribute("member", member);
		model.addAttribute("contentPage", "memberDetailForAdmin.jsp");
		return "index.jsp";
	}
	
	//ȸ�� ��� ����
	@RequestMapping("/memberModifyByadmin.do")
	public String memberModifyByAdmin(Member member, Model model){
		memberService.modifyMember(member);
		return "memberList.do";
	}
	
	//ȸ�� ���� ����
	@RequestMapping("/memberDelete.do")
	public String memberDelete(String memberId, Model model){
		memberService.removeMember(memberId);
		return "memberList.do";
	}

}