package com.scse.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scse.entity.Group;
import com.scse.entity.Message;
import com.scse.entity.Notice;
import com.scse.entity.User;
import com.scse.service.GroupService;
import com.scse.service.MessageService;
import com.scse.service.NoticeService;

@Controller("NoticeController")
public class NoticeController {

	private MessageService messageService;
	private NoticeService noticeService;
	private GroupService groupService;

	@Autowired
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	@Autowired
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@Autowired
	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	@RequestMapping("message_send_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> messageSend(String messageTarget,
			String messageWriter, String messageTitle, String messageContent,
			HttpSession session) {

		HashMap<String, Object> map = new HashMap<>();
		Message message = new Message();
		// 내용삽입
		message.setMsContent(messageContent);
		// 제목삽입
		message.setMsTitle(messageTitle);
		User user = (User) session.getAttribute("user");
		// 쓰는 사람 삽입
		message.setMsWriter(user.getUserId());
		// 받는 사람
		message.setMsTarget(messageTarget);
		try {
			if (messageService.addMessage(message)) {
				map.put("status", true);
			} else {
				map.put("status", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping("message_read_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> messageRead(HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		Message message = new Message();
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		message = messageService.viewUnReadMessage(userId);
		if (message == null) {
			map.put("status", false);
		} else {
			map.put("status", true);
			map.put("message", message);
			try {
				messageService.updateMessage(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	@RequestMapping("notice_read_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> noticeRead(HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();

		User user = (User) session.getAttribute("user");

		List<Notice> list = new ArrayList<>();
		try {
			List<Group> glist = groupService.allMyListGroup(user.getUserId());
			for (Group gl : glist) {
				list.addAll(noticeService.viewNotice(gl.getGroupNum()));
			}
			if (list.size() > 0) {
				map.put("status", true);
				map.put("noticeList", list);
			} else {
				map.put("status", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping("notice_send.scse")
	public String noticeSend(HttpSession session, String noticeTitle,
			String noticeContent, int groupNum, String groupName, Model model)
			throws Exception {
		User user = (User) session.getAttribute("user");
		String leaderId = user.getUserId();
		Notice notice = new Notice();
		notice.setGroupNum(groupNum);
		notice.setLeaderId(leaderId);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		noticeService.addNotice(notice);


		model.addAttribute("groupNum", groupNum);
		model.addAttribute("groupName", groupName);
		model.addAttribute("name", groupName);

		String go = "redirect:/my_group_info.scse";

		return go;
	}

	@RequestMapping("notice_update_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> noticeUpdate(String noticeContent,
			String noticeNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int nN = Integer.parseInt(noticeNum);
		Notice notice = new Notice();
		notice.setNoticeNum(nN);
		notice.setNoticeContent(noticeContent);
		noticeService.modifyNotice(noticeContent, nN);
		map.put("status", true);
		return map;
	}

	// 공지사항 관리 페이지로 가기
	@RequestMapping("all_notices_myGroup.scse")
	public String allNoticeInMyGroup(Model model, HttpSession session) {
		try {
			User user = (User) session.getAttribute("user");
			model.addAttribute("list2",
					noticeService.viewTabNotice(user.getUserId()));
			model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
			model.addAttribute("MainFrame", "pages/GroupNotice.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "MainScreenForUpdate";
	}

	@RequestMapping("all_notices_myGroup_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> allNoticesMyGroupAjax(String groupNum) {
		HashMap<String, Object> map = new HashMap<>();
		int gN = Integer.parseInt(groupNum);
		try {
			List<Notice> noticeList = noticeService.viewNotice(gN);
			if (noticeList.size() > 0) {
				map.put("status", true);
				map.put("noticeList", noticeList);
			} else {
				map.put("status", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	// 공지사항 삭제
	@RequestMapping("remove_notice.scse")
	public String remove(Model model, int noticeNum, HttpSession session, String groupNum, String groupName) throws Exception {
		noticeService.removeNotice(noticeNum);
		int gN = Integer.parseInt(groupNum);
		model.addAttribute("name", groupName);
		model.addAttribute("groupNum", gN);
		String go = "redirect:/my_group_info.scse";
		return go;
	}
	
	public String StringUtil (String target){
		String result = null;
		try {
			result = new String(target.getBytes("KSC5601"), "8859_1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
}