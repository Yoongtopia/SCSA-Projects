package com.scsa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.service.KeyService;
import com.scsa.service.NoticeService;
import com.scsa.service.UnivService;
import com.scsa.vo.Univ;
import com.scsa.vo.User;

@Controller
public class UnivController {

	private UnivService univService;
	private KeyService keyService;

	@Autowired
	public void setUnivService(UnivService univService) {
		this.univService = univService;
	}

	@Autowired
	public void setKeyService(KeyService keyService) {
		this.keyService = keyService;
	}

	@RequestMapping("/univ_list.do")
	public String univList(Model model) {
		model.addAttribute("univList", univService.findUnivList());
		model.addAttribute("page", "/user/signup.jsp");
		return "index";
	}

	@RequestMapping("/univ_list_by_square.do")
	@ResponseBody
	public List<Univ> univList(int square_num, Model model) {
		return univService.findUnivListBySquareNum(square_num);
	}

	@RequestMapping("/key_create.do")
	@ResponseBody
	public HashMap<String, Object> emailKey(HttpSession httpSession,
			String univ_email, Model model) throws MessagingException {
		// 키 생성 일단은 무조건 1234;
		String key = "1234";

		HashMap<String, Object> map = new HashMap<>();
		String user_id = ((User) httpSession.getAttribute("user")).getUser_id();
		String url = "192.168.0.111:9090/gommelier/key_certificate.do?user_id="
				+ user_id + "&ckey=" + key;
		String receiver = univ_email;
		// 메일발송
		
		final String username = "pureugong@gmail.com";
		final String password = "jo-dbsgh1";
		Properties props = new Properties();

		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("pureugong@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(receiver));
			message.setSubject("Gommelier Certification Key");
			message.setText("요청하신 인증키는" + key + " 입니다. <br>" + url);

			Transport.send(message);

		} catch (Exception e) {
			throw new RuntimeException();
		}

		if (keyService.keyCreate(user_id, key)) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		return map;
	}

	@RequestMapping("/key_certificate.do")
	@ResponseBody
	public HashMap<String, Object> certificateKey(String user_id,
			HttpSession httpSession, String certificate_code, Model model) {
		HashMap<String, Object> map = new HashMap<>();
		User user = ((User) httpSession.getAttribute("user"));
		
		if (user != null) {
			user_id = user.getUser_id();
		}

		// 키 비교
		if (keyService.certification(user_id, certificate_code)) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		return map;
	}

	@RequestMapping("/find_univ_name.do")
	@ResponseBody
	public HashMap<String, Object> findUnivName(String univ_code) {

		HashMap<String, Object> map = new HashMap<>();

		Univ userUniv = univService.findUnivByUnivCode(univ_code);
		String univName = userUniv.getUniv_name();
		String univImg = userUniv.getUniv_img();

		if (userUniv != null) {
			map.put("status", true);
			map.put("userUniv", userUniv);
		} else {
			map.put("status", false);
		}

		return map;
	}
	@RequestMapping("find_square_num.do")
	@ResponseBody
	public int findUnivSquareByName(String univ_name){
		int square_num = univService.findSquareNumByUniv(univ_name);
		if (square_num != 0) {
			return square_num;
		} else {
			return 0;
		}
	}
	@RequestMapping("autocomplete_univ.do")
	@ResponseBody
	public ArrayList<String> autocompleteUnivName(){
		
		ArrayList<String> list = new ArrayList<>();
		List<Univ> firstList = univService.findUnivList();
		for (Univ univ : firstList) {
			list.add(univ.getUniv_name());
		}
		
		return list;
	}
}
	