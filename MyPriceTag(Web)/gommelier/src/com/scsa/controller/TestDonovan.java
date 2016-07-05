package com.scsa.controller;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.scsa.service.MsgService;
import com.scsa.vo.Msg;

public class TestDonovan {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context
		=new ClassPathXmlApplicationContext("beans.xml");
		
		MsgService bean =(MsgService)context.getBean("Msg",MsgService.class);
				
		/*Wish wish = new Wish();
		
		wish.setUser_id("bob");
		wish.setProduct_num(48);
		
		
		
		Msg msg = new Msg();
		
		
		msg.setMsg_content("¤»¤»");
		msg.setUser_id_sender("dongwon");
		msg.setUser_id_receiver("donovan");
		/*cmt.setParent_num(null);*/
		
		
		/*user.setUser_id("donovan");
		user.setUser_password("donovan");
		user.setUser_name("±èµ¿¿ø´Ô");
		user.setUser_email("donovan@naver.com");
		user.setUniv_code("41");
		user.setUniv_img("snu.png");
		user.setUser_phone("010-7176-7777");*/
		
		/*msg.setMsg_content("¹Þ¾Æ¶ó");
		
		msg.setUser_id_receiver("dongwon");*/
		
	}

}
