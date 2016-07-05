package com.seoulnori.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seoulnori.service.EventService;
import com.seoulnori.service.QnaService;
import com.seoulnori.util.AdvancedPageUtility;
import com.seoulnori.vo.Event;
import com.seoulnori.vo.EventDetail;
import com.seoulnori.vo.ImageLink;
import com.seoulnori.vo.Member;


@Controller("eventController")
public class EventController {

	HashMap<Integer, Event> eventToday=new HashMap<Integer, Event>();
	
	private Logger logger =Logger.getLogger(EventController.class);

	
	private EventService eventService;
	private QnaService qnaService;
	
	@Autowired
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	@Autowired
	public void setQnaService(QnaService qnaService) {
		this.qnaService = qnaService;
	}

	@RequestMapping("/parsing.do")
	public String parsingDB(String areaNumber){
		eventService.insertParsingEvent(areaNumber);
		/*현재 파싱해서 데이터를 DB에 넣는 수준만 해놓았기에 따로 페이지 안만들었음.
		 * 추후에 관리자의 관리페이지가 생기면 연결되는 버튼을 그 페이지에 넣을 예정임.*/
		return "";
	}
	

	@RequestMapping("/event_issut_update.do")
	public String updateIssue(){
		eventService.updateIssuePoint();
	
		return "";
	}
	
	@RequestMapping("/event_list_move.do")
	public String moveList(String category, String order, String pageNo, 
			Model model, HttpSession session) throws Exception{
		logger.info("page:"+pageNo);
		if(category!=null){
			session.setAttribute("category", category);
		}
		/*받아오는 카테고리가 총 15종이기때문에 임의로 5종류로 카테고리를 분류하였음
		 * 이에 따라 밑의 else if구문으로 강제로 카테고리 넘을 지정함으로서 분류.
		 * 또한  세션의 경우 키워드 검색에서 키워드를 검색시 검색어를 보존하기위해 세션에 담아놓는터라 그대로 두면 리스트 조회후 
		 * sorting을 누르면 카테고리가 아니라 지정된 키워드의 소팅명령어로 넘어가게되기 때문에, 여기서 키워드를 빈 String으로 
		 * 바꾸는 작업을 하게 하였음.*/
	
		String cPage = pageNo;
		int page = 1;
		
		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
				
		final int perPage = 9;
		int startNo = (page-1)*perPage + 1;
		int endNo = page*perPage;
		
	
		session.setAttribute("detailKeyword", null);
		String categoryNum="";
		List<Event> eventList= null;
		session.setAttribute("keyword", "");
		if(order==null||order.trim()==""){
			order="issuePoint";
		}
		
		if(category.equals("exhibition")){
			categoryNum="A02080500";
			eventList=eventService.findEventListByEventCategoryPaging(categoryNum, order, startNo, endNo);
		}else if(category.equals("performance")){
			categoryNum="A02080200";
			eventList=eventService.findEventListByEventCategoryPaging(categoryNum, order, startNo, endNo);
		}else if(category.equals("festival")){
			categoryNum="A02070100";
			eventList=eventService.findEventListByEventCategoryPaging(categoryNum, order, startNo, endNo);
		}else if(category.equals("classic")){
			categoryNum="A02080900";
			eventList=eventService.findEventListByEventCategoryPaging(categoryNum, order, startNo, endNo);
		}else if(category.equals("ect")){
			categoryNum="A02081300";
			eventList=eventService.findEventListByEventCategoryPaging(categoryNum, order, startNo, endNo);
		}
	

		logger.info(eventList);
		
		
		
		
		AdvancedPageUtility pageUtil = 
				new AdvancedPageUtility(perPage,eventService.findEventListByEventCategory(categoryNum, order).size(), page, "images/");
		
		model.addAttribute("contentPage", "view_event/list.jsp");		
		model.addAttribute("category", category);		
		model.addAttribute("eventList", eventList);	
		model.addAttribute("pageLink", pageUtil.getPageBar());
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("perPage", perPage);
		return "view_main/index";
	}
	
	@RequestMapping("/event_search_keyword.do")
	public String keywordSearch(String keyword, String order, HttpSession session, Model model ) throws Exception{
		
		/*키워드검색시 키워드가 오지 않고 세션에 키워드가 담겨있다면, 이는 이전에 키워드 검색한 것에대한 sorting요청이다.
		 * 따라서 세션에 담겨있는 키워드로 재검색을 하게된다.*/
		
	
		
		session.setAttribute("detailKeyword", null);
		String word=(String) session.getAttribute("keyword");
		if(keyword==null&&word!=null){
			keyword=word;
		}
		
		/*sorting에 대한 요청이 없으면 화제순을 기본 정렬순으로 한다.*/
		if(order==null||order.trim()==""){
			order="issuePoint";
		}
		

		
		List<Event> eventList=eventService.findEventListByKeyword(keyword, order);
		

		
		
		
		/*상기한 sorting요청을 위해 키워드를 세션에 담아 보존한다.*/
		model.addAttribute("contentPage", "view_event/list.jsp");		
		session.setAttribute("keyword", keyword);
		model.addAttribute("eventList", eventList);

		return "view_main/index";
	}
	
	@RequestMapping("/event_search_station.do")
	public String stationSearch(String mapX, String mapY, String id, Model model){
		
		String clickedSubwayName="";
		if(id.equals("gwanghwa")){
			clickedSubwayName="광화문역";
		} else if(id.equals("nambu")){
			clickedSubwayName="남부터미널역";
		} else if(id.equals("myoungdong")){
			clickedSubwayName="명동역";
		} else if(id.equals("samsung")){
			clickedSubwayName="삼성역";
		} else if(id.equals("cityHall")){
			clickedSubwayName="시청역";
		} else if(id.equals("shincheon")){
			clickedSubwayName="신촌역";
		} else if(id.equals("apgujung")){
			clickedSubwayName="압구정역";
		} else if(id.equals("omok")){
			clickedSubwayName="오목교역";
		} else if(id.equals("jongno3")){
			clickedSubwayName="종로3가역";
		} else if(id.equals("hapjung")){
			clickedSubwayName="합정역";
		} else if(id.equals("hyehwa")){
			clickedSubwayName="혜화역";
		}
		
		model.addAttribute("mainEventList", eventService.findEventListByEventCategory(null, null));
		model.addAttribute("eventListBySubway", eventService.findEventListNearStation(mapX, mapY));
		model.addAttribute("clickedSubwayName", clickedSubwayName);
		
		defaultDate(model);
		
		return "view_main/index";
	}

	
	@RequestMapping("/event_search_by_gu.do")
	public String guSearch(String eventGu, Model model){

		String gu="";
		String clickedGuName="";
		if(eventGu.equals("Dobong-gu")){
			gu="S10";
			clickedGuName="도봉구";
		}else if(eventGu.equals("Dongdaemun-gu")){
			gu="S11";
			clickedGuName="동대문구";
		}else if(eventGu.equals("Dongjak-gu")){
			gu="S12";
			clickedGuName="동작구";
		}else if(eventGu.equals("Eunpyeong-gu")){
			gu="S22";
			clickedGuName="은평구";
		}else if(eventGu.equals("Gangbuk-gu")){
			gu="S3";
			clickedGuName="강북구";
		}else if(eventGu.equals("Gangdong-gu")){
			gu="S2";
			clickedGuName="강동구";
		}else if(eventGu.equals("Gangseo-gu")){
			gu="S4";
			clickedGuName="강서구";
		}else if(eventGu.equals("Gangnam-gu")){
			gu="S1";
			clickedGuName="강남구";
		}else if(eventGu.equals("Geumcheon-gu")){
			gu="S8";
			clickedGuName="금천구";
		}else if(eventGu.equals("Guro-gu")){
			gu="S7";
			clickedGuName="구로구";
		}else if(eventGu.equals("Gwanak-gu")){
			gu="S5";
			clickedGuName="관악구";
		}else if(eventGu.equals("Gwangjin-gu")){
			gu="S6";
			clickedGuName="광진구";
		}else if(eventGu.equals("Jung-gu")){
			gu="S24";
			clickedGuName="중구";
		}else if(eventGu.equals("Jongno-gu")){
			gu="S23";
			clickedGuName="종로구";
		}else if(eventGu.equals("Jungnang-gu")){
			gu="S25";
			clickedGuName="중랑구";
		}else if(eventGu.equals("Mapo-gu")){
			gu="S13";
			clickedGuName="마포구";
		}else if(eventGu.equals("Nowon-gu")){
			gu="S9";
			clickedGuName="노원구";
		}else if(eventGu.equals("Seocho-gu")){
			gu="S15";
			clickedGuName="서초구";
		}else if(eventGu.equals("Seodaemun-gu")){
			gu="S14";
			clickedGuName="서대문구";
		}else if(eventGu.equals("Seongbuk-gu")){
			gu="S17";
			clickedGuName="성북구";
		}else if(eventGu.equals("Seongdong-gu")){
			gu="S16";
			clickedGuName="성동구";
		}else if(eventGu.equals("Songpa-gu")){
			gu="S18";
			clickedGuName="송파구";
		}else if(eventGu.equals("Yangcheon-gu")){
			gu="S19";
			clickedGuName="양천구";
		}else if(eventGu.equals("Yeongdeungpo-gu")){
			gu="S20";
			clickedGuName="영등포구";
		}else if(eventGu.equals("Yongsan-gu")){
			gu="S21";
			clickedGuName="용산구";
		}else if(eventGu.equals("kyu1")){
			gu="kyu1";
			clickedGuName="의정부/양주/포천 지역";
		}else if(eventGu.equals("kyu2")){
			gu="kyu2";
			clickedGuName="구리/남양주 지역";
		}else if(eventGu.equals("kyu3")){
			gu="kyu3";
			clickedGuName="하남/광주/양평/이천 지역";
		}else if(eventGu.equals("kyu4")){
			gu="kyu4";
			clickedGuName="성남/용인 지역";
		}else if(eventGu.equals("kyu5")){
			gu="kyu5";
			clickedGuName="안양/과천/수원/평택 지역";
		}else if(eventGu.equals("kyu6")){
			gu="kyu6";
			clickedGuName="인천/부천/김포/광명/시흥 지역";
		}else if(eventGu.equals("kyu7")){
			gu="kyu7";
			clickedGuName="파주/고양/연천 지역";
		}

		model.addAttribute("mainEventList", eventService.findEventListByEventCategory(null, null));
		model.addAttribute("eventListByGu", eventService.findEventListByEventGu(gu));
		model.addAttribute("clickedGuName", clickedGuName);
		
		defaultDate(model);
		
		return "view_main/index";
	}
	
	/* 지하철/지역구 검색시 달력에 기본 정보 출력 @sy */
	public void defaultDate(Model model){
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String todayStr = sdf.format(today).toString();
		model.addAttribute("selectedDate", todayStr);
		model.addAttribute("eventListByDate", eventService.findEventListByCalendarDate(todayStr, null));
	}
	
	
	@RequestMapping("/event_detail.do")
	public String detailEvent(String eventId, String addCalSuccess, Model model, HttpSession session) throws UnsupportedEncodingException{

		/*event에 대한 기본정보는 DB에서 가져오고, 상세정보는 다시한번 파싱해서 가져온다.*/
		EventDetail eventDetail=eventService.parsingEventByEventId(eventId);
		
		
		if(eventDetail.getEventContent()==null){
			HttpClient httpClient = new DefaultHttpClient();
			String title=URLEncoder.encode(eventDetail.getEventTitle(),"euc-kr");
			HttpGet httpget1 = new HttpGet("http://www.playdb.co.kr/search/Search.asp?Query="+title);
			String linkable="";
			
			try {
				linkable=httpClient.execute(httpget1, new BasicResponseHandler() {
					 @Override
					    public String handleResponse(HttpResponse response) throws HttpResponseException,
					        IOException {
					      
					      String res = new String(super.handleResponse(response).getBytes(), "euc-kr");
					      Document doc = Jsoup.parse(res);
					      Element row = doc.select("td[width=65] a").first();
					      String link=null;
					      if(row!=null){
					      link=row.attr("href");
					      }
					      
					      return link;
					    }
				});
			} catch (ClientProtocolException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String content="";
			
			if(linkable!=null){
				String number= linkable.substring(linkable.indexOf("=")+1, linkable.length());
				HttpGet httpget2 = new HttpGet("http://www.playdb.co.kr/playdb/playdbDetail_Content.asp?TabKind=2&PlayNo="+number);
			
				try {
					content=httpClient.execute(httpget2, new BasicResponseHandler(){
						 @Override
						    public String handleResponse(HttpResponse response) throws HttpResponseException,
						        IOException {
						      
						      String res = new String(super.handleResponse(response).getBytes(), "euc-kr");

						      Document doc = Jsoup.parse(res);
						      
						      Element row = doc.select("td.news").first();				     
						      String text=null;
						      if(row!=null){
						    	  text=row.html();
						      }
						    
						      return text+"<br/><br/> 출처:플레이DB(<a href='http://www.playdb.co.kr' target='_blank'>http://www.playdb.co.kr</a>)";
						    }
					});
					
					
				} catch (ClientProtocolException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
			
			if(content!=null){
				eventDetail.setEventContent(content);
			}
			
		}
		
		
		
		
		model.addAttribute("event", eventService.findEventByEventId(eventId));
		model.addAttribute("eventDetail", eventDetail);
		model.addAttribute("eventPoint", eventService.findEventPointByEventId(eventId));
		model.addAttribute("blogList", eventService.findEventReviewBlog(eventDetail.getEventTitle()));
		model.addAttribute("newsList", eventService.findEventNewsOnlyFive(eventDetail.getEventTitle()));
		/* event에 달린 QnA 리스트를 DB에서 가져온다 @sy */
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			if(member.getUserId().equals( qnaService.findManagerIdByEventId(eventId) )){
				model.addAttribute("rightEventManager", "Y");
			} else {
				model.addAttribute("rightEventManager", "N");
			}
		}
		model.addAttribute("qnaList", qnaService.findQnaListByEventId(eventId));
		
		if(addCalSuccess != null){
			model.addAttribute("addCalSuccess", addCalSuccess);
		}
		
		model.addAttribute("contentPage", "view_event/detail.jsp");
		return "view_main/index";

	}
	
	@RequestMapping("/event_detail.do#contentReviewList")
	public String detailEventWithQna(String eventId, Model model, HttpSession session) throws UnsupportedEncodingException{
		
		/*event에 대한 기본정보는 DB에서 가져오고, 상세정보는 다시한번 파싱해서 가져온다.*/
		EventDetail eventDetail=eventService.parsingEventByEventId(eventId);
		
		if(eventDetail.getEventContent()==null){
			HttpClient httpClient = new DefaultHttpClient();
			String title=URLEncoder.encode(eventDetail.getEventTitle(),"euc-kr");
			HttpGet httpget1 = new HttpGet("http://www.playdb.co.kr/search/Search.asp?Query="+title);
			String linkable="";
			
			try {
				linkable=httpClient.execute(httpget1, new BasicResponseHandler() {
					 @Override
					    public String handleResponse(HttpResponse response) throws HttpResponseException,
					        IOException {
					      
					      String res = new String(super.handleResponse(response).getBytes(), "euc-kr");
					      Document doc = Jsoup.parse(res);
					      Element row = doc.select("td[width=65] a").first();
					      String link=null;
					      if(row!=null){
					      link=row.attr("href");
					      }
					      
					      return link;
					    }
				});
			} catch (ClientProtocolException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String content="";
			
			if(linkable!=null){
				String number= linkable.substring(linkable.indexOf("=")+1, linkable.length());
				HttpGet httpget2 = new HttpGet("http://www.playdb.co.kr/playdb/playdbDetail_Content.asp?TabKind=2&PlayNo="+number);
			
				try {
					content=httpClient.execute(httpget2, new BasicResponseHandler(){
						 @Override
						    public String handleResponse(HttpResponse response) throws HttpResponseException,
						        IOException {
						      
						      String res = new String(super.handleResponse(response).getBytes(), "euc-kr");

						      Document doc = Jsoup.parse(res);
						      
						      Element row = doc.select("td.news").first();				     
						      String text=null;
						      if(row!=null){
						    	  text=row.html();
						      }
						    
						      return text+"<br/><br/> 출처:플레이DB<a href='http://www.playdb.co.kr' target='_blank'>(http://www.playdb.co.kr)</a>";
						    }
					});
					
					
				} catch (ClientProtocolException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			}
			
			if(content!=null){
				eventDetail.setEventContent(content);
			}
			
		}
		
		
		
		model.addAttribute("event", eventService.findEventByEventId(eventId));
		model.addAttribute("eventDetail", eventDetail);
		model.addAttribute("eventPoint", eventService.findEventPointByEventId(eventId));
		model.addAttribute("newsList", eventService.findEventNewsOnlyFive(eventDetail.getEventTitle()));
		model.addAttribute("blogList", eventService.findEventReviewBlog(eventDetail.getEventTitle()));

		/* event에 달린 QnA 리스트를 DB에서 가져온다 @sy */
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			if(member.getUserId().equals( qnaService.findManagerIdByEventId(eventId) )){
				model.addAttribute("rightEventManager", "Y");
			} else {
				model.addAttribute("rightEventManager", "N");
			}
		}
		model.addAttribute("qnaList", qnaService.findQnaListByEventId(eventId));
		
		model.addAttribute("contentPage", "view_event/detail.jsp");
		return "view_main/index";

	}
	
	@RequestMapping("/event_detail_search.do")
	public String searchDetail(String detailKeyword,String sido, String selectPlace1,String selectPlace2,String selectPlace3, String categoryCheck, String datepicker, String order, Model model, HttpSession session) throws Exception{
		
		
		
		
		String selectPlace=null;
		String word=(String) session.getAttribute("detailKeyword");
		if(detailKeyword==null||detailKeyword.trim()==""){
			if(word!=null){
				detailKeyword=word;
			}
		}
		
		if(selectPlace1!=null&&selectPlace2!=null&&selectPlace3!=null&&selectPlace1.trim()==""&&selectPlace2.trim()==""&&selectPlace3.trim()==""&&sido!=null&&sido.trim()!=""){
			selectPlace=sido;
		}
		
		if(selectPlace1!=null&&selectPlace1.trim()!=""){
			selectPlace=selectPlace1;
		}
		if(selectPlace2!=null&&selectPlace2.trim()!=""){
			selectPlace=selectPlace2;
		}
		if(selectPlace3!=null&&selectPlace3.trim()!=""){
			selectPlace=selectPlace3;
		}
		
		logger.info(detailKeyword);
		logger.info(selectPlace);
		logger.info(categoryCheck);
		logger.info(datepicker);
		
		
		/*기본적인 정보는 DB에 저장되어있는 데이터베이스를 가져오고, 나머지 정보는 eventId를 통해 다시한번 상세정보를 파싱해온다.*/
		List<Event> eventList = eventService.searchDetail(detailKeyword, selectPlace, categoryCheck, datepicker, order);
		logger.info(eventList);
		

		if(categoryCheck!=null&&categoryCheck.trim()!=""){
			model.addAttribute("category", categoryCheck);
		}
		
		if(detailKeyword.trim()==""){
			detailKeyword=null;
		}
		
		session.setAttribute("detailKeyword", detailKeyword);
		model.addAttribute("selectPlace", selectPlace);
		model.addAttribute("categoryCheck", categoryCheck);
		model.addAttribute("datepicker", datepicker);
		model.addAttribute("eventList", eventList);

		model.addAttribute("contentPage", "view_event/list.jsp");
		return "view_main/index";
	}
	
	
	//행사리스트(검색)	
	@RequestMapping("/event_ajax_search.do")
	@ResponseBody
	public HashMap<String, Object> searchEvent(String adminkeyword, String order, 
			HttpSession session){	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(adminkeyword == null || adminkeyword.trim().length() == 0 || adminkeyword.equals("all")){
			
			session.setAttribute("adminkeyword", "");
			
			List<Event> eventList = eventService.findEventListByKeyword(null, "issuePoint");
			if(eventList!=null&&eventList.size()>0){
				map.put("status", true);
				map.put("eventList", eventList);
				
			}else{
				map.put("status", false);
			}
			
		} else if(adminkeyword.equals("noImage") ){
			
			session.setAttribute("keyword", "");
		
			List<Event> eventList=eventService.findAllEventListAsNoImage();
			if(eventList!=null&&eventList.size()>0){
				map.put("status", true);
				map.put("eventList", eventList);
				
			}else{
				map.put("status", false);
				
			}
			
		} else{
	
			session.setAttribute("adminkeyword", adminkeyword);
	
			/*sorting에 대한 요청이 없으면 화제순을 기본 정렬순으로 한다.*/
			if(order==null||order.trim()==""){
				order="issuePoint";
			}
			List<Event> eventList=eventService.findEventListByKeyword(adminkeyword, order);
			
			if(eventList!=null&&eventList.size()>0){
				map.put("status", true);
				map.put("eventList", eventList);
				
			}else{
				map.put("status", false);
			}
		}

	
		return map;
	
	
	}
	
	@RequestMapping("/event_change_image_form.do")
	@ResponseBody
	public HashMap<String, Object> searchEventImageForm(String eventTitle, String eventId, HttpSession session){	

		
		session.setAttribute("eventId", eventId);
		session.setAttribute("eventTitle", eventTitle);
		List<ImageLink> imageList = eventService.searchEventImageByInternet(eventTitle);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(imageList!=null&&imageList.size()>0){
			map.put("status", true);
			map.put("imageList", imageList);
			
		}else{
			map.put("status", false);
		}

		return map;
	
	
	}
	
	@RequestMapping("/event_change_image.do")
	@ResponseBody
	public HashMap<String, Object> searchEventImage(String imageLink, HttpSession session){	

		
		String eventId=(String) session.getAttribute("eventId");
		String adminkeyword=(String) session.getAttribute("adminkeyword");
		String eventThumbnail="";
		
		Event event=eventService.findEventByEventId(eventId);

		if(event.getEventThumbnail()!=null){
		eventThumbnail=event.getEventThumbnail();
		}
		event.setEventThumbnail(imageLink);
		eventService.updateEvent(event);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(eventThumbnail!=eventService.findEventByEventId(eventId).getEventThumbnail()){
			map.put("status", true);
			map.put("adminkeyword", adminkeyword);
			
		}else{
			map.put("status", false);
		}
		
		return map;

	}
	
	/* 달력에서 날짜 선택시 해당 날짜의 이벤트 리스트 출력 */
	@RequestMapping("/event_by_calendarDate.do")
	public String eventByCalendarDate(String calendarDate, String category, String selectedCategory, Model model){
		model.addAttribute("mainEventList", eventService.findEventListByEventCategory(null, null));
		model.addAttribute("eventListByDate", eventService.findEventListByCalendarDate(calendarDate, category));
		model.addAttribute("selectedCategory", selectedCategory);
		
		if( selectedCategory == null || selectedCategory.equals("")){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date date = null;
			try {
				date = sdf.parse(calendarDate);
			} catch (ParseException e) {
				e.printStackTrace();
				return "view_main/index";
			}
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String selectedDate = sdf2.format(date);
			model.addAttribute("selectedDate", selectedDate);
			model.addAttribute("selectedDateType", date);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = sdf.parse(calendarDate);
			} catch (ParseException e) {
				e.printStackTrace();
				return "view_main/index";
			}
			model.addAttribute("selectedDate", calendarDate);
			model.addAttribute("selectedDateType", date);
		}
		
		return "view_main/index";
	}
	
	@RequestMapping("/event_image_update.do")
	@ResponseBody
	public HashMap<String, Object> updateImage(String updateEventId, String eventImage,HttpSession session) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		String keyword=(String) session.getAttribute("keyword");
		Event event=eventService.findEventByEventId(updateEventId);
		String eventThumbnail="";
		
		if(event.getEventThumbnail()!=null){
			eventThumbnail=event.getEventThumbnail();
			}
	
		if(eventImage!=null&&eventImage!=""){
			event.setEventThumbnail(eventImage);
			eventService.updateEvent(event);
	
		}
		if(eventThumbnail!=eventService.findEventByEventId(updateEventId).getEventThumbnail()){
			map.put("status", true);
			map.put("keyword", keyword);
			
		}else{
			map.put("status", false);
		}
		
		
		return map;
	}
	
	@RequestMapping("/event_image_update_server.do")
	public String updateImageServerSide(String updateEventId2,MultipartFile updateImage2,String root,HttpSession session, HttpServletRequest request, Model model) throws IllegalStateException, IOException{
		
		Event event=eventService.findEventByEventId(updateEventId2);
		
		if(updateImage2.getOriginalFilename()!=null&&updateImage2.getOriginalFilename().trim()!=""){
			
			String saveDir = request.getServletContext().getRealPath("/images/event");
			updateImage2.transferTo(new File(saveDir+"/"+updateImage2.getOriginalFilename()));
			
			event.setEventThumbnail(root+"/images/event/"+updateImage2.getOriginalFilename());
			eventService.updateEvent(event);
		}	
		
		return "redirect:/admin_page.do?afterUpdateServer=Y&tabId=imageUpdateTab";
	}
	
	public HashMap<String,Object> naverTrendExcel(){
		HashMap<String,Object> map = new HashMap<>();
		List<String> eventTitleList = eventService.findEventTitleByEventIssuePoint();
		List<String> fixedTitleList = new ArrayList<String>();
		ArrayList<String> queryList = new ArrayList<String>();
	
		
		long currentTime = System.currentTimeMillis();  //현재 시간 
		long futureTime = currentTime+(7*24*60*60*1000);  //일주일 뒤의 시간


		Date current = new Date(currentTime);  
		Date future = new Date(futureTime);  
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
	
		/**순형오빠가 고쳐야할 부분*/
		String startDate =sdf.format(current);  //currentTime을 20140612 이런 식으로 변환 필요
		String endDate=sdf.format(future);    //futureTime을 20140619 이런 식으로 변환 필요
 		
		
		//네이버 트랜드 검색할 때 조건
		for(String query:eventTitleList){
		
		//연도 제거
		Calendar now = Calendar.getInstance();
		String year= String.valueOf(now.get(Calendar.YEAR));
		if(query.indexOf(year)!=-1){
			query = query.substring(0, query.indexOf(year));
		}
		
		//괄호 제거 1
		if(query.indexOf("[")!=-1 && query.indexOf("]")!=-1){
			String inside = query.substring(query.indexOf("[")+1,query.indexOf("]")-1);
			query = query.substring(0, query.indexOf("["))+inside;
		}	
		//괄호 제거 2
		if(query.indexOf("(")!=-1 && query.indexOf(")")!=-1){
			String inside = query.substring(query.indexOf("(")+1,query.indexOf(")")-1);
			if(inside.length()>5||inside.equals("수원")||inside.equals("용인")){
				query = query.substring(0, query.indexOf("("));
			}else{
			query = query.substring(0, query.indexOf("("))+inside;
			}
		}
		//괄호 제거 3
		if(query.indexOf("{")!=-1 && query.indexOf("}")!=-1){
			String inside = query.substring(query.indexOf("{")+1,query.indexOf("}")-1);
			query = query.substring(0, query.indexOf("{"))+inside;
		}	
		//괄호 제거 4
		if(query.indexOf("<")!=-1 && query.indexOf(">")!=-1){
			String inside = query.substring(query.indexOf("<")+1,query.indexOf(">")-1);
			query = query.substring(0, query.indexOf("<"))+inside;
		}
	
		//따옴표 제거 1
		if(query.indexOf("'")!=-1 && query.indexOf("'")!=-1){
			String inside = query.substring(query.indexOf("'")+1,query.indexOf("'")-1);
			query = query.substring(0, query.indexOf("'"))+inside;
		}
		//따옴표 제거 2
		if(query.indexOf('"')!=-1 && query.substring(0,query.indexOf('"')).indexOf('"')!=-1){
			String inside = query.substring(query.indexOf('"')+1,query.indexOf('"')-1);
			query = query.substring(0, query.indexOf('"'))+inside;
		}
		
		
		// : 제거
		if(query.indexOf(":")!=-1){
			String behind = query.substring(query.indexOf(":"),query.length());
			query = query.substring(0,query.indexOf(":")-1)+" "+behind;
		}
		// - 제거
		if(query.indexOf("-")!=-1){
			String behind = query.substring(query.indexOf("-"),query.length());
			query = query.substring(0,query.indexOf("-"))+" "+behind;
		}
		// , 제거
		if(query.indexOf(",")!=-1){
			String behind = query.substring(query.indexOf(","),query.length());
			query = query.substring(0,query.indexOf(","))+" "+behind;
		}
		// / 제거
		if(query.indexOf("/")!=-1){
			String behind = query.substring(query.indexOf("/"),query.length());
			query = query.substring(0,query.indexOf("/"))+" "+behind;
		}
		// ? 제거
		if(query.indexOf("?")!=-1){
			String behind = query.substring(query.indexOf("?"),query.length());
			query = query.substring(0,query.indexOf("?"))+" "+behind;
		}	
		// ! 제거
		if(query.indexOf("!")!=-1){
			String behind = query.substring(query.indexOf("!"),query.length());
			query = query.substring(0,query.indexOf("!"))+" "+behind;
				}	
		// ~ 제거
		if(query.indexOf("~")!=-1){
			String behind = query.substring(query.indexOf("~"),query.length());
			query = query.substring(0,query.indexOf("~"))+" "+behind;
		}
		
		
		if(query.indexOf("연극")!=-1){
			//연극이라는 글자가 뒤에 존재하는 경우
			if(query.substring(0,query.indexOf("연극")-1).length()>0){
			
			//연극으로 시작되는 행사제목일경 경우	
			}else{
				//'연극'을 제외한 문자열의 길이가 3보다 클 경우
				if(query.substring(query.indexOf("연극")+2,query.length()).length()>3){
					//'연극'을 잘라낸다
					query = query.substring(query.indexOf("연극")+2,query.length());					
				}
			}
		}
	
		
		if(query.indexOf("뮤지컬")!=-1){
			//뮤지컬 이라는 글자로 시작하는 경우
			if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>0){
				//'뮤지컬'을 제외한 문자열의 길이가 3보다 클 경우
				if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>3){
					//'뮤지컬'을 잘라낸다
					query = query.substring(query.indexOf("뮤지컬")+2,query.length());					
				}
			}
		}
		
		
		if(query.indexOf("뮤지컬")!=-1){
			//뮤지컬 이라는 글자로 시작하는 경우
			if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>0){
				//'뮤지컬'을 제외한 문자열의 길이가 3보다 클 경우
				if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>3){
					//'뮤지컬'을 잘라낸다
					query = query.substring(query.indexOf("뮤지컬")+2,query.length());					
				}
			}
		}
		
		fixedTitleList.add(query);
		
 		}
		
		
		
		
		for(String s:eventTitleList){
			//인코딩하기
			String encoded = null;
	        try {
	            encoded = URLEncoder.encode(s, "UTF-8");
	        } catch (UnsupportedEncodingException ignore) {
	        }
	        StringBuilder buf = new StringBuilder(encoded.length());
	        char focus;
	        for (int i = 0; i < encoded.length(); i++) {
	            focus = encoded.charAt(i);
	            if (focus == '*') {
	                buf.append("%2A");
	            } else if (focus == '+') {
	                buf.append("%20");
	            } else if (focus == '%' && (i + 1) < encoded.length()
	                    && encoded.charAt(i + 1) == '7' && encoded.charAt(i + 2) == 'E') {
	                buf.append('~');
	                i += 2;
	            } else {
	                buf.append(focus);
	            }
	            queryList.add(buf.toString());
	          //test
	            System.out.println("네이버트랜드용:::::::: eventTitle:"+s);
	        }
		}  
		
	    String query1 = queryList.get(0); 
		String query2 = queryList.get(1);
		String query3 =	queryList.get(2);
		String query4 =	queryList.get(3);
		String query5 =	queryList.get(4);
		
		//test
	    System.out.println("네이버트랜드용:::::::: query1="+query1+"&query2="+query2+"&query3="+query3+"&query4="+query4+"&query5="+query5);
			
	        /**순형오빠가 완성해야할 부분*/
	        //이걸 실행시키면 excel파일이 다운 받아진다.
			String url="http://trend.naver.com/trend.naver?where=download&query1="+query1+"&query2="+query2+"&query3="+query3+"&query4="+query4+"&query5="+query5+"&mobile=0&startDate="+startDate+"&endDate="+endDate;
			//엑셀 API(아파치 POI같은...)를 통해 순위를 구한다
			//순위 정보를 event_issue_point(DB)에 저장한다.
			
			
			
			
			
		return map;
	
	}
}