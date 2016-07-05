package com.seoulnori.dao;

import java.util.List;

import com.seoulnori.vo.Blog;
import com.seoulnori.vo.Event;
import com.seoulnori.vo.EventDetail;
import com.seoulnori.vo.EventNews;
import com.seoulnori.vo.EventPoint;
import com.seoulnori.vo.ImageLink;



public interface EventDAO {
	
	boolean insertParsingEvent(String areaNumber);

	boolean updateEvent(Event event);
	boolean updateEventIssuePoint(String eventId, int eventIssuePoint);
	boolean updateEventAvgStar(Event event);
	
	boolean naverTrendCheck();
	
	boolean naverTrendPointAndTweetPoint();
	
	boolean eventDateCheck(String eventId,String strDate);

	Event selectEventByEventId(String eventId);
	Event selectEventByEventIdBySysdate(String eventId);
	EventDetail parsingEventByEventId(String eventId);
	boolean updateIssuePoint();
	
	EventPoint selectEventPointByEventId(String eventId);
	
	List<Blog> parsingEventReviewBlog(String eventTitle);
	List<EventNews> findEventNewsOnlyFive(String eventTitle);
	
	List<EventNews> findEventNewsForCount(String eventTitle);
	
	
	List<Event> selectEventListOrderByIssuePoint();
	List<Event> selectEventListOrderByEventCount(String categoryNum);
	
	List<Event> selectEventListByEventCategory(String categoryNum, String order);
	List<Event> selectEventListByEventCategoryPaging(String categoryNum, String order, int startNo, int endNo);
	
	
	List<Event> selectEventListByEventGu(String eventGu);
	List<Event> selectEventListNearStation(String mapX, String MapY);
	
	List<Event> selectAllEventListAsNoImage();
	
	List<Event> selectEventListByKeyword(String keyword, String order);
	List<Event> selectEventListByKeywordPaging(String keyword, String order, int startNo, int endNo);
	
	List<Event> searchDetail(String detailKeyword,String selectPlace, String categoryCheck, String datepicker,String order);
	List<Event> searchDetailPaging(String detailKeyword,String selectPlace, String categoryCheck, String datepicker,String order, int startNo, int endNo);
	
	String getCategoryNumByEventId(String eventId);
	
	List<ImageLink> searchEventImageByInternet(String eventTitle);
	
	List<Event> selectEventListByCalendarDate(String calendarDate, String category);
	
	int selectPageCount(String categoryNum);
	
	List<String> selectEventTitleByEventIssuePoint();
	
}
