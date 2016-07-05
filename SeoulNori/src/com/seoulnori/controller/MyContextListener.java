package com.seoulnori.controller;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.seoulnori.service.EventService;

public class MyContextListener implements ServletContextListener {

	EventService eventService = null;
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext servletContext = event.getServletContext();
		System.out.println("*********ServletContextListener started*********");
		eventService = WebApplicationContextUtils.getWebApplicationContext(servletContext).getBean("eventService", EventService.class);
		
		int repeatTime = 1000*60*60*24*7;//매 1주일.
		int repeatTime2 = 1000*60*60*24;//매 1일.
		Timer timer1 = new Timer();
		Timer timer2= new Timer();

		
		timer1.scheduleAtFixedRate(new TimerTask(){
		public void run(){
			
			/*eventService.insertParsingEvent("1");//서울지역 행사파싱
			System.out.println("======================서울파싱끝====================");
			eventService.insertParsingEvent("2");//인천지역 행사 파싱
			System.out.println("======================인천파싱끝====================");
			eventService.insertParsingEvent("31");//경기지역 행사 파싱
			System.out.println("======================경기파싱끝====================");*/
			
			
			}//End of Run
		},30000, repeatTime);//서버시작 30초 후부터 매 1주일 마다.
		servletContext.setAttribute ("timer", timer1);
		
		
		
		timer2.scheduleAtFixedRate(new TimerTask(){
			public void run(){

				/*boolean flag=eventService.naverTrendPointAndTweetPoint();				
				if(flag){
					System.out.println("=================네이버 트렌드포인트와 트윗 포인트 업뎃성공================");
				}else{
					System.out.println("=================네이버 트렌드포인트와 트윗 포인트 업뎃실패================");
				}		
				eventService.updateIssuePoint();//상기의 트렌드포인트와 트윗포인트를 이용한 이슈포인트 업뎃 메소드
*/			}//End of Run
		},50000,repeatTime2);//서버시작 50초후부터 매 1일마다.
		servletContext.setAttribute ("timer2", timer2);

		
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
		ServletContext servletContext = event.getServletContext();
		// get our timer from the Context
		Timer timer1 = (Timer)servletContext.getAttribute ("timer1");
		Timer timer2 = (Timer)servletContext.getAttribute ("timer2");

		// cancel all pending tasks in the timers queue
		if (timer1 != null)
		timer1.cancel();
		if (timer2 != null)
			timer2.cancel();

		// remove the timer from the servlet context
		servletContext.removeAttribute ("timer");
		servletContext.removeAttribute ("timer2");
		System.out.println("ServletContextListener destroyed");
	}

}
