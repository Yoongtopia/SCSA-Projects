package com.scsa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scsa.service.NoticeService;
import com.scsa.util.AdvancedPageUtility;
import com.scsa.vo.Notice;
import com.scsa.vo.User;

@Controller
public class NoticeController {


	private NoticeService noticeService;

	@Autowired
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@RequestMapping("/notice_list.do")
	public String noticeList(Model model, String pageNo) throws Exception {
		String cPage = pageNo;
		
		int page=1;
		
		try{
			page = Integer.parseInt(cPage);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		final int perPage = 10;
		int start_num = (page-1)*perPage + 1;
		int end_num = page*perPage;
		
		AdvancedPageUtility pageUtil = new AdvancedPageUtility(perPage, noticeService.listCount(), page, "images/");
		
		List<Notice> noticeList = noticeService.findNoticeListByPage(start_num, end_num);
		model.addAttribute("count", noticeService.listCount());
		model.addAttribute("noticeList", noticeService.findNoticeListByPage(start_num, end_num));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("perPage", perPage);
		model.addAttribute("pageLink", pageUtil.getPageBar());
		model.addAttribute("page", "/notice/notice.jsp");
		return "index";
	}

	@RequestMapping("/notice_detail_by_num.do")
	public String noticeView(int notice_num, Model model) {
		model.addAttribute("notice", noticeService.findNoticeByNum(notice_num));
		model.addAttribute("page", "/notice/view_notice.jsp");
		return "index";
	}

	@RequestMapping("/move_notice_modify_form.do")
	public String moveNoticeModifyForm(int notice_num, Model model) {
		Notice notice = noticeService.findNoticeByNum(notice_num);
		model.addAttribute("notice", notice);
		model.addAttribute("page", "/notice/write_notice.jsp");
		return "index";
	}

	@RequestMapping("/move_notice_register_form.do")
	public String moveNoticeAddForm(Model model) {
		model.addAttribute("page", "/notice/write_notice.jsp");
		return "index";
	}

	@RequestMapping("/notice_modify.do")
	public String modifyNotice(String notice_num, String notice_title,
			String notice_content, Model model) {
		int noticeNum = Integer.parseInt(notice_num);
		Notice notice = noticeService.findNoticeByNum(noticeNum);
		noticeService.noticeModifyByNum(noticeNum, notice_title, notice_content);
		return "redirect:/notice_list.do";
	}
	
	@RequestMapping("/notice_register.do")
	public String addNotice(String notice_title,
			String notice_content, Model model, HttpSession session){
		User user = (User)session.getAttribute("user");
		Notice notice = new Notice();
		notice.setNotice_title(notice_title);
		notice.setNotice_content(notice_content);
		notice.setUser_id(user.getUser_id());
		noticeService.noticeCreate(notice);
		return "redirect:/notice_list.do?pageNo=1";
	}
	
	@RequestMapping("/notice_remove.do")
	public String deleteNotice(int[] notice_num){
		for(int num : notice_num){
			noticeService.noticeRemoveByNum(num);
		}
		
		return "redirect:/notice_list.do";
	}
	
	
}
