package com.seoulnori.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.jsoup.Jsoup;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.seoulnori.controller.TwitterController;
import com.seoulnori.vo.Blog;
import com.seoulnori.vo.Event;
import com.seoulnori.vo.EventDetail;
import com.seoulnori.vo.EventNews;
import com.seoulnori.vo.EventPoint;
import com.seoulnori.vo.ImageLink;

@Repository("eventDAO")
public class EventDAOImpl implements EventDAO {


	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public boolean insertParsingEvent(String areaNumber) {
		 int count=0;
		/*서비스 키를 UFT-8로 인코딩*/
		String servicKey = "FvVQjGjJXAqutE9+jkcnqlT8TzfcLnDw+QOn1yx8Yc0/vZK5TqFIatHLkVdi+yhjQXRkQudUwr1vAy3DPG11cw==";
		String query="";
		try {
			query = java.net.URLEncoder.encode(servicKey,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*�Ľ̿� URL����*/
		String baseUrl="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?"; //기본 주소
		String serviceUrl="ServiceKey="+query; //인코딩한 서비스키
		String contentTypeId="&contenttypeid=15"; //분류카테고리. 15는 행사카테고리임.
		/*String cat1="&cat1=A02"; //대분류 1
		String cat2="&cat2=A0207"; //중분류2, 대분류 1이 있어야만함.
		String cat3="&cat3=A0207****"; //소분류 3.대분류1과 중분류2가 있어야만함.*/		
		String startDate="&eventStartDate=20140101";//행사 시작일순으로 자를 때 필요
		String areaCode="&areaCode="+areaNumber;//지역코드. 서울은 1, 인천은 2, 경기도는 31.
		String arrangType="&arrange=A";//파싱해오는 정렬순.A는 제목순,B는 조회순,C는 수정일순,D는 생성일순, E는 거리순. E의 경우 좌표정보가 필요. 
		String numRows="&numOfRows=10000"; //최대로 파싱해오는 갯수
		String osType="&MobileOS=ETC&MobileApp=AppTesting"; //반드시 필요한 정보. 바꾸지말자.
		

		String urlString=baseUrl+serviceUrl+contentTypeId+areaCode+startDate+arrangType+numRows+osType;
		System.out.println(urlString); //�ϼ��� URLȮ�ο�
		
		
		 try {
			URL url  = new URL(urlString);   
			   URLConnection URLconnection = url.openConnection();
			   HttpURLConnection httpConnection = (HttpURLConnection)URLconnection;
			   int responseCode = httpConnection.getResponseCode();
			   
			   if (responseCode== HttpURLConnection.HTTP_OK){
				   InputStream in = httpConnection.getInputStream();
				    
				    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				    DocumentBuilder db = dbf.newDocumentBuilder();
				    Document doc = db.parse(in);
				    
				    
				    Element el = doc.getDocumentElement();
				    NodeList itemList = el.getElementsByTagName("item");
				   
				    for (int itemIdx=0; itemIdx<itemList.getLength(); itemIdx++){
				    	
				    	 Node itemNode = itemList.item(itemIdx);
					     NodeList cdList = itemNode.getChildNodes();
					    
					     String eventId = "";
					     String eventTitle="";
					     String eventAddress="";
					     String addr1="";
					     String addr2="";
					     String eventStartDate="";
					     String eventEndDate="";
					     String eventThumbnail="";
					     String eventGu="";
					     int area=0;
					     int areaGu=0;
					     String categoryNum="";
					     int eventCount=0;
					     
					     for (int cdIdx=0; cdIdx<cdList.getLength(); cdIdx++){
					      Node childNode = cdList.item(cdIdx);
					      if (childNode.getNodeName().equals("contentid")){
					    	  eventId = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("addr1")){
					    	  addr1 = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("addr2")){
					    	  addr2 = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("title")){
					    	  eventTitle = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("eventstartdate")){
					    	  eventStartDate = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("eventenddate")){
					    	  eventEndDate = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("firstimage")){
					    	  eventThumbnail = childNode.getTextContent();
				  
					      }else if (childNode.getNodeName().equals("sigungucode")){
					    	  areaGu = Integer.parseInt(childNode.getTextContent());			  
					      }else if (childNode.getNodeName().equals("cat3")){
					    	  categoryNum = childNode.getTextContent();			  
					      }else if (childNode.getNodeName().equals("readcount")){
					    	  eventCount = Integer.parseInt(childNode.getTextContent());			  
					      }else if(childNode.getNodeName().equals("areacode")){
					    	  area=Integer.parseInt(childNode.getTextContent());	
					      }
				    	
				    }
					
					if(area==1){
						eventGu="S"+areaGu;
					}else if(area==2){
						eventGu="I"+areaGu;
					}else if(area==31){
						eventGu="K"+areaGu;
					}
					eventAddress=addr1+" "+addr2;
					
					/*파싱해온 정보중 스포츠와 영화정보를 걸러내는 구문.
					 * 또한 해당 아이디를 지닌 행사가 이미 존재한다면 업데이트를, 그렇지 않다면 인서트를 하는 구문으로 나눈다.
					 * count는 이렇게 업데이트 혹은 인서트한 레코드가 총 몇개인지 체크하는 것.*/
					if(!(categoryNum.equals("A02081200"))&&!(categoryNum.equals("A02081100"))){
					
						Event event= new Event(eventId, eventTitle, eventAddress, eventStartDate, eventEndDate, 0,eventThumbnail, eventGu, categoryNum,eventCount,0);
						count+=1;
						if(sqlSessionTemplate.selectOne("Event.selectEventByEventId", eventId)!=null){
							sqlSessionTemplate.update("Event.updateParsing", event);
							
						}else{
							sqlSessionTemplate.insert("Event.eventPasing", event);
							
						}
						
					}
					
				
			   }
				    System.out.println(count+"개의 정보를 파싱하였습니다.");
				    
			} else {
				/*연결 실패시*/
			    System.out.println("HTTP connection response !=HTTP_OK");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return count>0;
	}
	
	@Override
	public List<Event> selectEventListNearStation(String mapX, String mapY) {
		List<Event> eventList= new ArrayList<Event>();
		
		String servicKey = "FvVQjGjJXAqutE9+jkcnqlT8TzfcLnDw+QOn1yx8Yc0/vZK5TqFIatHLkVdi+yhjQXRkQudUwr1vAy3DPG11cw==";
		String query="";
		try {
			query = java.net.URLEncoder.encode(servicKey,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String baseUrl="http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?"; //�⺻�ּ�
		String serviceUrl="ServiceKey="+query; 
		String contentTypeId="&contenttypeid=15";
		
		/*mapX는 경도(동경131). mapY는 위도(북위37). 100자로 시작하는게 경도다. 헷갈리지말자.
		 * 다른데는 위도를 X로 경도를 Y로 놓는데 얘들만 이런다. 
		 * EX:var oPoint = new nhn.api.map.LatLng(37.5010226, 127.0396037) =>네이버
		 * 덕분에 지도 API에서 거꾸로 넣는바람에 2시간반동안 에러나서 미치는줄 알았다.그러니 기억, 또 기억하자. */
		String mapXY="&mapX="+mapX+"&mapY="+mapY;
		String radius="&radius=700";//주어진 좌표를 기준으로 한 반경. 기준은 미터(m)이다.
		String arrangType="&arrange=E";//파싱해오는 정렬순.A는 제목순,B는 조회순,C는 수정일순,D는 생성일순, E는 거리순. E의 경우 좌표정보가 필요. 
		String numRows="&numOfRows=10000"; 
		String osType="&MobileOS=ETC&MobileApp=AppTesting"; 
		
		String urlString=baseUrl+serviceUrl+contentTypeId+mapXY+radius+arrangType+numRows+osType;
		System.out.println(urlString); 
		
		
		try {
			URL url  = new URL(urlString);   
			   URLConnection URLconnection = url.openConnection();
			   HttpURLConnection httpConnection = (HttpURLConnection)URLconnection;
			   int responseCode = httpConnection.getResponseCode();
			   
			   if (responseCode== HttpURLConnection.HTTP_OK){
				   InputStream in = httpConnection.getInputStream();
				    
				    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				    DocumentBuilder db = dbf.newDocumentBuilder();
				    Document doc = db.parse(in);
				    
				    
				    Element el = doc.getDocumentElement();
				    NodeList itemList = el.getElementsByTagName("item");
				   
				    for (int itemIdx=0; itemIdx<itemList.getLength(); itemIdx++){
				    	
				    	 Event event=null;
				    	 Node itemNode = itemList.item(itemIdx);
					     NodeList cdList = itemNode.getChildNodes();
					    
					     String eventId = "";

					     
					     for (int cdIdx=0; cdIdx<cdList.getLength(); cdIdx++){
						     Node childNode = cdList.item(cdIdx);
						     if (childNode.getNodeName().equals("contentid")){
						    	  eventId = childNode.getTextContent();
						     }
						      
						    
						     }
					     event= sqlSessionTemplate.selectOne("Event.selectEventByEventIdBySysdate", eventId);
					    	
					     if(event!=null){
					    	 eventList.add(event);
					     }

				   }
				
				    
			   } else {
				
			    System.out.println("HTTP connection response !=HTTP_OK");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return eventList;
	}

	@Override
	public boolean updateEvent(Event event) {
		
		//이벤트의 이미지만 업데이트 하는 메서드
		return sqlSessionTemplate.update("Event.updateEventImage", event)>0;
	}
	
	@Override
	public boolean updateEventIssuePoint(String eventId, int evnetIssuePoint) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("eventId", eventId);
		map.put("evnetIssuePoint", evnetIssuePoint);
			
		return sqlSessionTemplate.update("Event.updateEventIssuePoint", map)>0;
	}

	@Override
	public Event selectEventByEventId(String eventId) {
		return sqlSessionTemplate.selectOne("Event.selectEventByEventId", eventId);
	}

	@Override
	public EventDetail parsingEventByEventId(String eventId) {

		
		
		 EventDetail eventDetail=new EventDetail();
		 Event event=sqlSessionTemplate.selectOne("Event.selectEventByEventId", eventId);
		
		 eventDetail.setEventId(eventId);
		 eventDetail.setEventTitle(event.getEventTitle());
		 eventDetail.setEventAddress(event.getEventAddress());
		 eventDetail.setEventStartDate(event.getEventStartDate());
		 eventDetail.setEventEndDate(event.getEventEndDate());
		 eventDetail.setEventAvgStar(event.getEventAvgStar());
		 eventDetail.setEventThumbnail(event.getEventThumbnail());
		 eventDetail.setEventGu(event.getEventGu());
		 eventDetail.setCategoryNum(event.getCategoryNum());
		 eventDetail.setEventCount(event.getEventCount());
		 eventDetail.setEventIssuePoint(event.getEventIssuePoint());

		 
			String servicKey = "FvVQjGjJXAqutE9+jkcnqlT8TzfcLnDw+QOn1yx8Yc0/vZK5TqFIatHLkVdi+yhjQXRkQudUwr1vAy3DPG11cw==";
			String query="";
			try {
				query = java.net.URLEncoder.encode(servicKey,"UTF-8");
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			/*�Ľ̿� URL����*/
			String commonUrl="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?";
			String introUrl="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?";
			String serviceUrl="ServiceKey="+query;

			String contentId="&contentId="+eventId; /*검색하고자 하는 행사의 아이디를 넣는다.*/	
			String contentTypeId="&contentTypeId=15";/*행사들의 총 분류카테고리인 15�*/	
			
			//다저올 정보들에 대한 체크
			String option="&defaultYN=Y&firstImageYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
			
			String osType="&MobileOS=ETC&MobileApp=AppTesting";
			
			
			String commonUrlString=commonUrl+serviceUrl+contentId+option+osType;
			String introUrlString=introUrl+serviceUrl+contentId+contentTypeId+osType;
			
			System.out.println(commonUrlString); // commonUrl체크
			System.out.println(introUrlString); // introUrl체크
			
			
			 try {
				   URL url1  = new URL(commonUrlString);   
				   URL url2  = new URL(introUrlString);   
				   URLConnection URLconnection1 = url1.openConnection();
				   URLConnection URLconnection2 = url2.openConnection();
				   
				   
				   HttpURLConnection httpConnection1 = (HttpURLConnection)URLconnection1;
				   HttpURLConnection httpConnection2 = (HttpURLConnection)URLconnection2;
				   
				   int responseCode1 = httpConnection1.getResponseCode();
				   int responseCode2 = httpConnection2.getResponseCode();
				   
				   if (responseCode1== HttpURLConnection.HTTP_OK){
				    InputStream in = httpConnection1.getInputStream();
				    
				    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				    DocumentBuilder db = dbf.newDocumentBuilder();
				    Document doc = db.parse(in);
				    
		
				    Element el = doc.getDocumentElement();
				    NodeList itemList = el.getElementsByTagName("item"); 
				    for (int itemIdx=0; itemIdx<itemList.getLength(); itemIdx++) {
				     Node itemNode = itemList.item(itemIdx);
				     NodeList cdList = itemNode.getChildNodes();
				     
				     

				     String mapX="";
				     String mapY="";
				     String eventPhone="";
				     String eventContent="";
				     
				     for (int cdIdx=0; cdIdx<cdList.getLength(); cdIdx++) {
				      Node childNode = cdList.item(cdIdx);
				      if (childNode.getNodeName().equals("contentid")){
				    	  eventId = childNode.getTextContent();
				     
				      }else if (childNode.getNodeName().equals("mapx")){
				    	  mapX = childNode.getTextContent();
				      }else if  (childNode.getNodeName().equals("mapy")){
				    	  mapY = childNode.getTextContent();
				      }else if (childNode.getNodeName().equals("tel")){
				    	  eventPhone  = childNode.getTextContent();
				      }else if (childNode.getNodeName().equals("overview")){
				    	  eventContent = childNode.getTextContent();
				      }
				     }
				     
				     eventDetail.setMapX(mapX);
				     eventDetail.setMapY(mapY);
				     eventDetail.setEventPhone(eventPhone);
				     eventDetail.setEventContent(eventContent);
				     
				    }
				   }
				   else {
				    System.out.println("HTTP connection response !=HTTP_OK");
				   }
				  
				  if (responseCode2== HttpURLConnection.HTTP_OK) {
				    InputStream in = httpConnection2.getInputStream();
				    
				    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				    DocumentBuilder db = dbf.newDocumentBuilder();
				    Document doc = db.parse(in);
				    
				    
				    Element el = doc.getDocumentElement();
				    NodeList itemList = el.getElementsByTagName("item"); 
				    for (int itemIdx=0; itemIdx<itemList.getLength(); itemIdx++){
				     Node itemNode = itemList.item(itemIdx);
				     NodeList cdList = itemNode.getChildNodes();
				     
				     String eventAgeLimit = "";
				     String eventCost="";
				     String bookingPlace="";
				     String eventHompage="";
				     String eventPlace="";
				     String playTime="";
				     
				     for (int cdIdx=0; cdIdx<cdList.getLength(); cdIdx++)  {
				      Node childNode = cdList.item(cdIdx);
				      if (childNode.getNodeName().equals("agelimit")){
				    	  eventAgeLimit = childNode.getTextContent();				   
				      }else if (childNode.getNodeName().equals("usetimefestival")){
				    	  eventCost = childNode.getTextContent();
				      }else if (childNode.getNodeName().equals("bookingplace")){
				    	  bookingPlace = childNode.getTextContent();
				      }else if (childNode.getNodeName().equals("eventhompage")){
				    	  eventHompage = childNode.getTextContent();
				      }else if (childNode.getNodeName().equals("eventplace")){
				    	  eventPlace = childNode.getTextContent();
				      }else if (childNode.getNodeName().equals("playtime")){
				    	  playTime = childNode.getTextContent();
				      }
				     }
				     

				     eventDetail.setEventAgeLimit(eventAgeLimit);
				     eventDetail.setEventCost(eventCost);
				     eventDetail.setBookingPlace(bookingPlace);
				     eventDetail.setEventHompage(eventHompage);
				     eventDetail.setEventPlace(eventPlace);
				     eventDetail.setPlayTime(playTime);

				    }
				   }else{
				    System.out.println("HTTP connection response !=HTTP_OK");
				   }
				  } catch (Exception e){
				   e.printStackTrace();
				  }

			System.out.println(eventDetail);
			return eventDetail;
	}

	@Override
	public List<Event> selectEventListOrderByIssuePoint() {
		
		return sqlSessionTemplate.selectList("Event.selectEventListOrderByIssuePoint");
	}

	@Override
	public List<Event> selectEventListOrderByEventCount(String categoryNum) {
		return sqlSessionTemplate.selectList("Event.selectEventListOrderByEventCount", categoryNum);
	}

	@Override
	public List<Event> selectEventListByEventCategory(String categoryNum, String order) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		
		if(categoryNum==null||categoryNum.trim()==""){
			return sqlSessionTemplate.selectList("Event.selectAllEventListOrderByIssue");
		}
		
		

		map.put("categoryNum", categoryNum);
		map.put("order", order);
		if(order.equals("issuePoint")){
			return sqlSessionTemplate.selectList("Event.selectEventListByEventCategoryOrderByIssue", map);
		}else if(order.equals("avgStar")){
			return sqlSessionTemplate.selectList("Event.selectEventListByEventCategoryOrderByStar", map);

		}else if(order.equals("startDate")){
			return sqlSessionTemplate.selectList("Event.selectEventListByEventCategoryOrderByDate", map);

		}
		
		return sqlSessionTemplate.selectList("Event.selectEventListByEventCategoryOrderByIssue", map);
		
	}

	@Override
	public List<Event> selectEventListByEventCategoryPaging(String categoryNum, String order, int startNo, int endNo) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("categoryNum", categoryNum);
		map.put("order", order);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		if(order.equals("issuePoint")){
			return sqlSessionTemplate.selectList("Event.selectEventListByEventCategoryOrderByIssuePaging", map);
		}else if(order.equals("avgStar")){
			return sqlSessionTemplate.selectList("Event.selectEventListByEventCategoryOrderByStarPaging", map);
			
		}else if(order.equals("startDate")){
			return sqlSessionTemplate.selectList("Event.selectEventListByEventCategoryOrderByDatePaging", map);
			
		}
		
		return sqlSessionTemplate.selectList("Event.selectEventListByEventCategoryOrderByIssuePaging", map);
		
	}
	
	@Override
	public List<Event> selectEventListByEventGu(String eventGu) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("eventGu", eventGu);
		
		return sqlSessionTemplate.selectList("Event.selectEventListByEventGu", map);
	}

	@Override
	public List<Event> selectEventListByKeyword(String keyword, String order) {
	
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		
		//받아온 order에 따라 sorting이 다르기에 SQL을 구분.
		if(order.equals("issuePoint")){
			return sqlSessionTemplate.selectList("Event.selectEventListByKeywordOrderByIssue", map);
		}else if(order.equals("avgStar")){
			return sqlSessionTemplate.selectList("Event.selectEventListByKeywordOrderByStar", map);
		}else if(order.equals("startDate")){
			return sqlSessionTemplate.selectList("Event.selectEventListByKeywordOrderByDate", map);
		}
	
		
		
		return sqlSessionTemplate.selectList("Event.selectEventListByKeywordOrderByIssue", map);
	}
	
	@Override
	public List<Event> selectEventListByKeywordPaging(String keyword, String order,int startNo,int endNo) {
	
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		//받아온 order에 따라 sorting이 다르기에 SQL을 구분.
		if(order.equals("issuePoint")){
			return sqlSessionTemplate.selectList("Event.selectEventListByKeywordOrderByIssuePaging", map);
		}else if(order.equals("avgStar")){
			return sqlSessionTemplate.selectList("Event.selectEventListByKeywordOrderByStarPaging", map);
		}else if(order.equals("startDate")){
			return sqlSessionTemplate.selectList("Event.selectEventListByKeywordOrderByDatePaging", map);
		}
	
		
		
		return sqlSessionTemplate.selectList("Event.selectEventListByKeywordOrderByIssuePaging", map);
	}

	@Override
	public String getCategoryNumByEventId(String eventId) {
		return sqlSessionTemplate.selectOne("Event.getCategoryNumByEventId", eventId);
	}

	@Override
	public List<Event> searchDetail(String detailKeyword, String selectPlace,
			String categoryCheck, String datepicker, String order) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(detailKeyword!=null&&detailKeyword.trim()==""){
			detailKeyword=null;
		}
		if(categoryCheck!=null&&categoryCheck.trim()==""){
			categoryCheck=null;
		}
		if(datepicker!=null&&datepicker.trim()==""){
			datepicker=null;
		}
		if(selectPlace!=null&&selectPlace.trim()==""){
			selectPlace=null;
		}
		
		map.put("categoryCheck", categoryCheck);
		map.put("detailKeyword", detailKeyword);
		map.put("selectPlace", selectPlace);	
		map.put("datepicker", datepicker);
		
		System.out.println(map);
		if(order==null||order.trim()==""){
			order="issuePoint";
		}
		
		if(order.equals("issuePoint")){
			return sqlSessionTemplate.selectList("Event.selectEventListByDetailSearchByIssue", map);
		}else if(order.equals("avgStar")){
			return sqlSessionTemplate.selectList("Event.selectEventListByDetailSearchByStar", map);
		}else if(order.equals("startDate")){
			return sqlSessionTemplate.selectList("Event.selectEventListByDetailSearchByDate", map);
		}
		
		
		return sqlSessionTemplate.selectList("Event.selectEventListByDetailSearchByIssue", map);
	}

	@Override
	public List<Event> searchDetailPaging(String detailKeyword, String selectPlace,
			String categoryCheck, String datepicker, String order,int startNo,int endNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(detailKeyword!=null&&detailKeyword.trim()==""){
			detailKeyword=null;
		}
		if(categoryCheck!=null&&categoryCheck.trim()==""){
			categoryCheck=null;
		}
		if(datepicker!=null&&datepicker.trim()==""){
			datepicker=null;
		}
		if(selectPlace!=null&&selectPlace.trim()==""){
			selectPlace=null;
		}
		
		map.put("categoryCheck", categoryCheck);
		map.put("detailKeyword", detailKeyword);
		map.put("selectPlace", selectPlace);	
		map.put("datepicker", datepicker);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		System.out.println(map);
		if(order==null||order.trim()==""){
			order="issuePoint";
		}
		
		if(order.equals("issuePoint")){
			return sqlSessionTemplate.selectList("Event.selectEventListByDetailSearchByIssuePaging", map);
		}else if(order.equals("avgStar")){
			return sqlSessionTemplate.selectList("Event.selectEventListByDetailSearchByStarPaging", map);
		}else if(order.equals("startDate")){
			return sqlSessionTemplate.selectList("Event.selectEventListByDetailSearchByDatePaging", map);
		}
		
		
		return sqlSessionTemplate.selectList("Event.selectEventListByDetailSearchByIssuePaging", map);
	}
	
	@Override
	public List<ImageLink> searchEventImageByInternet(String eventTitle) {
		
		//바꾸고자하는 이미지 파일을 네이버 검색API를 통해 검색해오는 메서드
		
		String serviceKey="444f0b2019ac8cf4c576a9029dfe488f";
		
		String query="";
		
		try {
			query = java.net.URLEncoder.encode(eventTitle,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		String baseUrl="http://openapi.naver.com/search?key="+serviceKey+"&query=";
		String option="&target=image&start=1&display=5";

		
		String urlString=baseUrl+query+option;
		System.out.println(urlString);
		
		List<ImageLink> imageList=new ArrayList<ImageLink>(); 
		
		 try {
				URL url  = new URL(urlString);   
				   URLConnection URLconnection = url.openConnection();
				   HttpURLConnection httpConnection = (HttpURLConnection)URLconnection;
				   int responseCode = httpConnection.getResponseCode();
				   
				   if (responseCode== HttpURLConnection.HTTP_OK){
					   InputStream in = httpConnection.getInputStream();
					    
					    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
					    DocumentBuilder db = dbf.newDocumentBuilder();
					    Document doc = db.parse(in);
					    
					    
					    Element el = doc.getDocumentElement();
					    NodeList itemList = el.getElementsByTagName("item");
					   
					    for (int itemIdx=0; itemIdx<itemList.getLength(); itemIdx++){
					    	
					    	 Node itemNode = itemList.item(itemIdx);
						     NodeList cdList = itemNode.getChildNodes();
						    
						     String imageLink = "";
						     String sizeWidth="";
						     String sizeHeight="";
						     
						     
						     for (int cdIdx=0; cdIdx<cdList.getLength(); cdIdx++){
						      Node childNode = cdList.item(cdIdx);
						      if (childNode.getNodeName().equals("link")){
						    	  imageLink = childNode.getTextContent();
						      }else if (childNode.getNodeName().equals("sizewidth")){
						    	  sizeWidth = childNode.getTextContent();
						      }else if (childNode.getNodeName().equals("sizeheight")){
						    	  sizeHeight = childNode.getTextContent();
						      }
					    	
						     
						      
					    }
						
						     System.out.println(imageLink);
						      System.out.println(sizeWidth);
						      System.out.println(sizeHeight);
						      imageList.add(new ImageLink(imageLink, sizeWidth, sizeHeight));
						
					
				   }

					    
				} else {
					/*연결 실패시*/
				    System.out.println("HTTP connection response !=HTTP_OK");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
		
		
		return imageList;
	}

	@Override
	public List<Event> selectEventListByCalendarDate(String calendarDate, String category) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(category==null){
			category="all";
		}		
		map.put("calendarDate", calendarDate);
		map.put("category", category);
		
		return sqlSessionTemplate.selectList("Event.selectEventListByCalendarDate", map);
	}

	@Override
	public boolean updateEventAvgStar(Event event) {
		return sqlSessionTemplate.update("Event.updateEventAvgStar", event)>0;
	}

	@Override
	public int selectPageCount(String categoryNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("categoryNum", categoryNum);
		return sqlSessionTemplate.selectOne("Event.selectPageCount", map);
	}


	public boolean updateIssuePoint(){
		boolean flag=false;
		int i=0;
		List<Event> eventList=sqlSessionTemplate.selectList("Event.selectAllEventList");
		for(Event e:eventList){				
			
			EventPoint eventPoint=sqlSessionTemplate.selectOne("EventPoint.selectEventPointByEventId", e.getEventId());
			if(eventPoint!=null){
			int newsCount=0;		
			int readCount=e.getEventCount();
			int tweetPoint=0;
			if(eventPoint.getTweetPoint()!=0){
				tweetPoint=eventPoint.getTweetPoint();
			};
			int naverTrendPoint=eventPoint.getNaverTrendPoint();
			long endMillis=System.currentTimeMillis();
			long startMillis=endMillis-(1000*60*60*24*7);
			
			
			List<EventNews> newsList=findEventNewsForCount(e.getEventTitle());
			
			for(EventNews en:newsList){
				Date date=new Date(en.getEventPublishedDate());
				long millis=date.getTime();
				
				if(millis>startMillis&&millis<endMillis){
					newsCount+=1;
				}
			}

			
			int newIssuePoint=0;
			if(readCount!=0){
				
			newIssuePoint=(readCount/2000)+naverTrendPoint+tweetPoint+newsCount;//조회수/2000에 일주일간의 트위터카운트수와 뉴스 카운트수를 더함.
			System.out.println("리드카운트:::::::"+(readCount/2000));
			System.out.println("일주일사이의 트윗카운트:::::::"+tweetPoint);
			System.out.println("일주일사이의 뉴스카운트:::::::"+newsCount);
			System.out.println("일주일사이의 네이버트렌드카운트:::::::"+naverTrendPoint);
			i+=1;
			System.out.println("진행한 업데이트 회수::::::"+i+"회");
			}else{
				newIssuePoint=naverTrendPoint+tweetPoint+newsCount;
				System.out.println("일주일사이의 트윗카운트:::::::"+tweetPoint);
				System.out.println("일주일사이의 뉴스카운트:::::::"+newsCount);
				System.out.println("일주일사이의 네이버트렌드카운트:::::::"+naverTrendPoint);

				i+=1;
				System.out.println("진행한 업데이트 회수::::::"+i+"회");
			}
			e.setEventIssuePoint(newIssuePoint);
			flag=sqlSessionTemplate.update("Event.updateEventIssuePoint", e)>0;			
		}
		}
		return flag;
	}

	
	@Override
	public List<Blog> parsingEventReviewBlog(String eventTitle) {
		String serviceKey="444f0b2019ac8cf4c576a9029dfe488f";
		
		String query="";
		
		try {
			query = java.net.URLEncoder.encode(eventTitle,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		String baseUrl="http://openapi.naver.com/search?key="+serviceKey+"&query=";
		String option="&display=6&start=1&target=blog&sort=sim";
		
		String urlString=baseUrl+query+option;
		System.out.println(urlString);
		List<Blog> blogList=new ArrayList<Blog>(); 

		try {
			URL url  = new URL(urlString);   
			   URLConnection URLconnection = url.openConnection();
			   HttpURLConnection httpConnection = (HttpURLConnection)URLconnection;
			   int responseCode = httpConnection.getResponseCode();
			   
			   if (responseCode== HttpURLConnection.HTTP_OK){
				   InputStream in = httpConnection.getInputStream();
				    
				    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				    DocumentBuilder db = dbf.newDocumentBuilder();
				    Document doc = db.parse(in);
				    
				    
				    Element el = doc.getDocumentElement();
				    NodeList itemList = el.getElementsByTagName("item");
				   
				    for (int itemIdx=0; itemIdx<itemList.getLength(); itemIdx++){
				    	
				    	 Node itemNode = itemList.item(itemIdx);
					     NodeList cdList = itemNode.getChildNodes();
					    
					     String blogTitle = "";
					     String blogDescription="";
					     String blogLink="";
					     
					     
					     for (int cdIdx=0; cdIdx<cdList.getLength(); cdIdx++){
					      Node childNode = cdList.item(cdIdx);
					      if (childNode.getNodeName().equals("title")){
					    	  blogTitle = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("description")){
					    	  blogDescription = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("link")){
					    	  blogLink = childNode.getTextContent();
					      }
				    	
					     
					      
				    }

					      blogList.add(new Blog(blogTitle, blogDescription, blogLink));
					
				
			   }

				    
			} else {
				/*연결 실패시*/
			    System.out.println("HTTP connection response !=HTTP_OK");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return blogList;
	}

	@Override
	public List<Event> selectAllEventListAsNoImage() {
		return sqlSessionTemplate.selectList("Event.selectAllEventListAsNoImage");
	}

	@Override
	public boolean eventDateCheck(String eventId,String strDate) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("eventId", eventId);
		map.put("strDate", strDate);

		
		return sqlSessionTemplate.selectOne("Event.eventDateCheck", map)!=null;
	}

	@Override
	public Event selectEventByEventIdBySysdate(String eventId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("Event.selectEventByEventIdBySysdate", eventId);
	}

	@Override
	public List<String> selectEventTitleByEventIssuePoint() {
		
		return sqlSessionTemplate.selectList("Event.selectEventTitleByEventIssuePoint");
	}

	@Override
	public boolean naverTrendCheck() {
		boolean flag=false;
		
		List<String> titleList=sqlSessionTemplate.selectList("Event.selectEventTitleByEventIssuePoint");
		
		
		
		
		ArrayList<String> queryList=new ArrayList<String>();
		for(String query:titleList){
			
			//연도 제거
			Calendar now = Calendar.getInstance();
			String year= String.valueOf(now.get(Calendar.YEAR));
			if(query.indexOf(year)!=-1){
				query = query.substring(0, query.indexOf(year)-1);
			}
			
			//괄호 제거 1
			if(query.indexOf("[")!=-1 && query.indexOf("]")!=-1){
				String inside = query.substring(query.indexOf("[")+1,query.indexOf("]"));
				query = query.substring(0, query.indexOf("["))+inside;
			}	
			//괄호 제거 2
			if(query.indexOf("(")!=-1 && query.indexOf(")")!=-1){
				String inside = query.substring(query.indexOf("(")+1,query.indexOf(")"));
				if(inside.length()>5||inside.equals("수원")||inside.equals("용인")){
					query = query.substring(0, query.indexOf("("));
				}else{
				query = query.substring(0, query.indexOf("("))+inside;
				}
			}
			//괄호 제거 3
			if(query.indexOf("{")!=-1 && query.indexOf("}")!=-1){
				String inside = query.substring(query.indexOf("{")+1,query.indexOf("}"));
				query = query.substring(0, query.indexOf("{"))+inside;
			}	
			//괄호 제거 4
			if(query.indexOf("<")!=-1 && query.indexOf(">")!=-1){
				String inside = query.substring(query.indexOf("<")+1,query.indexOf(">"));
				query = query.substring(0, query.indexOf("<"))+inside;
			}
		
			
			//따옴표 제거 2
			if(query.indexOf('"')!=-1 && query.substring(0,query.indexOf('"')).indexOf('"')!=-1){
				String inside = query.substring(query.indexOf('"')+1,query.indexOf('"')-1);
				query = query.substring(0, query.indexOf('"'))+inside;
			}
			
			
			// : 제거
			if(query.indexOf(":")!=-1){
				String behind = query.substring(query.indexOf(":")+1,query.length());
				query = query.substring(0,query.indexOf(":"))+" "+behind;
			}
			// - 제거
			if(query.indexOf("-")!=-1){
				String behind = query.substring(query.indexOf("-")+1,query.length());
				query = query.substring(0,query.indexOf("-"))+" "+behind;
			}
			// , 제거
			if(query.indexOf(",")!=-1){
				String behind = query.substring(query.indexOf(",")+1,query.length());
				query = query.substring(0,query.indexOf(","))+" "+behind;
			}
			// / 제거
			if(query.indexOf("/")!=-1){
				String behind = query.substring(query.indexOf("/")+1,query.length());
				query = query.substring(0,query.indexOf("/"))+" "+behind;
			}
			// ? 제거
			if(query.indexOf("?")!=-1){
				String behind = query.substring(query.indexOf("?")+1,query.length());
				query = query.substring(0,query.indexOf("?"))+" "+behind;
			}	
			// ! 제거
			if(query.indexOf("!")!=-1){
				String behind = query.substring(query.indexOf("!")+1,query.length());
				query = query.substring(0,query.indexOf("!"))+" "+behind;
					}	
			// ~ 제거
			if(query.indexOf("~")!=-1){
				String behind = query.substring(query.indexOf("~"),query.length());
				query = query.substring(0,query.indexOf("~"))+" "+behind;
			}
		
			// 2~4탄까지 
			if(query.indexOf("2탄")!=-1){
				query = query.substring(0, query.indexOf("2탄")+2);
			}
			
			if(query.indexOf("3탄")!=-1){
				query = query.substring(0, query.indexOf("3탄")+2);
			}
			
			if(query.indexOf("4탄")!=-1){
				query = query.substring(0, query.indexOf("4탄")+2);
			}
			
			
			if(query.indexOf("연극")!=-1){
				//연극이라는 글자가 뒤에 존재하는 경우
				if(query.substring(0,query.indexOf("연극")).length()>0){	
					query = query.substring(0,query.indexOf("연극")+3);
					
				//연극으로 시작되는 행사제목일경 경우	
				}
					//'연극'을 제외한 문자열의 길이가 5이상인 경우
					if(query.substring(query.indexOf("연극")+2,query.length()).trim().length()>=5){
						//'연극'을 잘라낸다
						query = query.substring(query.indexOf("연극")+2,query.length());					
					
				}
			}
			

			if(query.indexOf("코믹극")!=-1){
				//코믹극이라는 글자가 뒤에 존재하는 경우
				if(query.substring(0,query.indexOf("코믹극")).length()>0){	
					query = query.substring(query.indexOf("코믹극"), query.length());
					
				
				}//코믹극으로 시작되는 행사제목일경 경우	
					//'코믹극'을 제외한 문자열의 길이가 3보다 클 경우
					if(query.substring(query.indexOf("코믹극")+3,query.length()).trim().length()>3){
						//'코믹극'을 잘라낸다
						query = query.substring(query.indexOf("코믹극")+3,query.length());	
						query = "연극"+query;
					
				}
			}
		
			
			if(query.indexOf("뮤지컬")!=-1){
				if(query.substring(0,query.indexOf("뮤지컬")).length()>0){	
					query = query.substring(query.indexOf("뮤지컬"), query.length());
					
				}
				//뮤지컬 이라는 글자로 시작하는 경우
					if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>0){
						//'뮤지컬'을 제외한 문자열의 길이가 4보다 클 경우
						if(query.substring(query.indexOf("뮤지컬")+3,query.length()).trim().length()>=5){
							//'뮤지컬'을 잘라낸다
							query = query.substring(query.indexOf("뮤지컬")+3,query.length());					
						}
					}
				
			}
			
		
		
			
			if(query.indexOf("화랑")!=-1){
				query = "대학로 "+query;
			}
			
			if(query.indexOf("연극 행복")!=-1){
				query = "대학로 "+query;	
			}
			
			if(query.indexOf("추격자")!=-1){
				query = "넌버벌 퍼포먼스 "+query;	
			}
			
			if(query.indexOf("동치미")!=-1){
				query = "연극 "+query;	
			}

			if(query.indexOf("담배가게 아가씨")!=-1){
				query = "뮤지컬 "+query;	
			}
			
			if(query.indexOf("삼청각 런치콘서트")!=-1){
				query = "삼청각 자미";
			}
			
			
			queryList.add(query);
			
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd"); 
		
		long currentTime = System.currentTimeMillis();  //현재 시간 
		Date current = new Date(currentTime); 
		long endTime=0;
		
		if(Integer.parseInt(sdf2.format(current))%7==0){
			endTime=currentTime-((Integer.parseInt(sdf2.format(current))+1)%7)*1000*60*60*24-7*1000*60*60*24;
		}else{
			endTime=currentTime-((Integer.parseInt(sdf2.format(current)))%7)*1000*60*60*24-7*1000*60*60*24;
		}
		
		long startTime = endTime-(8*24*60*60*1000);  



		Date endd = new Date(endTime);  
		Date startt = new Date(startTime);  
		
		
	
		/**순형오빠가 고쳐야할 부분*/
		String end =sdf.format(endd);  //currentTime을 20140612 이런 식으로 변환 필요
		String start=sdf.format(startt);    //futureTime을 20140619 이런 식으로 변환 필요
 		
		System.out.println(start);
		System.out.println(end);
	
		
		HttpClient httpClient = new DefaultHttpClient();
		String baseUrl="http://trend.naver.com/trend.naver?where=trend&mobile=0";
		String startDate="&startDate="+start;
		String endDate="&endDate="+end;
		
		
		
		String query1=null;
		String query2=null;
		String query3=null;
		String query4=null;
		String query5=null;
		try {
			query1 = "&query1="+URLEncoder.encode(queryList.get(0),"UTF-8");
			query2 = "&query2="+URLEncoder.encode(queryList.get(1),"UTF-8");
			query3 = "&query3="+URLEncoder.encode(queryList.get(2),"UTF-8");
			query4 = "&query4="+URLEncoder.encode(queryList.get(3),"UTF-8");		
			query5 = "&query5="+URLEncoder.encode(queryList.get(4),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String querys=query1+query2+query3+query4+query5;
		String finalUrl=baseUrl+startDate+endDate+querys;
		
		
		System.out.println(finalUrl);
		HttpGet httpget1 = new HttpGet(finalUrl);
		
		
		String content="";
		try {
			content=httpClient.execute(httpget1, new BasicResponseHandler() {
				 @Override
				    public String handleResponse(HttpResponse response) throws HttpResponseException,
				        IOException {
				      
				      String res = new String(super.handleResponse(response).getBytes(), "euc-kr");
				      org.jsoup.nodes.Document doc = Jsoup.parse(res);
				      System.out.println(doc);
				      Elements rows =  doc.select("em");
				      
				     String a1= rows.get(1).text();
				     String a2= rows.get(2).text();
				     String a3= rows.get(3).text();
				     String a4= rows.get(4).text();
				     String a5= rows.get(5).text();
				      
				     System.out.println("첫번째"+a1);
				     System.out.println("두번쨰"+a2);
				     System.out.println("세번쨰"+a3);
				     System.out.println("네번째"+a4);
				     System.out.println("다섯번째"+a5);
				     
				     float first=Integer.parseInt(a1);
				     float second=Integer.parseInt(a2);
				     float third=Integer.parseInt(a3);
				     float fourth=Integer.parseInt(a4);
				     float fifth=Integer.parseInt(a5);
				    		 
				     List<Event> eventList=sqlSessionTemplate.selectList("Event.selectAllEventListOrderByIssue");
				    
				     Event event1=eventList.get(0);
				     System.out.println(event1);
				     Event event2=eventList.get(1);
				     Event event3=eventList.get(2);
				     Event event4=eventList.get(3);
				     Event event5=eventList.get(4);
				   
				     int firstChange=0;
				     if(first!=0){
				    	 firstChange=(int) ((event1.getEventIssuePoint())*(1+(first/(first+second+third+fourth+fifth))));
				     }else{
				    	 firstChange=(int) (event1.getEventIssuePoint()*0.8);
				     }
				     System.out.println("첫번째 바뀌는 숫자:::::::::::::"+firstChange);
				     event1.setEventIssuePoint(firstChange);
				     sqlSessionTemplate.update("Event.updateEventIssuePoint", event1);
				     
				     
				     int secondChange=0;
				     if(second!=0){
				    	 secondChange=(int) ((event2.getEventIssuePoint())*(1+(second/(first+second+third+fourth+fifth))));
				     }else{
				    	 secondChange=(int) (event2.getEventIssuePoint()*0.8);
				     }
				     event2.setEventIssuePoint(secondChange);
				     sqlSessionTemplate.update("Event.updateEventIssuePoint", event2);
				     
				     int thirdChange=0;
				     if(third!=0){
				     	thirdChange=(int) ((event3.getEventIssuePoint())*(1+(third/(first+second+third+fourth+fifth))));
				     }else{
				    	thirdChange=(int) (event3.getEventIssuePoint()*0.8);
				     }
				     event3.setEventIssuePoint(thirdChange);
				     sqlSessionTemplate.update("Event.updateEventIssuePoint", event3);
				     
				     
				     
				     int fourthChange=0;
				     if(fourth!=0){
				     	fourthChange=(int) ((event4.getEventIssuePoint())*(1+(fourth/(first+second+third+fourth+fifth))));
				     }else{
				    	 fourthChange=(int) (event4.getEventIssuePoint()*0.8);
				     }
				     event4.setEventIssuePoint(fourthChange);
				     sqlSessionTemplate.update("Event.updateEventIssuePoint", event4);
				     
				     int fifthChange=0;
				     if(fifth!=0){
					     fifthChange=(int) ((event5.getEventIssuePoint())*(1+(fifth/(first+second+third+fourth+fifth)))); 
				     }else{
				    	 fifthChange=(int)(event5.getEventIssuePoint()*0.8);
				     }
				     event5.setEventIssuePoint(fifthChange);
				     sqlSessionTemplate.update("Event.updateEventIssuePoint", event5);
				     
				      return "success";
				    }
			});
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(content.equals("success")){
			flag=true;
		}
		
		
		
		return flag;
	}

	
	@Override
	public List<EventNews> findEventNewsOnlyFive(String query) {
		
	
		//연도 제거
				Calendar now = Calendar.getInstance();
				String year= String.valueOf(now.get(Calendar.YEAR));
				if(query.indexOf(year)!=-1){
					query = query.substring(0, query.indexOf(year)-1);
				}
				
				//괄호 제거 1
				if(query.indexOf("[")!=-1 && query.indexOf("]")!=-1){
					String inside = query.substring(query.indexOf("[")+1,query.indexOf("]"));
					query = query.substring(0, query.indexOf("["))+inside;
				}	
				//괄호 제거 2
				if(query.indexOf("(")!=-1 && query.indexOf(")")!=-1){
					String inside = query.substring(query.indexOf("(")+1,query.indexOf(")"));
					if(inside.length()>5||inside.equals("수원")||inside.equals("용인")){
						query = query.substring(0, query.indexOf("("));
					}else{
					query = query.substring(0, query.indexOf("("))+inside;
					}
				}
				//괄호 제거 3
				if(query.indexOf("{")!=-1 && query.indexOf("}")!=-1){
					String inside = query.substring(query.indexOf("{")+1,query.indexOf("}"));
					query = query.substring(0, query.indexOf("{"))+inside;
				}	
				//괄호 제거 4
				if(query.indexOf("<")!=-1 && query.indexOf(">")!=-1){
					String inside = query.substring(query.indexOf("<")+1,query.indexOf(">"));
					query = query.substring(0, query.indexOf("<"))+inside;
				}
			
				
				//따옴표 제거 2
				if(query.indexOf('"')!=-1 && query.substring(0,query.indexOf('"')).indexOf('"')!=-1){
					String inside = query.substring(query.indexOf('"')+1,query.indexOf('"')-1);
					query = query.substring(0, query.indexOf('"'))+inside;
				}
				
				
				// : 제거
				if(query.indexOf(":")!=-1){
					String behind = query.substring(query.indexOf(":")+1,query.length());
					query = query.substring(0,query.indexOf(":"))+" "+behind;
				}
				// - 제거
				if(query.indexOf("-")!=-1){
					String behind = query.substring(query.indexOf("-")+1,query.length());
					query = query.substring(0,query.indexOf("-"))+" "+behind;
				}
				// , 제거
				if(query.indexOf(",")!=-1){
					String behind = query.substring(query.indexOf(",")+1,query.length());
					query = query.substring(0,query.indexOf(","))+" "+behind;
				}
				// / 제거
				if(query.indexOf("/")!=-1){
					String behind = query.substring(query.indexOf("/")+1,query.length());
					query = query.substring(0,query.indexOf("/"))+" "+behind;
				}
				// ? 제거
				if(query.indexOf("?")!=-1){
					String behind = query.substring(query.indexOf("?")+1,query.length());
					query = query.substring(0,query.indexOf("?"))+" "+behind;
				}	
				// ! 제거
				if(query.indexOf("!")!=-1){
					String behind = query.substring(query.indexOf("!")+1,query.length());
					query = query.substring(0,query.indexOf("!"))+" "+behind;
						}	
				// ~ 제거
				if(query.indexOf("~")!=-1){
					String behind = query.substring(query.indexOf("~"),query.length());
					query = query.substring(0,query.indexOf("~"))+" "+behind;
				}
			
				// 2~4탄까지 
				if(query.indexOf("2탄")!=-1){
					query = query.substring(0, query.indexOf("2탄")+2);
				}
				
				if(query.indexOf("3탄")!=-1){
					query = query.substring(0, query.indexOf("3탄")+2);
				}
				
				if(query.indexOf("4탄")!=-1){
					query = query.substring(0, query.indexOf("4탄")+2);
				}
				
				
				if(query.indexOf("연극")!=-1){
					//연극이라는 글자가 뒤에 존재하는 경우
					if(query.substring(0,query.indexOf("연극")).length()>0){	
						query = query.substring(0,query.indexOf("연극")+3);
						
					//연극으로 시작되는 행사제목일경 경우	
					}
						//'연극'을 제외한 문자열의 길이가 5이상인 경우
						if(query.substring(query.indexOf("연극")+2,query.length()).trim().length()>=5){
							//'연극'을 잘라낸다
							query = query.substring(query.indexOf("연극")+2,query.length());					
						
					}
				}
				

				if(query.indexOf("코믹극")!=-1){
					//코믹극이라는 글자가 뒤에 존재하는 경우
					if(query.substring(0,query.indexOf("코믹극")).length()>0){	
						query = query.substring(query.indexOf("코믹극"), query.length());
						
					
					}//코믹극으로 시작되는 행사제목일경 경우	
						//'코믹극'을 제외한 문자열의 길이가 3보다 클 경우
						if(query.substring(query.indexOf("코믹극")+3,query.length()).trim().length()>3){
							//'코믹극'을 잘라낸다
							query = query.substring(query.indexOf("코믹극")+3,query.length());	
							query = "연극"+query;
						
					}
				}
			
				
				if(query.indexOf("뮤지컬")!=-1){
					if(query.substring(0,query.indexOf("뮤지컬")).length()>0){	
						query = query.substring(query.indexOf("뮤지컬"), query.length());
						
					}
					//뮤지컬 이라는 글자로 시작하는 경우
						if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>0){
							//'뮤지컬'을 제외한 문자열의 길이가 4보다 클 경우
							if(query.substring(query.indexOf("뮤지컬")+3,query.length()).trim().length()>=5){
								//'뮤지컬'을 잘라낸다
								query = query.substring(query.indexOf("뮤지컬")+3,query.length());					
							}
						}
					
				}
				
			
			
				
				if(query.indexOf("화랑")!=-1){
					query = "대학로 "+query;
				}
				
				if(query.indexOf("연극 행복")!=-1){
					query = "대학로 "+query;	
				}
				
				if(query.indexOf("추격자")!=-1){
					query = "넌버벌 퍼포먼스 "+query;	
				}
				
				if(query.indexOf("동치미")!=-1){
					query = "연극 "+query;	
				}

				if(query.indexOf("담배가게 아가씨")!=-1){
					query = "뮤지컬 "+query;	
				}
				
				if(query.indexOf("삼청각 런치콘서트")!=-1){
					query = "삼청각 자미";
				}
				
				
				if(query.indexOf("가루야")!=-1){
					query = "연극"+query;
				}
				
				

				
				String serviceKey="444f0b2019ac8cf4c576a9029dfe488f";
				
				String encodedQuery="";
				
				try {
					encodedQuery = java.net.URLEncoder.encode(query,"UTF-8");
					
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

				String baseUrl="http://openapi.naver.com/search?key="+serviceKey+"&query=";
				String option="&display=5&start=1&target=news&sort=sim";
				
				String urlString=baseUrl+encodedQuery+option;
				System.out.println(urlString);
				List<EventNews> newsList=new ArrayList<EventNews>(); 

				try {
					URL url  = new URL(urlString);   
					   URLConnection URLconnection = url.openConnection();
					   HttpURLConnection httpConnection = (HttpURLConnection)URLconnection;
					   int responseCode = httpConnection.getResponseCode();
					   
					   if (responseCode== HttpURLConnection.HTTP_OK){
						   InputStream in = httpConnection.getInputStream();
						    
						    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
						    DocumentBuilder db = dbf.newDocumentBuilder();
						    Document doc = db.parse(in);
						    
						    
						    Element el = doc.getDocumentElement();
						    NodeList itemList = el.getElementsByTagName("item");
						   
						    for (int itemIdx=0; itemIdx<itemList.getLength(); itemIdx++){
						    	
						    	 Node itemNode = itemList.item(itemIdx);
							     NodeList cdList = itemNode.getChildNodes();
							    
							     String eventNewsTitle = "";
							     String eventNewsDescription="";
							     String eventNewsLink="";
							     String eventPublishedDate="";
							     
							     
							     for (int cdIdx=0; cdIdx<cdList.getLength(); cdIdx++){
							      Node childNode = cdList.item(cdIdx);
							      if (childNode.getNodeName().equals("title")){
							    	  eventNewsTitle = childNode.getTextContent();
							      }else if (childNode.getNodeName().equals("description")){
							    	  eventNewsDescription = childNode.getTextContent();
							      }else if (childNode.getNodeName().equals("originallink")){
							    	  eventNewsLink = childNode.getTextContent();
							      }else if (childNode.getNodeName().equals("pubDate")){
							    	  eventPublishedDate = childNode.getTextContent();
							      }
						    	
							     
							      
						    }

							    	 newsList.add(new EventNews(eventNewsTitle, eventNewsDescription, eventNewsLink,eventPublishedDate));
	
						
					   }

						    
					} else {
						/*연결 실패시*/
					    System.out.println("HTTP connection response !=HTTP_OK");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				
				return newsList;
	}

	
	@Override
	public List<EventNews> findEventNewsForCount(String query) {
		


		//연도 제거
		Calendar now = Calendar.getInstance();
		String year= String.valueOf(now.get(Calendar.YEAR));
		if(query.indexOf(year)!=-1){
			query = query.substring(0, query.indexOf(year)-1);
		}
		
		//괄호 제거 1
		if(query.indexOf("[")!=-1 && query.indexOf("]")!=-1){
			String inside = query.substring(query.indexOf("[")+1,query.indexOf("]"));
			query = query.substring(0, query.indexOf("["))+inside;
		}	
		//괄호 제거 2
		if(query.indexOf("(")!=-1 && query.indexOf(")")!=-1){
			String inside = query.substring(query.indexOf("(")+1,query.indexOf(")"));
			if(inside.length()>5||inside.equals("수원")||inside.equals("용인")){
				query = query.substring(0, query.indexOf("("));
			}else{
			query = query.substring(0, query.indexOf("("))+inside;
			}
		}
		//괄호 제거 3
		if(query.indexOf("{")!=-1 && query.indexOf("}")!=-1){
			String inside = query.substring(query.indexOf("{")+1,query.indexOf("}"));
			query = query.substring(0, query.indexOf("{"))+inside;
		}	
		//괄호 제거 4
		if(query.indexOf("<")!=-1 && query.indexOf(">")!=-1){
			String inside = query.substring(query.indexOf("<")+1,query.indexOf(">"));
			query = query.substring(0, query.indexOf("<"))+inside;
		}
	
		
		//따옴표 제거 2
		if(query.indexOf('"')!=-1 && query.substring(0,query.indexOf('"')).indexOf('"')!=-1){
			String inside = query.substring(query.indexOf('"')+1,query.indexOf('"')-1);
			query = query.substring(0, query.indexOf('"'))+inside;
		}
		
		
		// : 제거
		if(query.indexOf(":")!=-1){
			String behind = query.substring(query.indexOf(":")+1,query.length());
			query = query.substring(0,query.indexOf(":"))+" "+behind;
		}
		// - 제거
		if(query.indexOf("-")!=-1){
			String behind = query.substring(query.indexOf("-")+1,query.length());
			query = query.substring(0,query.indexOf("-"))+" "+behind;
		}
		// , 제거
		if(query.indexOf(",")!=-1){
			String behind = query.substring(query.indexOf(",")+1,query.length());
			query = query.substring(0,query.indexOf(","))+" "+behind;
		}
		// / 제거
		if(query.indexOf("/")!=-1){
			String behind = query.substring(query.indexOf("/")+1,query.length());
			query = query.substring(0,query.indexOf("/"))+" "+behind;
		}
		// ? 제거
		if(query.indexOf("?")!=-1){
			String behind = query.substring(query.indexOf("?")+1,query.length());
			query = query.substring(0,query.indexOf("?"))+" "+behind;
		}	
		// ! 제거
		if(query.indexOf("!")!=-1){
			String behind = query.substring(query.indexOf("!")+1,query.length());
			query = query.substring(0,query.indexOf("!"))+" "+behind;
				}	
		// ~ 제거
		if(query.indexOf("~")!=-1){
			String behind = query.substring(query.indexOf("~"),query.length());
			query = query.substring(0,query.indexOf("~"))+" "+behind;
		}
	
		// 2~4탄까지 
		if(query.indexOf("2탄")!=-1){
			query = query.substring(0, query.indexOf("2탄")+2);
		}
		
		if(query.indexOf("3탄")!=-1){
			query = query.substring(0, query.indexOf("3탄")+2);
		}
		
		if(query.indexOf("4탄")!=-1){
			query = query.substring(0, query.indexOf("4탄")+2);
		}
		
		
		if(query.indexOf("연극")!=-1){
			//연극이라는 글자가 뒤에 존재하는 경우
			if(query.substring(0,query.indexOf("연극")).length()>0){	
				query = query.substring(0,query.indexOf("연극")+3);
				
			//연극으로 시작되는 행사제목일경 경우	
			}
				//'연극'을 제외한 문자열의 길이가 5이상인 경우
				if(query.substring(query.indexOf("연극")+2,query.length()).trim().length()>=5){
					//'연극'을 잘라낸다
					query = query.substring(query.indexOf("연극")+2,query.length());					
				
			}
		}
		

		if(query.indexOf("코믹극")!=-1){
			//코믹극이라는 글자가 뒤에 존재하는 경우
			if(query.substring(0,query.indexOf("코믹극")).length()>0){	
				query = query.substring(query.indexOf("코믹극"), query.length());
				
			
			}//코믹극으로 시작되는 행사제목일경 경우	
				//'코믹극'을 제외한 문자열의 길이가 3보다 클 경우
				if(query.substring(query.indexOf("코믹극")+3,query.length()).trim().length()>3){
					//'코믹극'을 잘라낸다
					query = query.substring(query.indexOf("코믹극")+3,query.length());	
					query = "연극"+query;
				
			}
		}
	
		
		if(query.indexOf("뮤지컬")!=-1){
			if(query.substring(0,query.indexOf("뮤지컬")).length()>0){	
				query = query.substring(query.indexOf("뮤지컬"), query.length());
				
			}
			//뮤지컬 이라는 글자로 시작하는 경우
				if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>0){
					//'뮤지컬'을 제외한 문자열의 길이가 4보다 클 경우
					if(query.substring(query.indexOf("뮤지컬")+3,query.length()).trim().length()>=5){
						//'뮤지컬'을 잘라낸다
						query = query.substring(query.indexOf("뮤지컬")+3,query.length());					
					}
				}
			
		}
		
	
	
		
		if(query.indexOf("화랑")!=-1){
			query = "대학로 "+query;
		}
		
		if(query.indexOf("연극 행복")!=-1){
			query = "대학로 "+query;	
		}
		
		if(query.indexOf("추격자")!=-1){
			query = "넌버벌 퍼포먼스 "+query;	
		}
		
		if(query.indexOf("동치미")!=-1){
			query = "연극 "+query;	
		}

		if(query.indexOf("담배가게 아가씨")!=-1){
			query = "뮤지컬 "+query;	
		}
		
		if(query.indexOf("삼청각 런치콘서트")!=-1){
			query = "삼청각 자미";
		}
		
		
		if(query.indexOf("가루야")!=-1){
			query = "연극"+query;
		}
		
		
		
		String serviceKey="444f0b2019ac8cf4c576a9029dfe488f";
		
		String encodedQuery="";
		
		try {
			encodedQuery = java.net.URLEncoder.encode(query,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		String baseUrl="http://openapi.naver.com/search?key="+serviceKey+"&query=";
		String option="&display=100&start=1&target=news&sort=date";
		
		String urlString=baseUrl+encodedQuery+option;
		System.out.println(urlString);
		List<EventNews> newsList=new ArrayList<EventNews>(); 

		try {
			URL url  = new URL(urlString);   
			   URLConnection URLconnection = url.openConnection();
			   HttpURLConnection httpConnection = (HttpURLConnection)URLconnection;
			   int responseCode = httpConnection.getResponseCode();
			   
			   if (responseCode== HttpURLConnection.HTTP_OK){
				   InputStream in = httpConnection.getInputStream();
				    
				    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				    DocumentBuilder db = dbf.newDocumentBuilder();
				    Document doc = db.parse(in);
				    
				    
				    Element el = doc.getDocumentElement();
				    NodeList itemList = el.getElementsByTagName("item");
				    int k=0;
				    for (int itemIdx=0; itemIdx<itemList.getLength(); itemIdx++){
				    	
				    	 Node itemNode = itemList.item(itemIdx);
					     NodeList cdList = itemNode.getChildNodes();
					    
					     String eventNewsTitle = "";
					     String eventNewsDescription="";
					     String eventNewsLink="";
					     String eventPublishedDate="";
					     
					     
					     for (int cdIdx=0; cdIdx<cdList.getLength(); cdIdx++){
					      Node childNode = cdList.item(cdIdx);
					      if (childNode.getNodeName().equals("title")){
					    	  eventNewsTitle = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("description")){
					    	  eventNewsDescription = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("originallink")){
					    	  eventNewsLink = childNode.getTextContent();
					      }else if (childNode.getNodeName().equals("pubDate")){
					    	  eventPublishedDate = childNode.getTextContent();
					      }
				    	
					     
					      
				    }
					     
					     
					     if(eventNewsTitle.indexOf(query)!=-1){
					    	k+=1;
					    	 newsList.add(new EventNews(eventNewsTitle, eventNewsDescription, eventNewsLink,eventPublishedDate));
					     }
					     
			   }

				    System.out.println("타이틀 포함하는 숫자:::::::"+k);
			} else {
				/*연결 실패시*/
			    System.out.println("HTTP connection response !=HTTP_OK");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return newsList;
	}

	@Override
	public boolean naverTrendPointAndTweetPoint(){
		boolean flag=false;
		
		final List<Event>eventListforTrent=sqlSessionTemplate.selectList("Event.selectAllEventList");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd"); 
		
		long currentTime = System.currentTimeMillis();  //현재 시간 
		Date current = new Date(currentTime); 
		long endTime=0;
		
		if(Integer.parseInt(sdf2.format(current))%7==0){
			endTime=currentTime-((Integer.parseInt(sdf2.format(current))+1)%7)*1000*60*60*24-7*1000*60*60*24;
		}else{
			endTime=currentTime-((Integer.parseInt(sdf2.format(current)))%7)*1000*60*60*24-7*1000*60*60*24;
		}
		
		long startTime = endTime-(8*24*60*60*1000);  

		Date endd = new Date(endTime);  
		Date startt = new Date(startTime);  
		
		String end =sdf.format(endd);  //Time을 20140612 이런 식으로 변환 필요
		String start=sdf.format(startt);
		
		HttpClient httpClient = new DefaultHttpClient();
		String baseUrl="http://trend.naver.com/trend.naver?where=trend&mobile=0";
		String startDate="&startDate="+start;
		String endDate="&endDate="+end;

		for(int i=0;i<eventListforTrent.size()-1;i++){
			for(int j=i+1;j<eventListforTrent.size();j++){
				System.out.println(i+"와 "+j+"의 크기비교");
				final int ii=i;
				final int jj=j;
				String title1=eventListforTrent.get(i).getEventTitle();
				String title2=eventListforTrent.get(j).getEventTitle();
		
				String query1=titleCut(title1);
				String query2=titleCut(title2);
				
				try {
					query1 = "&query1="+URLEncoder.encode(query1,"UTF-8");
					query2 = "&query2="+URLEncoder.encode(query2,"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				String finalUrl=baseUrl+startDate+endDate+query1+query2;
				HttpGet httpget1 = new HttpGet(finalUrl);
							
				String content="";				
				try {
					content=httpClient.execute(httpget1, new BasicResponseHandler() {
						 @Override
						    public String handleResponse(HttpResponse response) throws HttpResponseException,
						        IOException {
							    
							      String res = new String(super.handleResponse(response).getBytes(), "euc-kr");
							      org.jsoup.nodes.Document doc = Jsoup.parse(res);
							      Elements rows =  doc.select("em");
							      
							     String a1= rows.get(1).text();
							     String a2= rows.get(2).text();
							     
							     int first=Integer.parseInt(a1);
							     int second=Integer.parseInt(a2);
				     
							     if(first<second){
							    	 Event temp=eventListforTrent.get(ii);
							    	 eventListforTrent.set(ii,  eventListforTrent.get(jj));		
							    	 eventListforTrent.set(jj, temp);
							     }							     
							     return "";
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
		}
		
		final TwitterController con=new TwitterController();
		
		String title1=eventListforTrent.get(0).getEventTitle();
		final String query11=titleCut(title1);
		int firstTweetCount=0;
		try {
			firstTweetCount= con.twitterCount(title1);
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(sqlSessionTemplate.selectOne("EventPoint.selectEventPointByEventId", eventListforTrent.get(0).getEventId())!=null){
			sqlSessionTemplate.update("EventPoint.updateAllPoint", new EventPoint(eventListforTrent.get(0).getEventId(),100,firstTweetCount));
		}else{
			sqlSessionTemplate.insert("EventPoint.insertEventPoint", new EventPoint(eventListforTrent.get(0).getEventId(),100,firstTweetCount));
		}		
		
		int last=(eventListforTrent.size()-1)/4;	
		for(int k=0;k<last;k++){
			
			final int k2=4*k+2;
			final int k3=4*k+3;
			final int k4=4*k+4;
			final int k5=4*k+5;
			
			System.out.println("0과 "+k2+"부터 "+k5+"까지의 트렌드검색비교");

			String title2=eventListforTrent.get(k2).getEventTitle();
			String title3=eventListforTrent.get(k3).getEventTitle();
			String title4=eventListforTrent.get(k4).getEventTitle();
			String title5=eventListforTrent.get(k5).getEventTitle();
			
			final String title22=title2;
			final String title33=title3;
			final String title44=title4;
			final String title55=title5;
			

			String query2=titleCut(title2);
			String query3=titleCut(title3);
			String query4=titleCut(title4);
			String query5=titleCut(title5);
			
			System.out.println("\n"+query11+":::"+query2+":::"+query3+":::"+query4+":::"+query5);
			String query1="";
			
			try {
				query1 = "&query1="+URLEncoder.encode(query11,"UTF-8");
				query2 = "&query2="+URLEncoder.encode(query2,"UTF-8");
				query3 = "&query3="+URLEncoder.encode(query3,"UTF-8");
				query4 = "&query4="+URLEncoder.encode(query4,"UTF-8");
				query5 = "&query5="+URLEncoder.encode(query5,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			

			String finalUrl2=baseUrl+startDate+endDate+query1+query2+query3+query4+query5;
			HttpGet httpget2 = new HttpGet(finalUrl2);

			String content="";
						
			try {
				content=httpClient.execute(httpget2, new BasicResponseHandler() {
					 @Override
					    public String handleResponse(HttpResponse response) throws HttpResponseException,
					        IOException {
						      
						     String res = new String(super.handleResponse(response).getBytes(), "euc-kr");
						     org.jsoup.nodes.Document doc = Jsoup.parse(res);
						     Elements rows =  doc.select("em");
						   
						     String a2= rows.get(2).text();
						     String a3= rows.get(3).text();
						     String a4= rows.get(4).text();
						     String a5= rows.get(5).text();
	
						     int second=Integer.parseInt(a2);
						     int third=Integer.parseInt(a3);
						     int fourth=Integer.parseInt(a4);
						     int fifth=Integer.parseInt(a5);
						    
						     String secondId=eventListforTrent.get(k2).getEventId();
						     String thirdId=eventListforTrent.get(k3).getEventId();
						     String fourthId=eventListforTrent.get(k4).getEventId();
						     String fifthId=eventListforTrent.get(k5).getEventId();
						     
						     

						     int secondTweetCount=0;
						     int thirdTweetCount=0;
						     int fourthTweetCount=0;
						     int fifthTweetCount=0;
						    
						     try {
								 secondTweetCount= con.twitterCount(title22);
								 thirdTweetCount= con.twitterCount(title33);
								 fourthTweetCount= con.twitterCount(title44);
								 fifthTweetCount= con.twitterCount(title55);
							} catch (JSONException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						     
						     if(sqlSessionTemplate.selectOne("EventPoint.selectEventPointByEventId",secondId)!=null){
						    	 sqlSessionTemplate.update("EventPoint.updateAllPoint", new EventPoint(secondId, second,secondTweetCount));
						     }else{
									sqlSessionTemplate.insert("EventPoint.insertEventPoint", new EventPoint(secondId, second,secondTweetCount));
						     }
						     
						     
						     if(sqlSessionTemplate.selectOne("EventPoint.selectEventPointByEventId",thirdId)!=null){
						    	 sqlSessionTemplate.update("EventPoint.updateAllPoint", new EventPoint(thirdId, third,thirdTweetCount));
						     }else{
						    	 sqlSessionTemplate.insert("EventPoint.insertEventPoint", new EventPoint(thirdId, third,thirdTweetCount));
						     }
						     
						     
						     if(sqlSessionTemplate.selectOne("EventPoint.selectEventPointByEventId",fourthId)!=null){
						    	 sqlSessionTemplate.update("EventPoint.updateAllPoint", new EventPoint(fourthId, fourth,fourthTweetCount));
						     }else{
						    	 sqlSessionTemplate.insert("EventPoint.insertEventPoint", new EventPoint(fourthId, fourth,fourthTweetCount));
						     }
						     
						     
						     if(sqlSessionTemplate.selectOne("EventPoint.selectEventPointByEventId",fifthId)!=null){
						    	 sqlSessionTemplate.update("EventPoint.updateAllPoint", new EventPoint(fifthId, fifth,fifthTweetCount));
						     }else{
						    	 sqlSessionTemplate.insert("EventPoint.insertEventPoint", new EventPoint(fifthId, fifth,fifthTweetCount));
						     }
	     
						     return "success";
					    }
				});
			} catch (ClientProtocolException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
						
			if(content.equals("success")){
				flag=true;
			}
						
		}	
		return flag;
	}
	

	
	public String titleCut(String query){
		//연도 제거
		Calendar now = Calendar.getInstance();
		String year= String.valueOf(now.get(Calendar.YEAR));
		if(query.indexOf(year)!=-1){
			query = query.substring(0, query.indexOf(year)-1);
		}
		
		//괄호 제거 1
		if(query.indexOf("[")!=-1 && query.indexOf("]")!=-1){
			String inside = query.substring(query.indexOf("[")+1,query.indexOf("]"));
			query = query.substring(0, query.indexOf("["))+inside;
		}	
		//괄호 제거 2
		if(query.indexOf("(")!=-1 && query.indexOf(")")!=-1){
			String inside = query.substring(query.indexOf("(")+1,query.indexOf(")"));
			if(inside.length()>5||inside.equals("수원")||inside.equals("용인")){
				query = query.substring(0, query.indexOf("("));
			}else{
			query = query.substring(0, query.indexOf("("))+inside;
			}
		}
		//괄호 제거 3
		if(query.indexOf("{")!=-1 && query.indexOf("}")!=-1){
			String inside = query.substring(query.indexOf("{")+1,query.indexOf("}"));
			query = query.substring(0, query.indexOf("{"))+inside;
		}	
		//괄호 제거 4
		if(query.indexOf("<")!=-1 && query.indexOf(">")!=-1){
			String inside = query.substring(query.indexOf("<")+1,query.indexOf(">"));
			query = query.substring(0, query.indexOf("<"))+inside;
		}
	
		
		//따옴표 제거 2
		if(query.indexOf('"')!=-1 && query.substring(0,query.indexOf('"')).indexOf('"')!=-1){
			String inside = query.substring(query.indexOf('"')+1,query.indexOf('"')-1);
			query = query.substring(0, query.indexOf('"'))+inside;
		}
		
		
		// : 제거
		if(query.indexOf(":")!=-1){
			String behind = query.substring(query.indexOf(":")+1,query.length());
			query = query.substring(0,query.indexOf(":"))+" "+behind;
		}
		// - 제거
		if(query.indexOf("-")!=-1){
			String behind = query.substring(query.indexOf("-")+1,query.length());
			query = query.substring(0,query.indexOf("-"))+" "+behind;
		}
		// , 제거
		if(query.indexOf(",")!=-1){
			String behind = query.substring(query.indexOf(",")+1,query.length());
			query = query.substring(0,query.indexOf(","))+" "+behind;
		}
		// / 제거
		if(query.indexOf("/")!=-1){
			String behind = query.substring(query.indexOf("/")+1,query.length());
			query = query.substring(0,query.indexOf("/"))+" "+behind;
		}
		// ? 제거
		if(query.indexOf("?")!=-1){
			String behind = query.substring(query.indexOf("?")+1,query.length());
			query = query.substring(0,query.indexOf("?"))+" "+behind;
		}	
		// ! 제거
		if(query.indexOf("!")!=-1){
			String behind = query.substring(query.indexOf("!")+1,query.length());
			query = query.substring(0,query.indexOf("!"))+" "+behind;
				}	
		// ~ 제거
		if(query.indexOf("~")!=-1){
			String behind = query.substring(query.indexOf("~"),query.length());
			query = query.substring(0,query.indexOf("~"))+" "+behind;
		}
	
		// 2~4탄까지 
		if(query.indexOf("2탄")!=-1){
			query = query.substring(0, query.indexOf("2탄")+2);
		}
		
		if(query.indexOf("3탄")!=-1){
			query = query.substring(0, query.indexOf("3탄")+2);
		}
		
		if(query.indexOf("4탄")!=-1){
			query = query.substring(0, query.indexOf("4탄")+2);
		}
		
		
		if(query.indexOf("연극")!=-1){
			//연극이라는 글자가 뒤에 존재하는 경우
			if(query.substring(0,query.indexOf("연극")).length()>0){	
				query = query.substring(0,query.indexOf("연극")+3);
				
			//연극으로 시작되는 행사제목일경 경우	
			}
				//'연극'을 제외한 문자열의 길이가 5이상인 경우
				if(query.substring(query.indexOf("연극")+2,query.length()).trim().length()>=5){
					//'연극'을 잘라낸다
					query = query.substring(query.indexOf("연극")+2,query.length());					
				
			}
		}
		

		if(query.indexOf("코믹극")!=-1){
			//코믹극이라는 글자가 뒤에 존재하는 경우
			if(query.substring(0,query.indexOf("코믹극")).length()>0){	
				query = query.substring(query.indexOf("코믹극"), query.length());
				
			
			}//코믹극으로 시작되는 행사제목일경 경우	
				//'코믹극'을 제외한 문자열의 길이가 3보다 클 경우
				if(query.substring(query.indexOf("코믹극")+3,query.length()).trim().length()>3){
					//'코믹극'을 잘라낸다
					query = query.substring(query.indexOf("코믹극")+3,query.length());	
					query = "연극"+query;
				
			}
		}
	
		
		if(query.indexOf("뮤지컬")!=-1){
			if(query.substring(0,query.indexOf("뮤지컬")).length()>0){	
				query = query.substring(query.indexOf("뮤지컬"), query.length());
				
			}
			//뮤지컬 이라는 글자로 시작하는 경우
				if(query.substring(query.indexOf("뮤지컬")+3,query.length()).length()>0){
					//'뮤지컬'을 제외한 문자열의 길이가 4보다 클 경우
					if(query.substring(query.indexOf("뮤지컬")+3,query.length()).trim().length()>=5){
						//'뮤지컬'을 잘라낸다
						query = query.substring(query.indexOf("뮤지컬")+3,query.length());					
					}
				}
			
		}
		
	
	
		
		if(query.indexOf("화랑")!=-1){
			query = "대학로 "+query;
		}
		
		if(query.indexOf("연극 행복")!=-1){
			query = "대학로 "+query;	
		}
		
		if(query.indexOf("추격자")!=-1){
			query = "넌버벌 퍼포먼스 "+query;	
		}
		
		if(query.indexOf("동치미")!=-1){
			query = "연극 "+query;	
		}

		if(query.indexOf("담배가게 아가씨")!=-1){
			query = "뮤지컬 "+query;	
		}
		
		if(query.indexOf("삼청각 런치콘서트")!=-1){
			query = "삼청각 자미";
		}
		if(query.indexOf("엄마를 부탁해")!=-1){
			query = "연극 엄마를 부탁해";
		}
		return query;
	}

	@Override
	public EventPoint selectEventPointByEventId(String eventId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("EventPoint.selectEventPointByEventId", eventId);
	}
}
