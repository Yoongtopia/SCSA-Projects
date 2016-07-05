package com.seoulnori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.seoulnori.vo.MyCalendar;


public interface MyCalendarDAO {
	
	boolean insertMyCalendar(MyCalendar myCalendar);
	boolean updateMyCalendar(MyCalendar myCalendar);
	boolean deleteMyCalendar(String userId, String eventId);
	MyCalendar selectMyCalendarByUserIdAndEventId(String userId, String eventId);
	List<MyCalendar> selectMyCalendarListByDate(String userId, String calendarEventDate);
	List<MyCalendar> selectMyCalendarListByUserId(String userId);
	int selectMyCalendarCountByEventId(String eventId);

}
