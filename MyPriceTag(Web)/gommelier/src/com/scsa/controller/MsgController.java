package com.scsa.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.service.MsgService;
import com.scsa.util.AdvancedPageUtility;
import com.scsa.vo.Msg;
import com.scsa.vo.User;

@Controller
public class MsgController {

	private MsgService msgService;

	@Autowired
	public void setMsgService(MsgService msgService) {
		this.msgService = msgService;
	}

	@RequestMapping("/msg_list_by_receiver_id.do")
	public String msgList(HttpSession session, Model model, String pageNo) throws Exception {
		
		String cPage = pageNo;
		int page=1;
		
		try{
			page = Integer.parseInt(cPage);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		final int perPage = 5;
		int start_num = (page-1)*perPage + 1;
		int end_num = page*perPage;
		String user_id = ((User) session.getAttribute("user")).getUser_id();
		AdvancedPageUtility pageUtil = new AdvancedPageUtility(perPage, msgService.ReceiveMsgCount(user_id), page, "images/");
		
		List<Msg> msgList = msgService.findReceiveMsgWithPage(user_id, start_num, end_num);
		model.addAttribute("count", msgService.ReceiveMsgCount(user_id));
		model.addAttribute("msgList", msgService.findReceiveMsgWithPage(user_id, start_num, end_num));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("perPage", perPage);
		model.addAttribute("pageLink", pageUtil.getPageBar());
		model.addAttribute("page", "/my_info/msg_box.jsp");
		model.addAttribute("chk", "rc");
		return "index";
	}

	@RequestMapping("/msg_list_by_sender_id.do")
	public String sendMsgList(HttpSession session, Model model, String pageNo) throws Exception {
		
		String cPage = pageNo;
		int page=1;
		
		try{
			page = Integer.parseInt(cPage);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		final int perPage = 5;
		int start_num = (page-1)*perPage + 1;
		int end_num = page*perPage;
		String user_id = ((User) session.getAttribute("user"))
				.getUser_id();
		AdvancedPageUtility pageUtil = new AdvancedPageUtility(perPage, msgService.SendMsgCount(user_id), page, "images/");
		
		List<Msg> msgList = msgService.findSendMsgWithPage(user_id, start_num, end_num);
		model.addAttribute("count", msgService.SendMsgCount(user_id));
		model.addAttribute("msgList", msgService.findSendMsgWithPage(user_id, start_num, end_num));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("perPage", perPage);
		model.addAttribute("pageLink", pageUtil.getPageBar());
		model.addAttribute("page", "/my_info/msg_box.jsp");
		model.addAttribute("chk", "sd");
		return "index";
	}

	@ResponseBody
	@RequestMapping("send_buying_msg.do")
	public HashMap<String, Object> sendBuyingMsg(HttpSession session,
			String user_id, String product_num) {
		boolean flag;
		HashMap<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("user");
		String user_id_sender = user.getUser_id();
		String user_id_receiver = user_id;
		String msg_content = user_id_sender + "님이 구매요청하였습니다. 상품번호:"
				+ product_num;

		Msg msg = new Msg(msg_content, user_id_sender, user_id_receiver);
		flag = msgService.msgSend(msg);

		if (flag) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}

		return map;
	}
	
	
	//메시지 보내기 
	@ResponseBody
	@RequestMapping("send_msg_modal.do")
	public HashMap<String, Object> sendMsgModal(HttpSession session,
			String receiver, String msg_content) {
		boolean flag;
		HashMap<String, Object> map = new HashMap<>();
		String sender = ((User) session.getAttribute("user")).getUser_id();
		Msg msg = new Msg(msg_content, sender, receiver);
		flag = msgService.msgSend(msg);
		
		if (flag) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}

		return map;
	}

	@RequestMapping("send_msg_page.do")
	public String sendMsgPage(String user_id, Model model) {
		model.addAttribute("receiver", user_id);
		return "my_info/send_msg";
	}
	
	// 보낸쪽지 디테일
	@RequestMapping("msg_detail.do")
	public String msgDetail(int msg_num, Model model) {
		List<Msg> msgList = msgService.msgDetailByNum(msg_num);
		model.addAttribute("msg", msgList.get(0));
		return "my_info/msg";
	}

	//받은 쪽지 읽으면 상태 바꿈
	@RequestMapping("msg_detail_by_receiver.do")
	public String msgDetailByReceiver(int msg_num, Model model) {
		List<Msg> msgList = msgService.msgDetailByNum(msg_num);

		msgService.msgReceiverStatusUpdate(msg_num);
		// 리스트가 날라와서...좀 수정해야할듯...
		model.addAttribute("msg", msgList.get(0));
		return "my_info/msg";
	}

	@RequestMapping("msg_receiver_remove_by_num.do")
	public String msgReceiverRemoveByNum(int[] msg_num) {
		for (int n : msg_num) {
			msgService.msgReceiverRemoveByNum(n);
		}
		return "redirect: msg_list_by_receiver_id.do";
	}

	@RequestMapping("msg_sender_remove_by_num.do")
	public String msgSenderRemoveByNum(int[] msg_num) {

		for (int n : msg_num) {
			msgService.msgSenderRemoveByNum(n);
		}
		return "redirect: msg_list_by_sender_id.do";
	}

	// 유저 아이디 전부다 return해주는 매서드 자동완성 위함
	@ResponseBody
	@RequestMapping("get_user_ids.do")
	public String[] getUserIds(HttpSession session, Model model) {
		String[] userIds = { "charles", "tom", "bob" };
		return userIds;
	}


	// 로그인 후 1초에 하번씩 콜
	@RequestMapping("msg_checking.do")
	@ResponseBody
	public HashMap<String, Object> msgChecking(HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		Msg msg =  msgService.msgChk(user.getUser_id());
		
		if (msg != null) {
			map.put("status", true);
			map.put("msg", msg);
		}else{
			map.put("status", false);
		}
		return map;

	}
	
}
