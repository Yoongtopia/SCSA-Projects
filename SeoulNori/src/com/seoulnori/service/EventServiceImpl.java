package com.seoulnori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.seoulnori.dao.EventDAO;
import com.seoulnori.vo.Blog;
import com.seoulnori.vo.Event;
import com.seoulnori.vo.EventDetail;
import com.seoulnori.vo.EventNews;
import com.seoulnori.vo.EventPoint;
import com.seoulnori.vo.ImageLink;

@Service("eventService")
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class EventServiceImpl implements EventService {

	private EventDAO eventDAO;
	
	@Autowired
	public void setEventDAO(EventDAO eventDAO) {
		this.eventDAO = eventDAO;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public boolean insertParsingEvent(String areaNumber) {
		return eventDAO.insertParsingEvent(areaNumber);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public boolean updateEvent(Event event) {
		return eventDAO.updateEvent(event);
	}


	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public boolean updateEventIssuePoint(String evnetIssuePoint, int eventCount) {
		return eventDAO.updateEventIssuePoint(evnetIssuePoint, eventCount);
	}

	@Override
	public Event findEventByEventId(String eventId) {
		return eventDAO.selectEventByEventId(eventId);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public EventDetail parsingEventByEventId(String eventId) {
		return eventDAO.parsingEventByEventId(eventId);
	}

	@Override
	public List<Event> findEventListOrderByIssuePoint() {
		return eventDAO.selectEventListOrderByIssuePoint();
	}

	@Override
	public List<Event> findEventListOrderByEventCount(String categoryNum) {
		return eventDAO.selectEventListOrderByEventCount(categoryNum);
	}

	@Override
	public List<Event> findEventListByEventCategory(String categoryNum, String order) {
		return eventDAO.selectEventListByEventCategory(categoryNum, order);
	}

	@Override
	public List<Event> findEventListByEventCategoryPaging(String categoryNum, String order, int startNo, int endNo) {
		return eventDAO.selectEventListByEventCategoryPaging(categoryNum, order, startNo, endNo);
	}
	
	@Override
	public List<Event> findEventListByEventGu(String eventGu) {
		return eventDAO.selectEventListByEventGu(eventGu);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public List<Event> findEventListNearStation(String mapX, String mapY) {
		return eventDAO.selectEventListNearStation(mapX, mapY);
	}

	@Override
	public List<Event> findEventListByKeyword(String keyword, String order) {
		return eventDAO.selectEventListByKeyword(keyword, order);
	}

	@Override
	public List<Event> findEventListByKeywordPaging(String keyword, String order,int startNo,int endNo) {
		return eventDAO.selectEventListByKeywordPaging(keyword, order,startNo, endNo);
	}
	
	@Override
	public String getCategoryNumByEventId(String eventId) {
		// TODO Auto-generated method stub
		return eventDAO.getCategoryNumByEventId(eventId);
	}

	@Override
	public List<Event> searchDetail(String detailKeyword, String selectPlace,
			String categoryCheck, String datepicker,String order) {
		return eventDAO.searchDetail(detailKeyword, selectPlace, categoryCheck, datepicker, order);
	}

	@Override
	public List<Event> searchDetailPaging(String detailKeyword, String selectPlace,
			String categoryCheck, String datepicker,String order,int startNo,int endNo) {
		return eventDAO.searchDetailPaging(detailKeyword, selectPlace, categoryCheck, datepicker, order, startNo, endNo);
	}
	
	@Override
	public List<ImageLink> searchEventImageByInternet(String eventTitle) {
		return eventDAO.searchEventImageByInternet(eventTitle);
	}

	@Override
	public List<Event> findEventListByCalendarDate(String calendarDate, String category) {
		return eventDAO.selectEventListByCalendarDate(calendarDate, category);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public boolean updateEventAvgStar(Event event) {
		// TODO Auto-generated method stub
		return eventDAO.updateEventAvgStar(event);
	}


	@Override
	public int findPageCount(String categoryNum) {
		return eventDAO.selectPageCount(categoryNum);
	}

	@Override
	public boolean updateIssuePoint() {
		// TODO Auto-generated method stub
		return eventDAO.updateIssuePoint();
	}

	@Override
	public List<Blog> findEventReviewBlog(String eventTitle) {
		// TODO Auto-generated method stub
		return eventDAO.parsingEventReviewBlog(eventTitle);
	}

	@Override
	public List<Event> findAllEventListAsNoImage() {
		// TODO Auto-generated method stub
		return eventDAO.selectAllEventListAsNoImage();
	}

	@Override
	public boolean eventDateCheck(String eventId,String strDate) {
		// TODO Auto-generated method stub
		return eventDAO.eventDateCheck(eventId,strDate);
	}

	@Override
	public Event selectEventByEventIdBySysdate(String eventId) {
		// TODO Auto-generated method stub
		return eventDAO.selectEventByEventIdBySysdate(eventId);
	}

	@Override
	public List<String> findEventTitleByEventIssuePoint() {
		
		return eventDAO.selectEventTitleByEventIssuePoint();
	}

	@Override
	public boolean naverTrendCheck() {
		// TODO Auto-generated method stub
		return eventDAO.naverTrendCheck();
	}

	@Override
	public List<EventNews> findEventNewsOnlyFive(String eventTitle) {
		// TODO Auto-generated method stub
		return eventDAO.findEventNewsOnlyFive(eventTitle);
	}

	@Override
	public List<EventNews> findEventNewsForCount(String eventTitle) {
		// TODO Auto-generated method stub
		return eventDAO.findEventNewsForCount(eventTitle);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public boolean naverTrendPointAndTweetPoint() {
		return eventDAO.naverTrendPointAndTweetPoint();
	}

	@Override
	public EventPoint findEventPointByEventId(String eventId) {
		// TODO Auto-generated method stub
		return eventDAO.selectEventPointByEventId(eventId);
	}

	
}
