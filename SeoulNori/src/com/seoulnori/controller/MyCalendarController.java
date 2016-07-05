package com.seoulnori.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoulnori.service.MyCalendarService;
import com.seoulnori.vo.Event;
import com.seoulnori.vo.Member;
import com.seoulnori.vo.MyCalendar;

@Controller
public class MyCalendarController {
	
	private MyCalendarService myCalendarService;

	@Autowired
	public void setMyCalendarService(MyCalendarService myCalendarService) {
		this.myCalendarService = myCalendarService;
	}
	
	/** [redirect] 내 캘린더 조회 **/
	@RequestMapping("/my_calendar.do")
	public String moveList(Model model){
		model.addAttribute("contentPage", "view_myCalendar/calendar_list.jsp");
		model.addAttribute("myPageTabChk", "myCalTab");
		return "view_member/index_mypage";
	}
	
	/** [ajax] DB에서 내 캘린더 리스트 가져와 JSONArray로 리턴 **/
	@ResponseBody
	@SuppressWarnings("unchecked")
	@RequestMapping("/get_my_calendar_list.do")
	public JSONArray getList(String userId){
		JSONArray json = new JSONArray();
		List<MyCalendar> myCalendarList =
				myCalendarService.findMyCalendarListByUserId(userId);
		
		for(int i=0; i < myCalendarList.size(); i++){
			for(Event e : myCalendarList.get(i).getEventList()){
				JSONObject obj = new JSONObject();
				obj.put("id", e.getEventId());
				obj.put("title", e.getEventTitle());
				if(myCalendarList.get(i).getCalendarEventDate() != null){
					obj.put("start", myCalendarList.get(i).getCalendarEventDate());
				} else {
					obj.put("start", e.getEventStartDate());
					obj.put("end", e.getEventEndDate());
				}
				obj.put("allDay", true);
				obj.put("url", "http://localhost:8080/Copy_SeoulNori/my_calendar_popup.do");
				
				// 갔다왔어요
				if(myCalendarList.get(i).getCalendarStatus().equals("Y")){
					obj.put("color", "gray");
					
				// 아직이에요
				} else {
					
					// 전시
					if(e.getCategoryNum().equals("A02080500")
							|| e.getCategoryNum().equals("A02080600")
							|| e.getCategoryNum().equals("A02080700")){
						obj.put("color", "slateblue");
					// 축제
					} else if(e.getCategoryNum().equals("A02070100")
									|| e.getCategoryNum().equals("A02070200")){
						obj.put("color", "steelblue");
					// 공연
					} else if(e.getCategoryNum().equals("A02080300")
									|| e.getCategoryNum().equals("A02080200")
									|| e.getCategoryNum().equals("A02081000")){
						obj.put("color", "#ff4a50");
					// 클래식
					} else if(e.getCategoryNum().equals("A02080800")
							|| e.getCategoryNum().equals("A02080400")
							|| e.getCategoryNum().equals("A02080900")){
						obj.put("color", "mediumseagreen");
					// 전통기타
					} else {
						obj.put("color", "lightsalmon");
					}
						
				}
				json.add(obj);
			}
		}
		
		return json;
	}
	
	/** 내 캘린더 추가 **/
	@RequestMapping("/add_my_calendar.do")
	public String addCalendar(String eventId, HttpSession session){
		Member member = (Member) session.getAttribute("member");
		MyCalendar mc = new MyCalendar(member.getUserId(), eventId, "", "N", "");
		boolean flag = myCalendarService.addMyCalendar(mc);
		if(flag){
			return "redirect:/event_detail.do?eventId="+eventId+"&addCalSuccess=Y";
		} else {
			return "redirect:/event_detail.do?eventId="+eventId;
		}
		
	}
	
	/** 내 캘린더 수정 **/
	@RequestMapping("/update_my_calendar.do")
	public String updateCalendar(MyCalendar myCalendar, String headerStatus, Model model){
		myCalendarService.updateMyCalendar(myCalendar);
		model.addAttribute("headerStatus", headerStatus);
		return "redirect:/my_calendar.do";
	}
	
	/** 내 캘린더 삭제 **/
	@RequestMapping("/delete_my_calendar.do")
	public String removeCalendar(String userId, String eventId){
		myCalendarService.removeMyCalendar(userId, eventId);
		return "redirect:/my_calendar.do";
	}
	
	/** [ajax] 내 캘린더 존재하는지 확인 **/
	@ResponseBody
	@RequestMapping("/check_my_calendar.do")
	public HashMap<String, String> checkCalendar(String userId, String eventId, Model model){
		HashMap<String, String> map = new HashMap<String, String>();
		MyCalendar mc = myCalendarService.findMyCalendarByUserIdAndEventId(userId, eventId);
		if(mc != null){
			map.put("status", "T");
		} else {
			map.put("status", "F");
		}
		return map;
	}
	
	/** [ajax] 이벤트 팝업 **/
	@ResponseBody
	@RequestMapping("/popup_my_calendar.do")
	public HashMap<String, String> popupEvent(String userId, String eventId){
		HashMap<String, String> map = new HashMap<String, String>();		
		MyCalendar mc = 
				myCalendarService.findMyCalendarByUserIdAndEventId(userId, eventId);
		Event event = mc.getEventList().get(0);
		
		map.put("eventId", mc.getEventId());
		map.put("eventTitle", event.getEventTitle());
		map.put("eventStartDate", event.getEventStartDate());
		map.put("eventEndDate", event.getEventEndDate());
		map.put("calendarMemo", mc.getCalendarMemo());
		map.put("calendarEventDate", mc.getCalendarEventDate());
		map.put("calendarStatus", mc.getCalendarStatus());
		
		return map;
	}

}
