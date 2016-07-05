package com.scsa.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

@Controller
public class TestBob3 {
	private Sender sender;
	private Message msg;
	private String regId = "APA91bGVshyqhKVEq957I_kLx0SB6C9DOQKC1l0-Ec64cwWSJ0FAotXA5sSjQJ9djGIVJOF18mAscIkndyWpIqnB3BkcfS3owrpQUWw0PhPZsiT6WYka15Gx1etwckOPFPlvCdBoZ41LPQaRw226T3vtahjdYB0PXw";
	
	@RequestMapping("push_msg_send.do")
	public String pushMsgSend(HttpServletRequest request, HttpServletResponse response, Model model) {
		sender = new Sender("AIzaSyBwkLDUhb2iQG2T1pdwpYeo4kzuLlTHOE4");							//푸시 보내는 객체 생성
		Message.Builder builder = new Message.Builder();	//푸시 메시지 만드는 객체
	
		Map<String, String[]> map = request.getParameterMap();	//파라미터 맵을 받아옴
		Iterator<String> iterator = map.keySet().iterator();				//맵의 모든 키를 받아옴
		while(iterator.hasNext()) {
			String key = iterator.next();									//파라미터의 키
			String values[] = map.get(key);								//파라미터 값
			String value = "";												//푸시 데이터 값
			if(values != null) {
				for(String v : values)
					value += v+",";											//배열을 a,b,c,d 형태의 문자열로 만듬
				value = value.substring(0, value.length()-1);
			}
			
			builder.addData(key, value);									//푸시 메시지에 데이터 추가
		}
		
		msg = builder.build();												//푸시 메시지 생성
		try {
			Result result = sender.send(msg, regId, 5);					//푸시 전송
			String error = result.getErrorCodeName();					//에러코드
			String msgId = result.getMessageId();						//푸시 메시지 id
			
			request.setAttribute("error", error);							//에러메시지 저장
			request.setAttribute("msgId", msgId);						//푸시 메시지 id 저장
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("push_msg", "메시지 보냄");
		return "test_bob";
	}
	
/*	@RequestMapping("get_regId.do")
	public void getRegId(HttpServletRequest request, HttpSession session){
	}*/
}


