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
		sender = new Sender("AIzaSyBwkLDUhb2iQG2T1pdwpYeo4kzuLlTHOE4");							//Ǫ�� ������ ��ü ����
		Message.Builder builder = new Message.Builder();	//Ǫ�� �޽��� ����� ��ü
	
		Map<String, String[]> map = request.getParameterMap();	//�Ķ���� ���� �޾ƿ�
		Iterator<String> iterator = map.keySet().iterator();				//���� ��� Ű�� �޾ƿ�
		while(iterator.hasNext()) {
			String key = iterator.next();									//�Ķ������ Ű
			String values[] = map.get(key);								//�Ķ���� ��
			String value = "";												//Ǫ�� ������ ��
			if(values != null) {
				for(String v : values)
					value += v+",";											//�迭�� a,b,c,d ������ ���ڿ��� ����
				value = value.substring(0, value.length()-1);
			}
			
			builder.addData(key, value);									//Ǫ�� �޽����� ������ �߰�
		}
		
		msg = builder.build();												//Ǫ�� �޽��� ����
		try {
			Result result = sender.send(msg, regId, 5);					//Ǫ�� ����
			String error = result.getErrorCodeName();					//�����ڵ�
			String msgId = result.getMessageId();						//Ǫ�� �޽��� id
			
			request.setAttribute("error", error);							//�����޽��� ����
			request.setAttribute("msgId", msgId);						//Ǫ�� �޽��� id ����
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("push_msg", "�޽��� ����");
		return "test_bob";
	}
	
/*	@RequestMapping("get_regId.do")
	public void getRegId(HttpServletRequest request, HttpSession session){
	}*/
}


