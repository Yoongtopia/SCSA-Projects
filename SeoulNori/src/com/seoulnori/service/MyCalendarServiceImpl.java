package com.seoulnori.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seoulnori.dao.MyCalendarDAO;
import com.seoulnori.vo.MyCalendar;

@Service("myCalendarService")
public class MyCalendarServiceImpl implements MyCalendarService {
	
	private MyCalendarDAO myCalendarDAO;
	
	@Autowired
	public void setMyCalendarDAO(MyCalendarDAO myCalendarDAO) {
		this.myCalendarDAO = myCalendarDAO;
	}

	@Override
	public boolean addMyCalendar(MyCalendar myCalendar) {
		return myCalendarDAO.insertMyCalendar(myCalendar);
	}

	@Override
	public boolean updateMyCalendar(MyCalendar myCalendar) {
		return myCalendarDAO.updateMyCalendar(myCalendar);
	}

	@Override
	public boolean removeMyCalendar(String userId, String eventId) {
		return myCalendarDAO.deleteMyCalendar(userId, eventId);
	}

	@Override
	public MyCalendar findMyCalendarByUserIdAndEventId(String userId,
			String eventId) {
		return myCalendarDAO.selectMyCalendarByUserIdAndEventId(userId, eventId);
	}

	@Override
	public List<MyCalendar> findMyCalendarListByDate(String userId, String calendarEventDate) {
		return myCalendarDAO.selectMyCalendarListByDate(userId, calendarEventDate);
	}

	@Override
	public List<MyCalendar> findMyCalendarListByUserId(String userId) {
		return myCalendarDAO.selectMyCalendarListByUserId(userId);
	}

	@Override
	public int findMyCalendarCountByEventId(String eventId) {
		return myCalendarDAO.selectMyCalendarCountByEventId(eventId);
	}

}
