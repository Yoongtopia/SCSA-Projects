package com.seoulnori.service;

import java.util.List;

import com.seoulnori.vo.Blog;
import com.seoulnori.vo.Event;
import com.seoulnori.vo.EventDetail;
import com.seoulnori.vo.EventNews;
import com.seoulnori.vo.EventPoint;
import com.seoulnori.vo.ImageLink;

public interface EventService {

	
	boolean insertParsingEvent(String areaNumber);
	boolean updateEvent(Event event);
	boolean updateEventIssuePoint(String evnetIssuePoint, int eventCount);
	boolean updateEventAvgStar(Event event);

	boolean naverTrendCheck();
	boolean naverTrendPointAndTweetPoint();
	
	boolean eventDateCheck(String eventId,String strDate);
	
	Event findEventByEventId(String eventId);//DB에 있는 정보를 evnetId로 가져옴
	Event selectEventByEventIdBySysdate(String eventId);
	EventDetail parsingEventByEventId(String eventId);//eventId로 상세정보 파싱.
	boolean updateIssuePoint();
	
	EventPoint findEventPointByEventId(String eventId);
	
	List<Blog> findEventReviewBlog(String eventTitle);
	List<EventNews> findEventNewsOnlyFive(String eventTitle);
	
	List<EventNews> findEventNewsForCount(String eventTitle);
	
	

	
	List<Event> findEventListOrderByIssuePoint();//화제순으로 행사리스트 조회
	List<Event> findEventListOrderByEventCount(String categoryNum);//조회수별로 행사리스트 조회
	
	//카테고리 별로 행사리스트조회. 뒤의 order는 sorting에 대한 정보.
	List<Event> findEventListByEventCategory(String categoryNum, String order);
	List<Event> findEventListByEventCategoryPaging(String categoryNum, String order, int startNo, int endNo);
	
	
	List<Event> findEventListByEventGu(String eventGu);//구 별로 행사정보를 조회
	List<Event> findEventListNearStation(String mapX, String mapY);//GPS정보로 역근처 행사 조회 
	
	List<Event> findAllEventListAsNoImage();
	List<Event> findEventListByKeyword(String keyword, String order);//키워드로 검색. order는 sorting 정보.
	List<Event> findEventListByKeywordPaging(String keyword, String order, int startNo, int endNo);//키워드로 검색. order는 sorting 정보.
	
	List<Event> searchDetail(String detailKeyword,String selectPlace, String categoryCheck, String datepicker,String order);
	List<Event> searchDetailPaging(String detailKeyword,String selectPlace, String categoryCheck, String datepicker,String order, int startNo, int endNo);

	
	String getCategoryNumByEventId(String eventId);
	
	List<ImageLink> searchEventImageByInternet(String eventTitle);
	
	List<Event> findEventListByCalendarDate(String calendarDate, String category);

	int findPageCount(String categoryNum);
	
	List<String> findEventTitleByEventIssuePoint();
	
}
