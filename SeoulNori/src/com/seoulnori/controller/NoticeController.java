package com.seoulnori.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.seoulnori.service.NoticeService;
import com.seoulnori.util.AdvancedPageUtility;
import com.seoulnori.vo.Member;
import com.seoulnori.vo.Notice;


@Controller
public class NoticeController {
	private Logger logger =Logger.getLogger(NoticeController.class);

	private NoticeService noticeService;

	@Autowired
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	
	//공지사항 등록 후 목록으로 이동
	@RequestMapping("/notice_add.do")
	public String addNotice(String noticeTitle,String noticeContent, MultipartFile noticeImage, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException{		
		Member member=(Member) session.getAttribute("member");
		String userId = member.getUserId();
		String imageName="";
		if(noticeImage.getOriginalFilename()!=null&&noticeImage.getOriginalFilename().trim()!=""){
			imageName=noticeImage.getOriginalFilename();
			String saveDir = request.getServletContext().getRealPath("/images/notice");
			noticeImage.transferTo(new File(saveDir+"/"+noticeImage.getOriginalFilename()));
		}		
		noticeService.addNotice(new Notice(0,imageName, noticeTitle,noticeContent,userId));

		return "redirect:/notice_list.do";
	}	
	
	//공지사항 수정하는 화면 만들기
	@RequestMapping("/notice_update_form.do")
	public String noticeUpdateForm(int noticeNum, Model model){
		Notice notice = noticeService.findNoticeByNoticeNum(noticeNum);
		logger.info("notice_update_form: "+notice);
		model.addAttribute("notice", notice);
		model.addAttribute("contentPage", "/view_notice/update.jsp");
		return "view_main/index";
	}
	
	//공지사항 수정 후 목록으로 이동
	@RequestMapping("/notice_update.do")
	public String updateNotice(int noticeNum, MultipartFile noticeImage,  String noticeTitle, String noticeContent , HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException{

		if(noticeImage.getOriginalFilename()==null||noticeImage.getOriginalFilename().trim()==""){
			String image = noticeService.findNoticeByNoticeNum(noticeNum).getNoticeImage();		
			noticeService.updateNotice(new Notice(noticeNum,image,noticeTitle,noticeContent ));
			return "redirect:/notice_list.do";
		}
		
		noticeService.updateNotice(new Notice(noticeNum,noticeImage.getOriginalFilename(),noticeTitle,noticeContent ));
		String saveDir = request.getServletContext().getRealPath("/images/notice");
		noticeImage.transferTo(new File(saveDir+"/"+noticeImage.getOriginalFilename()));

		return "redirect:/notice_list.do";
	}
	
	//공지사항 삭제 후 목록으로 이동
	@RequestMapping("/notice_remove.do")
	public String removeNotice(int noticeNum){
		logger.info("notice_remove: noticeNum="+noticeNum);
		noticeService.removeNotice(noticeNum);
		return "redirect:/notice_list.do";	
	}
	
	//공지사항 리스트를 보여주는 화면 만들기
	@RequestMapping("/notice_list.do")
	public String noticeList(Model model, String pageNo) throws Exception{
	
		String cPage = pageNo;
		int page = 1;
		
		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
				
		final int perPage = 10;
		int startNo = (page-1)*perPage + 1;
		int endNo = page*perPage;
		
		//PageUtility pageUtil = new PageUtility(perPage, productDao.listCount(), page);
		AdvancedPageUtility pageUtil = 
				new AdvancedPageUtility(perPage, noticeService.findPageCount(), page, "images/");
		
		List<Notice> noticeList = noticeService.findNoticeListWithPage(startNo, endNo);
		logger.info("notice_list: noticeList.size()="+noticeList.size());
		model.addAttribute("count", noticeService.findPageCount());
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("perPage", perPage);
		model.addAttribute("pageLink", pageUtil.getPageBar());
		model.addAttribute("contentPage", "/view_notice/list.jsp");
		return "view_main/index";
		
	}
	
	@RequestMapping("/notice_add_form.do")
	public String addForm(Model model){

		model.addAttribute("contentPage", "/view_notice/add.jsp");
		return "view_main/index";
	}
	
	//공지사항 상세정보를 보여주는 화면 만들기
	@RequestMapping("/notice_detail.do")
	public String noticeDetail(int noticeNum, Model model){
		Notice notice = noticeService.findNoticeByNoticeNum(noticeNum);
		logger.info("notice_detail: "+notice);
		model.addAttribute("notice", notice);
		model.addAttribute("contentPage", "/view_notice/detail.jsp");
		return "view_main/index";
	}
	

	@RequestMapping("/notice_search.do")
	public String searchNoticeByTitle(String noticeTitle, Model model){
		List<Notice> noticeList = noticeService.searchNoticeByTitle(noticeTitle);
		logger.info("notice_search: searchResult.size()="+noticeList.size());

		 model.addAttribute("noticeList", noticeList);
		 model.addAttribute("contentPage", "/view_notice/list.jsp");
		return "view_main/index";
	}
		
	
}
