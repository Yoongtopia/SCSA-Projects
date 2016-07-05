package com.scsa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.service.PushService;
import com.scsa.vo.Product;
import com.scsa.vo.Push;
import com.scsa.vo.PushTag;
import com.scsa.vo.Tag;
import com.scsa.vo.User;
import com.sun.org.apache.xpath.internal.compiler.PsuedoNames;

@Controller("pushController")
public class PushController {

	private PushService pushService;

	@Autowired
	public void setPushService(PushService pushService) {
		this.pushService = pushService;
	}

	@RequestMapping("push_list_by_id.do")
	public String pushListById(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();


		List<Push> pushListById = pushService.pushListById(user_id);
		model.addAttribute("pushListById", pushListById);
		model.addAttribute("page", "my_info/pushlist.jsp");
		return "index";
	}

	@RequestMapping("push_status_change.do")
	@ResponseBody
	public HashMap<String, Object> pushStatusChange(int push_num,
			int push_status) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		pushService.pushStatusModify(push_num, push_status);
		pushService.pushCheck(1, 0, push_num);
		if (pushService.pushStatusModify(push_num, push_status)) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		return map;
	}

	@RequestMapping("push_remove_by_num.do")
	public String pushRemoveByNum(int[] push_num, HttpSession session,
			Model model) {

		if (push_num.length > 0) {

			for (int push_num2 : push_num) {
				pushService.pushRemoveByNum(push_num2);
			}
		}
		return "redirect: push_list_by_id.do";
	}

	@RequestMapping("push_detail.do")
	public String pushDetail(int push_num, Model model) {

		Push pushDetail = pushService.pushDetailByNum(push_num);
		// 기본 세팅위함
		ArrayList<String> tag = new ArrayList<>();
		for (PushTag t : pushDetail.getPushTagList()) {
			tag.add(t.getPush_tag());
		}
		model.addAttribute("tag", tag);
		// 태그 배열로 던져져야지 스크립트에서 받아서 처리함

		model.addAttribute("pushDetail", pushDetail);
		model.addAttribute("page", "/match/match.jsp");
		return "index";

	}

	@RequestMapping("push_regist.do")
	public String pushRegist(int product_price, int square_num, String match_tag, String tag,
			HttpSession httpSession, Model model) {
	
		// 뉴~
		Push push = new Push();
		// 아이디~
		push.setUser_id(((User) httpSession.getAttribute("user")).getUser_id());
		// 가격~
		push.setPush_price(product_price);
		// 스퀘어~
		push.setPush_square(square_num);
		// 태그리스트 추가~
		ArrayList<PushTag> pushTagList = new ArrayList<>();
			
		if (match_tag != null) {
			tag = match_tag;
		}
		String[] tempPushes = ProductController.changeStringtoArray(tag);
		for (String string : tempPushes) {
			PushTag pushTag = new PushTag();
			pushTag.setPush_tag(string);
			pushTagList.add(pushTag);
		}
		push.setPushTagList(pushTagList);
		// 크리에이트!!!

		pushService.pushCreate(push);
		return "redirect: push_list_by_id.do";
	}

	@RequestMapping("push_update.do")
	public String push_update(int push_num, String match_tag, int square_num, int product_price,
			Model model) {
		String[] push_tag = ProductController.changeStringtoArray(match_tag);

/*		boolean result = pushService.pushModifyByNum(push_num, product_price, square_num, push_tag);
		System.out.println(result + " <<<< result");*/
		return  "redirect: push_list_by_id.do ";

	}

}// end
