package com.seoulnori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seoulnori.vo.MyCalendar;

@Repository("myCalendarDAO")
public class MyCalendarDAOImpl implements MyCalendarDAO {
	
private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insertMyCalendar(MyCalendar myCalendar) {
		return sqlSessionTemplate.insert("MyCalendar.insertMyCalendar", myCalendar) > 0;
	}

	@Override
	public boolean updateMyCalendar(MyCalendar myCalendar) {
		return sqlSessionTemplate.update("MyCalendar.updateMyCalendar", myCalendar) > 0;
	}

	@Override
	public boolean deleteMyCalendar(String userId, String eventId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("eventId", eventId);
		return sqlSessionTemplate.delete("MyCalendar.deleteMyCalendar", map) > 0;
	}

	@Override
	public MyCalendar selectMyCalendarByUserIdAndEventId(String userId,
			String eventId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("eventId", eventId);
		return sqlSessionTemplate.selectOne("MyCalendar.selectMyCalendarByUserIdAndEventId", map);
	}

	@Override
	public List<MyCalendar> selectMyCalendarListByDate(
			String userId,  String calendarEventDate) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("eventId", calendarEventDate);
		return sqlSessionTemplate.selectList("MyCalendar.selectMyCalendarListByDate", map);
	}

	@Override
	public List<MyCalendar> selectMyCalendarListByUserId(String userId) {
		return sqlSessionTemplate.selectList("MyCalendar.selectMyCalendarListWithEventByUserId", userId);
	}

	@Override
	public int selectMyCalendarCountByEventId(String eventId) {
		return sqlSessionTemplate.selectOne("MyCalendar.selectMyCalendarCountByEventId", eventId);
	}
	
}
