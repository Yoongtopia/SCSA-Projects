package com.seoulnori.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.seoulnori.vo.MyCalendar;

public interface MyCalendarService {
	
	boolean addMyCalendar(MyCalendar myCalendar);
	boolean updateMyCalendar(MyCalendar myCalendar);
	boolean removeMyCalendar(String userId, String eventId);
	MyCalendar findMyCalendarByUserIdAndEventId(String userId, String eventId);
	List<MyCalendar> findMyCalendarListByDate(String userId, String calendarEventDate);
	List<MyCalendar> findMyCalendarListByUserId(String userId);
	int findMyCalendarCountByEventId(String eventId);
	
}
