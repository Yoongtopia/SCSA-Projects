package com.seoulnori.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.ExifSubIFDDirectory;
import com.drew.metadata.exif.GpsDirectory;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seoulnori.service.EventService;
import com.seoulnori.service.ReviewService;
import com.seoulnori.service.StampService;
import com.seoulnori.vo.Event;
import com.seoulnori.vo.Review;
import com.seoulnori.vo.Stamp;

@Controller
public class ReviewController {
	private Logger logger = Logger.getLogger(ReviewController.class);

	private ReviewService reviewService;

	private EventService eventService;

	private StampService stampService;

	@Autowired
	public void setStampService(StampService stampService) {
		this.stampService = stampService;
	}

	@Autowired
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	@Autowired
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}

	// (행사 상세보기 화면) 사용자의 후기 삭제 (스탬프 존재 시 함께 삭제)
	@RequestMapping("review_remove.do")
	public String removeReview(int reviewNum, HttpSession session, Model model) {
		logger.info("review_remove: reviewNum=" + reviewNum);

		String eventId = reviewService.findReviewByReviewNum(reviewNum).getEventId();
		float starPoint=reviewService.findReviewByReviewNum(reviewNum).getStarPoint();
		String userId = (String) session.getAttribute("userId");
		String categoryNum = eventService.getCategoryNumByEventId(eventId);
		String stampNum = "";

		int stampCount = stampService.countStampCategory(userId, stampNum);
		// 같은 행사 카테고리에 속한 스탬프가 5, 10, 15, 20, 25개 일 때 부여되는 스탬프.
		while((stampCount/5)>0) {
			if((stampCount%5)==0){
			stampService.removeStamp(stampNum+""+stampCount, userId, eventId);
			}
			stampCount=stampCount-1;
		}
		
		if (categoryNum.equals("A02070100") || categoryNum.equals("A02070200")) {
			stampNum = "festival";
		} else if (categoryNum.equals("A02080100")
				|| categoryNum.equals("A02081300")) {
			stampNum = "etc";
		} else if (categoryNum.equals("A02080200")
				|| categoryNum.equals("A02080300")
				|| categoryNum.equals("A02081000")) {
			stampNum = "performance";
		} else if (categoryNum.equals("A02080500")
				|| categoryNum.equals("A02080600")
				|| categoryNum.equals("A02080700")) {
			stampNum = "exhibition";
		} else {
			stampNum = "classic";
		}

		// 후기 삭제 시 스탬프 있으면 삭제
		if (stampService.findStampByUserIdStampNumEventId(stampNum, userId,
				eventId) != null) {
			stampService.removeStamp(stampNum, userId, eventId);
		}

		reviewService.removeReview(reviewNum);
		
		//리뷰삭제이후 평균별점 업데이트 메서드.SH
		Event event =eventService.findEventByEventId(eventId);
		float newAvgStarPoint=0;
		int listSize=reviewService.findReviewListByEventIdRegDate(eventId).size();
		if(listSize>0){
			listSize+=1;
			float avgStarPoint=event.getEventAvgStar();	
			float totalStarPoint=listSize*avgStarPoint;	
			newAvgStarPoint=(totalStarPoint-starPoint)/(listSize-1);	
		}else{
			newAvgStarPoint=0;
		}
		event.setEventAvgStar(newAvgStarPoint);				
		eventService.updateEventAvgStar(event);
		
		return "redirect:/event_detail.do?eventId=" + eventId + "#reviewDiv";

	}

	// 안쓰면 삭제해도 되는 메서드
	@RequestMapping("review_list_userId_move.do")
	public String reviewListByUserId(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		List<Review> reviewList = reviewService.findReviewListByUserId(userId);
		logger.info("review_list_userId_move: reviewList.size()="
				+ reviewList.size());
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("active", "myReview");
		return "redirect:/member_mypage.do?myContent=myReview&active=myReview";
	}

	// (마이페이지) 내가 쓴 후기 리스트 뿌리기
	@RequestMapping("review_list_userId_ajax.do")
	@ResponseBody
	public HashMap<String, Object> reviewListByUserId(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		List<Review> reviewList = reviewService.findReviewListByUserId(userId);
		logger.info("review_list_userId_ajax: reviewList.size()="
				+ reviewList.size());
		HashMap<String, Object> map = new HashMap<>();
		map.put("reviewList", reviewList);
		return map;
	}

	// (관리자페이지) 스탬프 관리에서 사용자가 쓴 후기 뿌리기
	// 후기 눌렀을때만 후기내용 보이게 만든다.
	@RequestMapping("review_list_ajax.do")
	@ResponseBody
	public HashMap<String, Object> reviewList() {
		List<Review> reviewList = reviewService.findReviewList();
		logger.info("review_list_ajax: reviewList.size()=" + reviewList.size());
		HashMap<String, Object> map = new HashMap<>();
		map.put("reviewList", reviewList);
		return map;
	}

	// (마이페이지) 내가 쓴 후기에서 후기 눌렀을때 ajax로 후기내용 가져오기
	// (관리자페이지) 스탬프 관리에서 후기 눌렀을때 ajax로 후기내용 가져오기
	// (행사 상세보기 화면) 후기 수정 눌렀을 때 ajax로 후기내용 가져오기
	@RequestMapping("review_detail_reviewNum_ajax.do")
	@ResponseBody
	public HashMap<String, Object> reviewDetail(int reviewNum) {
		Review review = reviewService.findReviewByReviewNum(reviewNum);
		logger.info("review_detail_reviewNum_ajax: " + review);
		HashMap<String, Object> map = new HashMap<>();
		map.put("review", review);
		return map;
	}

	// (마이페이지) 내가 쓴 후기에서 후기 눌렀을때 후기 상세보기 페이지로 화면이동
	@RequestMapping("review_detail_reviewNum_move.do")
	public String reviewDetail(int reviewNum, Model model) {
		Review review = reviewService.findReviewByReviewNum(reviewNum);
		logger.info("review_detail_reviewNum_move: " + review);
		model.addAttribute("review", review);
		return "index";
	}

	// (행사 상세보기 화면) 후기 리스트 최신순으로 ajax 송신
	@RequestMapping("review_list_eventId_regDate_ajax.do")
	@ResponseBody
	public HashMap<String, Object> reviewListByEventIdRegDate(String eventId) {
		List<Review> reviewList = reviewService.findReviewListByEventIdRegDate(eventId);
		for(Review r: reviewList){
			String regDate = r.getReviewRegDate();
			regDate = regDate.substring(0, regDate.indexOf(" "));
			r.setReviewRegDate(regDate);	
			System.out.println("review Controller 행사 상세보기 화면::: "+r.getMember().getMainStamp());
			String birthday="";
			
			int age = Integer.parseInt(r.getMember().getBirthday());
			int now =Calendar.getInstance().get(Calendar.YEAR);

			    age = now - age +1;	
			    
			    if(age<10){
			    	birthday="어린이";
				}else if(age<14&&age>=10){
					birthday="10대 초반";
				}else if(age<17&&age>=14){
					birthday="10대 중반";
				}else if(age<20&&age>=17){
					birthday="10대 후반";
				}else  if(age<24&&age>=20){
					birthday="20대 초반";
				}else if(age<27&&age>=24){
					birthday="20대 중반";
				}else if(age<30&&age>=27){
					birthday="20대 후반";
				}else if(age<34&&age>=30){
					birthday="30대 초반";
				}else if(age<37&&age>=34){
					birthday="30대 중반";
				}else if(age<40&&age>=37){
					birthday="30대 후반";
				}else if(age<44&&age>=40){
					birthday="40대 초반";
				}else if(age<47&&age>=44){
					birthday="40대 중반";
				}else if(age<50&&age>=47){
					birthday="40대 후반";
				}else if(age<54&&age>=50){
					birthday="50대 초반";
				}else if(age<57&&age>=54){
					birthday="50대 중반";
				}else if(age<60&&age>=57){
					birthday="50대 후반";
				}else if(age<64&&age>=60){
					birthday="60대 초반";
				}else if(age<67&&age>=64){
					birthday="60대 중반";
				}else if(age<70&&age>=67){
					birthday="60대 후반";
				}
			    
			    r.getMember().setBirthday(birthday);
		
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("reviewList", reviewList);
		return map;
	}

	// (행사 상세보기 화면) 후기 리스트 스탬프순으로 ajax 송신
	@RequestMapping("review_list_eventId_stamp_ajax.do")
	@ResponseBody
	public HashMap<String, Object> reviewListByEventIdStamp(String eventId) {
		List<Review> reviewList = reviewService
				.findReviewListByEventIdStamp(eventId);
		logger.info("review_list_eventId_stamp_ajax: reviewList.size()="
				+ reviewList.size());
		HashMap<String, Object> map = new HashMap<>();
		map.put("reviewList", reviewList);
		return map;
	}

	// (행사 상세보기 화면) 후기 등록시 사진이 있으면 event stamp 지급.
	// stamp 갯수 체크하는 거 여기에 입력해서 visit stamp지급.
	@RequestMapping("review_add.do")
	public String addReview(float starPoint, String reviewContent,
			MultipartFile reviewImage, String eventId, HttpSession session,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		String userId = (String) session.getAttribute("userId");

		// userId가 있을 경우에만 review 생성됩니다.
		if (userId != null) {
			Review review = new Review(userId, starPoint, reviewContent, eventId);

			logger.info("review_add: " + reviewImage.getOriginalFilename());
			
			

			// 사진 있는 후기 등록 시에는
			if (reviewImage != null && reviewImage.getOriginalFilename() != "") {
				review.setReviewImage(reviewImage.getOriginalFilename());
				String saveDir = request.getServletContext().getRealPath("./images/test");
				reviewImage.transferTo(new File(saveDir + "/"+ reviewImage.getOriginalFilename()));
				logger.info("review_add: " + review);
				
				
				//리뷰 등록 서비스메서드.SH
				reviewService.addReview(review);

				File file = new File(saveDir + "/"
						+ reviewImage.getOriginalFilename());
				boolean flag = false;
				
				

				// 메타 정보가 없는 경우는 스탬프 발급이 안됩니다.
				try {
					Metadata metadata = JpegMetadataReader.readMetadata(file);
					ExifSubIFDDirectory directory=metadata.getDirectory(ExifSubIFDDirectory.class);
					GpsDirectory gpsDirectory = metadata
							.getDirectory(GpsDirectory.class);

					String mapY = gpsDirectory.getGeoLocation().getLatitude()
							+ ""; // 위도
					String mapX = gpsDirectory.getGeoLocation().getLongitude()
							+ ""; // 경도
					
					System.out.println("위도는::::"+mapY);
					System.out.println("경도는::::"+mapX);

					Date date=(Date) directory.getDate(ExifSubIFDDirectory.TAG_DATETIME_DIGITIZED);
					String strDate=null;

					try {
					 	SimpleDateFormat recvSimpleFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
						SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy/MM/dd", Locale.KOREA);
					
					
						Date data = recvSimpleFormat.parse(date+"");
						strDate = tranSimpleFormat.format(data);

					} catch (ParseException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					
					System.out.println("날짜는:::::::"+strDate);

					// 밑의 eventService.findEventListNearStation(mapX, mapY)코드는
					// 주어진 지역(gps)에서 반경 2km내의 행사리스트를 가져오는 코드이다.
					// 따라서 해당 리스트를 for문 돌려서 같은 행사를 찾아낸다면,
					// 회원은 해당 행사에 참여한 것이라 볼수 있다.

			
				
					if(strDate!=null&&eventService.eventDateCheck(eventId, strDate)){
						List<Event> eventList = eventService.findEventListNearStation(mapX, mapY);
						if(eventList.size()>0){
						for (Event e : eventList) {
							if (e.getEventId().equals(eventId)) {
								flag = true;
							}

						}
						}
					}
					
					
					

					// 이 이후로는 이전에 오아가 만든 스탬프 승인 코드로 이어지면 됨.
					// 스탬프가 부여됩니다.
					if (flag) {

						String stampNum = "";
						String categoryNum = eventService
								.getCategoryNumByEventId(eventId);

						if (categoryNum.equals("A02070100")
								|| categoryNum.equals("A02070200")) {
							stampNum = "festival";
						} else if (categoryNum.equals("A02080100")
								|| categoryNum.equals("A02081300")) {
							stampNum = "etc";
						} else if (categoryNum.equals("A02080200")
								|| categoryNum.equals("A02080300")
								|| categoryNum.equals("A02081000")) {
							stampNum = "performance";
						} else if (categoryNum.equals("A02080500")
								|| categoryNum.equals("A02080600")
								|| categoryNum.equals("A02080700")) {
							stampNum = "exhibition";
						} else {
							stampNum = "classic";
						}

						// 단, 해당 행사에 후기를 남겨서 이미 스탬프를 받았다면 더이상 스탬프가 부여되지 않습니다.
						System.out.println(stampNum + "/" + userId + "/"	+ eventId);
						if (stampService.findStampByUserIdStampNumEventId(
								stampNum, userId, eventId) == null) {
							stampService.addStamp(new Stamp(stampNum, userId,
									eventId));
							request.setAttribute("addStampSuccess", "Y");
							request.setAttribute("stamp1", stampNum);
						} else {
							System.out.println("이미 존재하는 스탬프");
						}

						int stampCount = stampService.countStampCategory(
								userId, stampNum);
						// 같은 행사 카테고리에 속한 스탬프가 5, 10, 15, 20, 25개 일 때 부여되는 스탬프.
						if ((stampCount % 5) == 0 && stampCount != 0) {
							stampService.addStamp(new Stamp(stampNum+""+stampCount, userId, eventId));
							request.setAttribute("addStampSuccess", "Y");
							request.setAttribute("stamp2", stampNum+""+stampCount);
						}
					}
				} catch (JpegProcessingException e) {
					System.out.println("메타데이터가 없는 사진 등록");
				}finally{
					//리뷰등록이후 평균별점 업데이트 메서드.SH
					Event event =eventService.findEventByEventId(eventId);
					//이미 리뷰가 등록되었으므로 사이즈에서 -1해야함.SH
					int listSize=reviewService.findReviewListByEventIdRegDate(eventId).size()-1;
					
					if(listSize>0){
						float avgStarPoint=event.getEventAvgStar();	
						float totalStarPoint=listSize*avgStarPoint;				
						float newAvgStarPoint=(totalStarPoint+starPoint)/(listSize+1);				
						event.setEventAvgStar(newAvgStarPoint);
					}else{
						event.setEventAvgStar(starPoint);	
					}
					eventService.updateEventAvgStar(event);

					
					return "/event_detail.do?eventId=" + eventId + "#reviewDiv";
				}
				// 사진이 없는 후기 등록 시에는 이미지가 null값으로 입력되고 후기를 등록합니다.
			} else {
				review.setReviewImage("");
				reviewService.addReview(review);
		

			}
			
			
			
			//리뷰등록이후 평균별점 업데이트 메서드.SH
			Event event =eventService.findEventByEventId(eventId);
			//이미 리뷰가 등록되었으므로 사이즈에서 -1해야함.SH
			int listSize=reviewService.findReviewListByEventIdRegDate(eventId).size()-1;
			
			if(listSize>0){
				float avgStarPoint=event.getEventAvgStar();	
				float totalStarPoint=listSize*avgStarPoint;				
				float newAvgStarPoint=(totalStarPoint+starPoint)/(listSize+1);				
				event.setEventAvgStar(newAvgStarPoint);
			}else{
				event.setEventAvgStar(starPoint);	
			}
			eventService.updateEventAvgStar(event);

			
		}
		return "redirect:/event_detail.do?eventId=" + eventId + "#reviewDiv";
	}

	// review 수정 @ky
	@RequestMapping("review_update_ajax.do")
	@ResponseBody
	public HashMap<String, Object> updateReview_ajax(int reviewNum,
			String reviewImage, String reviewContent, String starPoint,
			HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Review review = reviewService.findReviewByReviewNum(reviewNum);
		review.setReviewContent(reviewContent);
		if (reviewImage != null) {
			review.setReviewImage(reviewImage);
		} else {
			review.setReviewImage("null");
		}
		reviewService.updateReview(review);
		
		

		map.put("status", true);
		map.put("review", review);
		return map;

	}

	// (행사 상세보기 화면) review 수정
	
	@RequestMapping("review_update_move.do")
	public String updateReview(int reviewNum, float starPoint,
			String reviewContent, MultipartFile reviewImage,
			HttpSession session, HttpServletRequest request)
			throws IllegalStateException, IOException, JpegProcessingException {

		System.out.println("reviewUpdate: "+reviewNum+"/"+starPoint+"/"+reviewContent+"/"+reviewImage);
			String userId = (String) session.getAttribute("userId");
			Review review = reviewService.findReviewByReviewNum(reviewNum);
			String eventId = review.getEventId();;
		
			float beforeStarpoint =review.getStarPoint();
			review.setStarPoint(starPoint);
			review.setReviewContent(reviewContent);

			// 사진을 등록하는 경우에는
			if (reviewImage != null && reviewImage.getOriginalFilename() != "") {

				// 기존에 사진이 없었던 경우
				if (review.getReviewImage() != null) {

					// 사진을 저장하고
					review.setReviewImage(reviewImage.getOriginalFilename());
					String saveDir = request.getServletContext().getRealPath(
							"./images/test");
					reviewImage.transferTo(new File(saveDir + "/"
							+ reviewImage.getOriginalFilename()));
					logger.info("review_update: " + review);
					reviewService.updateReview(review);
			
					File file = new File(saveDir + "/"
							+ reviewImage.getOriginalFilename());
					boolean flag = false;
					
					Metadata metadata = JpegMetadataReader.readMetadata(file);
					ExifSubIFDDirectory directory=metadata.getDirectory(ExifSubIFDDirectory.class);
					GpsDirectory gpsDirectory = metadata
							.getDirectory(GpsDirectory.class);

					String mapY = gpsDirectory.getGeoLocation().getLatitude()
							+ ""; // 위도
					String mapX = gpsDirectory.getGeoLocation().getLongitude()
							+ ""; // 경도
					System.out.println("위도는::::"+mapY);
					System.out.println("경도는::::"+mapX);

					Date date=(Date) directory.getDate(ExifSubIFDDirectory.TAG_DATETIME_DIGITIZED);
					String strDate=null;

					try {
					 	SimpleDateFormat recvSimpleFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
						SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy/MM/dd", Locale.KOREA);
					
					
						Date data = recvSimpleFormat.parse(date+"");
						strDate = tranSimpleFormat.format(data);

					} catch (ParseException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					
					System.out.println("날짜는:::::::"+strDate);

					// 밑의 eventService.findEventListNearStation(mapX, mapY)코드는
					// 주어진 지역(gps)에서 반경 2km내의 행사리스트를 가져오는 코드이다.
					// 따라서 해당 리스트를 for문 돌려서 같은 행사를 찾아낸다면,
					// 회원은 해당 행사에 참여한 것이라 볼수 있다.

			
				
					if(strDate!=null&&eventService.eventDateCheck(eventId, strDate)){
						List<Event> eventList = eventService.findEventListNearStation(mapX, mapY);

						for (Event e : eventList) {
							if (e.getEventId().equals(eventId)) {
								flag = true;
							}

						}
					}

					// 스탬프를 부여한다.
					if (flag) {
						String stampNum = "";
						String categoryNum = eventService
								.getCategoryNumByEventId(eventId);

						if (categoryNum.equals("A02070100")
								|| categoryNum.equals("A02070200")) {
							stampNum = "festival";
						} else if (categoryNum.equals("A02080100")
								|| categoryNum.equals("A02081300")) {
							stampNum = "etc";
						} else if (categoryNum.equals("A02080200")
								|| categoryNum.equals("A02080300")
								|| categoryNum.equals("A02081000")) {
							stampNum = "performance";
						} else if (categoryNum.equals("A02080500")
								|| categoryNum.equals("A02080600")
								|| categoryNum.equals("A02080700")) {
							stampNum = "exhibition";
						} else {
							stampNum = "classic";
						}

						// 단, 해당 행사에 후기를 남겨서 이미 스탬프를 받았다면 더이상 스탬프가 부여되지 않는다.
						if (stampService.findStampByUserIdStampNumEventId(
								stampNum, userId, eventId) == null) {
							stampService.addStamp(new Stamp(stampNum, userId,
									eventId));
						} else {
							System.out.println("이미 존재하는 스탬프");
						}

						int stampCount = stampService.countStampCategory(
								userId, stampNum);
						// 같은 행사 카테고리에 속한 스탬프가 5, 10, 15, 20, 25개 일 때 부여되는 스탬프.
						if ((stampCount % 5) == 0 && stampCount != 0) {
							stampService.addStamp(new Stamp(stampNum
									+ (stampCount / 5), userId, eventId));
						}
					}
					// 기존에 사진이 있었던 경우 사진을 바꾸고 저장한다.
				} else {

					review.setReviewImage(reviewImage.getOriginalFilename());
					String saveDir = request.getServletContext().getRealPath(
							"./images/test");
					reviewImage.transferTo(new File(saveDir + "/"
							+ reviewImage.getOriginalFilename()));
					logger.info("review_update: update review with Image: "
							+ review);
					reviewService.updateReview(review);

					
					
				}

				// 사진을 등록하지 않는 경우에는 그냥 수정한다.
			} else {
				logger.info("review_update: update review without image: "
						+ review);
				//review.setReviewImage("");
				reviewService.updateReview(review);
			}
			
			
			//리뷰 업데이트이후 평균별점 업데이트 메서드.SH
			Event event =eventService.findEventByEventId(eventId);
			//이미 리뷰가 등록되었으므로 이전 별점을 빼고 새로운 별점을 더해야함.SH
			int listSize=reviewService.findReviewListByEventIdRegDate(eventId).size();
			float avgStarPoint=event.getEventAvgStar();					
			float totalStarPoint=listSize*avgStarPoint;				
			float newAvgStarPoint=(totalStarPoint-beforeStarpoint+starPoint)/(listSize);				
			event.setEventAvgStar(newAvgStarPoint);				
			eventService.updateEventAvgStar(event);
			
			
		return "redirect:/event_detail.do?eventId=" + eventId + "#reviewDiv";
	}
	// (마이페이지 화면) review 수정
	
	@RequestMapping("review_update_move_from_my.do")
	public String updateReviewFromMy(int reviewNum, float starPoint,
			String reviewContent, MultipartFile reviewImage,
			HttpSession session, HttpServletRequest request)
					throws IllegalStateException, IOException, JpegProcessingException {
	
		System.out.println("reviewUpdate: "+reviewNum+"/"+starPoint+"/"+reviewContent+"/"+reviewImage);
		String userId = (String) session.getAttribute("userId");
		Review review = reviewService.findReviewByReviewNum(reviewNum);
		String eventId = review.getEventId();;
		
		float beforeStarpoint =review.getStarPoint();
		review.setStarPoint(starPoint);
		review.setReviewContent(reviewContent);
		
		// 사진을 등록하는 경우에는
		if (reviewImage != null && reviewImage.getOriginalFilename() != "") {
			
			// 기존에 사진이 없었던 경우
			if (review.getReviewImage() != null) {
				
				// 사진을 저장하고
				review.setReviewImage(reviewImage.getOriginalFilename());
				String saveDir = request.getServletContext().getRealPath(
						"./images/test");
				reviewImage.transferTo(new File(saveDir + "/"
						+ reviewImage.getOriginalFilename()));
				logger.info("review_update: " + review);
				reviewService.updateReview(review);
				
				File file = new File(saveDir + "/"
						+ reviewImage.getOriginalFilename());
				boolean flag = false;
				
				Metadata metadata = JpegMetadataReader.readMetadata(file);
				ExifSubIFDDirectory directory=metadata.getDirectory(ExifSubIFDDirectory.class);
				GpsDirectory gpsDirectory = metadata
						.getDirectory(GpsDirectory.class);
				
				String mapY = gpsDirectory.getGeoLocation().getLatitude()
						+ ""; // 위도
				String mapX = gpsDirectory.getGeoLocation().getLongitude()
						+ ""; // 경도
				System.out.println("위도는::::"+mapY);
				System.out.println("경도는::::"+mapX);
				
				Date date=(Date) directory.getDate(ExifSubIFDDirectory.TAG_DATETIME_DIGITIZED);
				String strDate=null;
				
				try {
					SimpleDateFormat recvSimpleFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
					SimpleDateFormat tranSimpleFormat = new SimpleDateFormat("yyyy/MM/dd", Locale.KOREA);
					
					
					Date data = recvSimpleFormat.parse(date+"");
					strDate = tranSimpleFormat.format(data);
					
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				System.out.println("날짜는:::::::"+strDate);
				
				// 밑의 eventService.findEventListNearStation(mapX, mapY)코드는
				// 주어진 지역(gps)에서 반경 2km내의 행사리스트를 가져오는 코드이다.
				// 따라서 해당 리스트를 for문 돌려서 같은 행사를 찾아낸다면,
				// 회원은 해당 행사에 참여한 것이라 볼수 있다.
				
				
				
				if(strDate!=null&&eventService.eventDateCheck(eventId, strDate)){
					List<Event> eventList = eventService.findEventListNearStation(mapX, mapY);
					
					for (Event e : eventList) {
						if (e.getEventId().equals(eventId)) {
							flag = true;
						}
						
					}
				}
				
				// 스탬프를 부여한다.
				if (flag) {
					String stampNum = "";
					String categoryNum = eventService
							.getCategoryNumByEventId(eventId);
					
					if (categoryNum.equals("A02070100")
							|| categoryNum.equals("A02070200")) {
						stampNum = "festival";
					} else if (categoryNum.equals("A02080100")
							|| categoryNum.equals("A02081300")) {
						stampNum = "etc";
					} else if (categoryNum.equals("A02080200")
							|| categoryNum.equals("A02080300")
							|| categoryNum.equals("A02081000")) {
						stampNum = "performance";
					} else if (categoryNum.equals("A02080500")
							|| categoryNum.equals("A02080600")
							|| categoryNum.equals("A02080700")) {
						stampNum = "exhibition";
					} else {
						stampNum = "classic";
					}
					
					// 단, 해당 행사에 후기를 남겨서 이미 스탬프를 받았다면 더이상 스탬프가 부여되지 않는다.
					if (stampService.findStampByUserIdStampNumEventId(
							stampNum, userId, eventId) == null) {
						stampService.addStamp(new Stamp(stampNum, userId,
								eventId));
					} else {
						System.out.println("이미 존재하는 스탬프");
					}
					
					int stampCount = stampService.countStampCategory(
							userId, stampNum);
					// 같은 행사 카테고리에 속한 스탬프가 5, 10, 15, 20, 25개 일 때 부여되는 스탬프.
					if ((stampCount % 5) == 0 && stampCount != 0) {
						stampService.addStamp(new Stamp(stampNum
								+ (stampCount / 5), userId, eventId));
					}
				}
				// 기존에 사진이 있었던 경우 사진을 바꾸고 저장한다.
			} else {
				
				review.setReviewImage(reviewImage.getOriginalFilename());
				String saveDir = request.getServletContext().getRealPath(
						"./images/test");
				reviewImage.transferTo(new File(saveDir + "/"
						+ reviewImage.getOriginalFilename()));
				logger.info("review_update: update review with Image: "
						+ review);
				reviewService.updateReview(review);
				
				
				
			}
			
			// 사진을 등록하지 않는 경우에는 그냥 수정한다.
		} else {
			logger.info("review_update: update review without image: "
					+ review);
			//review.setReviewImage("");
			reviewService.updateReview(review);
		}
		
		
		//리뷰 업데이트이후 평균별점 업데이트 메서드.SH
		Event event =eventService.findEventByEventId(eventId);
		//이미 리뷰가 등록되었으므로 이전 별점을 빼고 새로운 별점을 더해야함.SH
		int listSize=reviewService.findReviewListByEventIdRegDate(eventId).size();
		float avgStarPoint=event.getEventAvgStar();					
		float totalStarPoint=listSize*avgStarPoint;				
		float newAvgStarPoint=(totalStarPoint-beforeStarpoint+starPoint)/(listSize);				
		event.setEventAvgStar(newAvgStarPoint);				
		eventService.updateEventAvgStar(event);
		
		
		return "redirect:/member_mypage.do?tabId=myReviewTab";
	}

	// 사용자의 후기 삭제(마이페이지에서)@ky
	@RequestMapping("review_remove_from_my.do")
	public String removeReviewFromMy(int reviewNum, HttpSession session, HttpServletRequest request) {
		logger.info("review_remove: reviewNum=" + reviewNum);

		String eventId = reviewService.findReviewByReviewNum(reviewNum)
				.getEventId();
		String userId = (String) session.getAttribute("userId");
		String categoryNum = eventService.getCategoryNumByEventId(eventId);
		String stampNum = "";

		if (categoryNum.equals("A02070100") || categoryNum.equals("A02070200")) {
			stampNum = "festival";
		} else if (categoryNum.equals("A02080100")
				|| categoryNum.equals("A02081300")) {
			stampNum = "etc";
		} else if (categoryNum.equals("A02080200")
				|| categoryNum.equals("A02080300")
				|| categoryNum.equals("A02081000")) {
			stampNum = "performance";
		} else if (categoryNum.equals("A02080500")
				|| categoryNum.equals("A02080600")
				|| categoryNum.equals("A02080700")) {
			stampNum = "exhibition";
		} else {
			stampNum = "classic";
		}

		// 후기 삭제 시 스탬프 있으면 삭제
		if (stampService.findStampByUserIdStampNumEventId(stampNum, userId,
				eventId) != null) {
			stampService.removeStamp(stampNum, userId, eventId);
		}

		reviewService.removeReview(reviewNum);
		
		return "redirect:/member_mypage.do?tabId=myReviewTab";

	}

}
