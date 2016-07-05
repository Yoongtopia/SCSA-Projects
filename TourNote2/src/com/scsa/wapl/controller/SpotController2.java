package com.scsa.wapl.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.exif.GpsDirectory;
import com.scsa.wapl.service.RecordLocationService;
import com.scsa.wapl.entity.Member;
import com.scsa.wapl.entity.RecordRoute;
import com.scsa.wapl.entity.TravelRecord;
import com.scsa.wapl.entity.Photo;
import com.scsa.wapl.entity.Transportation;
import com.scsa.wapl.entity.TravelSpot;
import com.scsa.wapl.entity.TravelTransportation;
import com.scsa.wapl.service.RecordService;
import com.scsa.wapl.service.SpotService;
import com.scsa.wapl.service.TransportationService;
import com.scsa.wapl.util.AdvancedPageUtility;


@Controller
public class SpotController2 {

	private Logger logger = Logger.getLogger(SpotController2.class);
	
	private SpotService spotService;
	
	private RecordService recordService;

	private TransportationService transportationService;
	
	private RecordLocationService recordLocationService;
	
	@Autowired
	public void setSpotService(SpotService spotService) {
		this.spotService = spotService;
	}
	
	@Autowired
	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}
	
	@Autowired
	public void setTransportationService(TransportationService transportationService) {
		this.transportationService = transportationService;
	}
	
	@Autowired
	public void setRecordLocationService(RecordLocationService recordLocationService) {
		this.recordLocationService = recordLocationService;
	}
	
	// 기록 페이지로 이동
	@RequestMapping("/spot_main2.do")
	public String goSpotPage(Model model, HttpSession session, HttpServletRequest request) {
		Member member=(Member)session.getAttribute("member");
		List<TravelRecord> recordList=recordService.findRecordById(member.getMemberId());
		request.setAttribute("recordList", recordList);
		model.addAttribute("recordList", recordList);
		model.addAttribute("contentPage", "app_main.jsp");
		return "app_index.jsp";
	}
	
	// 기록 페이지로 상세보기 보내기
	@RequestMapping("/upload_detail2.do")
	public String uploadDetail(HttpServletRequest request, Model model, HttpSession session) throws IllegalStateException, IOException, JpegProcessingException{	
		int recordNum = (int)session.getAttribute("recordNum");
		int spotNum = 0;
		
		List<TravelSpot> spotList=spotService.findSpotListByRecordNum(recordNum);
		
		for (TravelSpot spot : spotList) {
			spotNum = spot.getSpotNum();
			List<Photo> pList = spotService.findPhotoBySpotNumAndRecordNum(recordNum, spotNum);
			for(Photo pp : pList) {
				pp.getPhotoName();
			}			
		}
		
		Double latitude = 0.0;
		Double longitude = 0.0;
		
		if (spotList.size() > 0){
			latitude = spotList.get(0).getSpotLatitude();
			longitude = spotList.get(0).getSpotLongitude();
		}
		
		//동일한 record num에 있는 모든 경로를 시간순으로 가져감
		List<RecordRoute> routeList=recordLocationService.findRouteByNum(recordNum);
		request.setAttribute("routeList", routeList);
		
		request.setAttribute("spotList", spotList);
		model.addAttribute("spotList", spotList);
		request.setAttribute("recordNum", recordNum);
		
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("contentPage", "app_main.jsp");		
		return "app_index.jsp";
	}
	
	// record 버튼 누르면 기존 기록 이어갈지, 새로 시작할지 선택창으로 이동
	@RequestMapping(value="/record_start2.do")
	public String recordStart(HttpSession session, Model model) throws UnsupportedEncodingException{
		// id로 종료하지 않은(record title 없는) 기록 목록 가져오기
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		List<TravelRecord> recordList=recordService.findNotEndRecordById(memberId);

		model.addAttribute("recordList", recordList);
		model.addAttribute("contentPage", "app_recordTypeSelect2.jsp");
		return "app_index.jsp";
	}
	
	// 새로하기 누를 시, 제목 입력 창으로 이동
	@RequestMapping(value="/view_titleRegist2.do")
	public String viewTitleRegist(HttpSession session, Model model) throws UnsupportedEncodingException{
		model.addAttribute("contentPage", "app_recordTitleRegist2.jsp");
		return "app_index.jsp";
	}
	
	// 새로운 기록 생성하고, spotMain 페이지로 이동
	@RequestMapping(value="/regist_record2.do")
	public String registRecord(String recordTitle, HttpSession session, Model model) throws UnsupportedEncodingException{
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		recordService.createRecord(new TravelRecord(memberId,recordTitle));
		
		List<TravelRecord> recordList=recordService.findRecordById(memberId);
		int recordNum=recordList.get(0).getRecordNum();
		session.setAttribute("recordNum", recordNum);
		
		/*model.addAttribute("contentPage", "spotMain.jsp");*/
		return "redirect:/upload_detail2.do";
	}
	
	// 기록 안할 것이므로, 그냥 spotMain 페이지로 이동
	@RequestMapping(value="/cancel_record2.do")
	public String cancelRecord(HttpSession session, Model model) throws UnsupportedEncodingException{
		/*return "redirect:/upload_detail.do";*/
		model.addAttribute("contentPage", "app_main.jsp");	
		return "app_index.jsp";
	}
	
	// 이어서 작성할 작성 중이던 기록 리스트를 가지고 선택 창으로 이동
	@RequestMapping(value="/view_recordList2.do")
	public String viewRecordList(HttpServletRequest request, HttpSession session, Model model) throws UnsupportedEncodingException{
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		List<TravelRecord> recordList=recordService.findNotEndRecordById(memberId);

		request.setAttribute("recordList", recordList);
		model.addAttribute("contentPage", "app_recordSelect2.jsp");
		return "app_index.jsp";
	}
	
	// 이어서 작성할 기록의 spot들을 찍어줌
	@RequestMapping(value="/continue_record2.do")
	public String continueRecord(int recordNum, HttpServletRequest request, HttpSession session, Model model) throws UnsupportedEncodingException{
		session.setAttribute("recordNum", recordNum);
		
		return "redirect:/upload_detail2.do";
	}
		
	
	// 글,사진 등록 화면으로 이동 - 현재위치, 지정위치
	@RequestMapping("/uploadCont_view2.do")
	public String contView(String uploadType, Double latitude, Double longitude, HttpSession session, Model model){
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = spotService.countRecordNum(recordNum)+1;
		session.setAttribute("spotNum", spotNum);

		if (!uploadType.equals("photoUpload")){
			model.addAttribute("latitude", latitude);
			model.addAttribute("longitude", longitude);
		}
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("contentPage", "app_uploadCont2.jsp");
		return "app_index.jsp";
	}
	
	// 글,사진 등록 화면으로 뒤로가기 - 현재위치, 지정위치
	@RequestMapping("/uploadCont_view_back2.do")
	public String contViewBack(String country, String transportationType, String transportation, Double latitude, Double longitude, String uploadType, HttpSession session, Model model){
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");
		TravelSpot travelSpot=spotService.findSpot(recordNum, spotNum);
		List<Photo> photoList=spotService.findPhotoBySpotNumAndRecordNum(recordNum, spotNum);
		
		// 기존에 있던 것 지우고 새로 교통 저장
		transportationService.removeTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
		
		if (transportation != null){
			String[] transportationList=transportation.split(",");
			String[] transportationTypeList=transportationType.split(",");
	
			if (! transportation.equals("")){
				for (int index=0; index<transportationList.length; index++){
					if (transportationService.countTransportationListByName(transportationList[index]) != 0){
						transportationService.createTravelTransportation(new TravelTransportation(spotNum, index+1, transportationTypeList[index], transportationList[index], country), recordNum);
					} else {
						//없으면 교통정보 테이블에 먼저 넣기
						transportationService.createTransportation(new Transportation(transportationTypeList[index], transportationList[index], country));
						transportationService.createTravelTransportation(new TravelTransportation(spotNum, index+1, transportationTypeList[index], transportationList[index], country), recordNum);
					}
				}
			}
		}
		
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("travelSpot", travelSpot);
		model.addAttribute("photoList", photoList);
		model.addAttribute("contentPage", "app_uploadCont2.jsp");
		return "app_index.jsp";
	}
	
	// 글,사진 저장 후 교통등록 화면으로 - 현재위치, 지정위치
	@RequestMapping("/uploadTransportation_view2.do")
	public String transportationView(String uploadType, String title, String content, Double latitude, Double longitude, HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException, JpegProcessingException{
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");
		Member member=(Member) session.getAttribute("member");
		String memberId=member.getMemberId();
				
		TravelSpot travelSpot=spotService.findSpot(recordNum, spotNum);
		// 여행 기록이 있으면 다시 수정, 없으면 새로 저장
		if (travelSpot == null){
			spotService.createSpot(new TravelSpot(spotNum, memberId, title, content, latitude, longitude, recordNum, uploadType));
		} else {
			travelSpot.setSpotTitle(title);
			travelSpot.setSpotCont(content);
			spotService.modifySpot(travelSpot);
		}
		
		
		String saveDir=request.getServletContext().getRealPath("/image");
		
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;  //다중파일 업로드
		List<MultipartFile> files = multipartRequest.getFiles("image");
	
		// 사진 저장
		for (MultipartFile file : files){
			if (file.getOriginalFilename() != ""){
				file.transferTo(new File(saveDir+"/"+file.getOriginalFilename()));
				String image = file.getOriginalFilename();
				String extName=image.substring(image.lastIndexOf(".")+1, image.length());
				File f=new File(saveDir +"/" + image);
				//메타 정보 있는 것, 없는 것 나눠서
				if (extName.equals("jpg") || extName.equals("jpeg") || extName.equals("JPG") ||extName.equals("JPEG")
						&& JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class) != null){
						Double currentLatitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLatitude();
						Double currentLongitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLongitude();
						spotService.createPhoto(new Photo(image, currentLatitude, currentLongitude), recordNum, spotNum);	
				} else {
					spotService.createPhoto(new Photo(image), recordNum, spotNum);
				}
			}
		}
		
		// 뒤로가기 해서 온 경우, 이전에 등록한 교통 정보 다시 보여주도록 담아주기
		List<TravelTransportation> travelTransportationList=transportationService.findTravelTransportationListBySpotNumAndRecordNum(spotNum, recordNum);
		request.setAttribute("travelTransportationList", travelTransportationList);
		
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("contentPage", "app_uploadTransportation2.jsp");
		return "app_index.jsp";
	}
	
	// 교통정보 저장 후 spotMain 페이지로 - 현재위치, 지정위치
	@RequestMapping("/upload_spot2.do")
	public String uploadSpot(String country, String transportationType, String transportation, HttpServletRequest request, HttpSession session, Model model) throws JpegProcessingException, IOException{
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
				
		// 교통 저장 - 이전에 있던 것 지우고 다시 저장
		transportationService.removeTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
		
		String[] transportationList=transportation.split(",");
		String[] transportationTypeList=transportationType.split(",");
		
		if (! transportation.equals("")){
			for (int index=0; index<transportationList.length; index++){
				if (transportationService.countTransportationListByName(transportationList[index]) != 0){
					transportationService.createTravelTransportation(new TravelTransportation(spotNum, index+1, transportationTypeList[index], transportationList[index], country), recordNum);
				} else {
					//없으면 교통정보 테이블에 먼저 넣기
					transportationService.createTransportation(new Transportation(transportationTypeList[index], transportationList[index], country));
					transportationService.createTravelTransportation(new TravelTransportation(spotNum, index+1, transportationTypeList[index], transportationList[index], country), recordNum);
				}
				
			}
		}
		
		session.removeAttribute("spotNum");
		return "redirect:/upload_detail2.do";
	}
	
	// 글,사진 저장 후 위치 선택 화면으로 - 사진 위치
	@RequestMapping("/uploadTransportation_view_byPhoto2.do")
	public String transportationViewByPhoto(String uploadType, String title, String content, HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException, JpegProcessingException{
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");
		Member member=(Member) session.getAttribute("member");
		String memberId=member.getMemberId();

		TravelSpot travelSpot=spotService.findSpot(recordNum, spotNum);
		// 여행 기록이 있으면 다시 수정, 없으면 새로 저장
		if (travelSpot == null){
			spotService.createSpot(new TravelSpot(spotNum, memberId, title, content, 0, 0, recordNum, uploadType));
		} else {
			travelSpot.setSpotTitle(title);
			travelSpot.setSpotCont(content);
			spotService.modifySpot(travelSpot);
		}
		
		
		String saveDir=request.getServletContext().getRealPath("/image");
		
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;  //다중파일 업로드
		List<MultipartFile> files = multipartRequest.getFiles("image");
	
		// 사진 저장
		for (MultipartFile file : files){
			if (file.getOriginalFilename() != ""){
				file.transferTo(new File(saveDir+"/"+file.getOriginalFilename()));
				String image = file.getOriginalFilename();
				String extName=image.substring(image.lastIndexOf(".")+1, image.length());
				File f=new File(saveDir +"/" + image);
				//메타 정보 있는 것, 없는 것 나눠서
				if (extName.equals("jpg") || extName.equals("jpeg") || extName.equals("JPG") ||extName.equals("JPEG")
						&& JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class) != null){
						Double currentLatitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLatitude();
						Double currentLongitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLongitude();
						spotService.createPhoto(new Photo(image, currentLatitude, currentLongitude), recordNum, spotNum);	
				} else {
					spotService.createPhoto(new Photo(image), recordNum, spotNum);
				}
			}
		}
		
		List<Photo> photoList=spotService.findPhotoBySpotNumAndRecordNum(recordNum, spotNum);
		request.setAttribute("photoList", photoList);
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("contentPage", "app_addressSelect3.jsp");
		return "app_index.jsp";
	}
	
	// 선택한 위치 등록 후, 교통 등록 페이지로 이동 - 사진 위치
	@RequestMapping("/regist_gps2.do")
	public String registGps(String uploadType, String gps, HttpServletRequest request, HttpSession session, Model model) throws JpegProcessingException, IOException{
		int index=gps.indexOf("/");
		Double latitude=Double.parseDouble(gps.substring(0, index));
		Double longitude=Double.parseDouble(gps.substring(index+1));

		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
		
		// 여행 기록에 지정한 위치 등록하도록 update
		TravelSpot travelSpot=spotService.findSpot(recordNum, spotNum);
		
		if (travelSpot.getSpotTitle() == null){
			travelSpot.setSpotTitle("");
		}
		if (travelSpot.getSpotCont() == null){
			travelSpot.setSpotCont("");;
		}
		travelSpot.setSpotLatitude(latitude);
		travelSpot.setSpotLongitude(longitude);
		spotService.modifySpot(travelSpot);
		
		// 뒤로가기 해서 온 경우, 이전에 등록한 교통 정보 다시 보여주도록 담아주기
		List<TravelTransportation> travelTransportationList=transportationService.findTravelTransportationListBySpotNumAndRecordNum(spotNum, recordNum);
		request.setAttribute("travelTransportationList", travelTransportationList);
		
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("contentPage", "app_uploadTransportation2.jsp");
		return "app_index.jsp";
	}
	
	
	// 기록 도중 취소 버튼 누르면 등록된 기록,사진,교통 삭제 - 현재위치, 지정위치
	@RequestMapping("/upload_delete2.do")
	public String uploadDelete(HttpServletRequest request, HttpSession session, Model model) throws JpegProcessingException, IOException{
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
		
		//spotNum에 해당하는 사진 있으면 삭제
		spotService.removePhotoBySpotNumAndRecordNum(recordNum, spotNum);
		//spotNum에 해당하는 교통 있으면 삭제
		transportationService.removeTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
		//spotNum에 해당하는 여행 기록 있으면 삭제
		spotService.removeSpot(recordNum, spotNum);
		
		session.removeAttribute("spotNum");
		return "redirect:/upload_detail2.do";
	}
	
	// 등록한 사진 삭제
	@RequestMapping("/delete_image2.do")
	@ResponseBody
	public void deleteImage(String photoName, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
		
		spotService.removePhoto(photoName, recordNum, spotNum);
	}
	
	// 사진 중복 체크
	@RequestMapping("/photo_check2.do")
	@ResponseBody
	public HashMap<String, Object> photoCheck(String photoName, HttpSession session, Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
		
		Photo photo=spotService.findPhoto(photoName, recordNum, spotNum);
		if (photo == null){
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		
		return map;
	}
	
	// 여행 기록(spot) 삭제
	@RequestMapping("/delete_spot2.do")
	public String deleteSpot(int spotNum, HttpServletRequest request, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		
		//spotNum에 해당하는 사진 있으면 삭제
		spotService.removePhotoBySpotNumAndRecordNum(recordNum, spotNum);
		//spotNum에 해당하는 교통 있으면 삭제
		transportationService.removeTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
		//spotNum에 해당하는 여행 기록 있으면 삭제
		spotService.removeSpot(recordNum, spotNum);

		//spotNum보다 spotNum이 큰 기록에 대하여, spot, photo, transportation spotNum 하나씩 감소
		List<TravelSpot> spotList=spotService.findSpotListByRecordNum(recordNum);
		for (TravelSpot spot : spotList){
			if (spot.getSpotNum() > spotNum){
				spotService.modifySpotNum(spot);
			}
		}	
				
		return "redirect:/upload_detail2.do";
	}
	
	// 각 spot의 photoList조회
	@RequestMapping("/spot_photoList2.do")
	@ResponseBody
	public HashMap<String, Object> spotPhotoList(int spotNum, HttpServletRequest request, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");

		List<Photo> pList = spotService.findPhotoBySpotNumAndRecordNum(recordNum, spotNum);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pList", pList);
		return map;
	}
	
	// 각 spot 상세보기
	@RequestMapping("/view_detail2.do")
	@ResponseBody
	public HashMap<String, Object> viewDetail(int spotNum, HttpServletRequest request, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");

		List<Photo> pList = spotService.findPhotoBySpotNumAndRecordNum(recordNum, spotNum);
		TravelSpot spot = spotService.findSpot(recordNum, spotNum);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pList", pList);
		map.put("spot", spot);
		
		return map;
	}
	
	// 편집창에서 사진 업로드 페이지로 이동
	@RequestMapping("/edit_photoUpload_form2.do")
	public String goEditPhotoUploadPage(Model model, HttpServletRequest request, int recordNum, int spotNum) {
		model.addAttribute("recordNum", recordNum);
		model.addAttribute("spotNum", spotNum);
		return "app_recordEditPhotoUpload.jsp";
	}

	
	// 편집창에서 사진업로드
	@RequestMapping("/edit_photoUpload2.do")
	public String editPhotoUpload(HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException, JpegProcessingException{
		int recordNum = Integer.parseInt(request.getParameter("recordNum"));
		int spotNum = Integer.parseInt(request.getParameter("spotNum"));
						
		String saveDir=request.getServletContext().getRealPath("/image");
		
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;  //다중파일 업로드
		List<MultipartFile> files = multipartRequest.getFiles("image");
	
		// 사진 저장
		for (MultipartFile file : files){
			if (file.getOriginalFilename() != ""){
				file.transferTo(new File(saveDir+"/"+file.getOriginalFilename()));
				String image = file.getOriginalFilename();
				spotService.createPhoto(new Photo(image), recordNum, spotNum);
			}
		}
		return "editRecordForm2.do?recordNum="+recordNum;		
	}

	// 기록 종료 버튼 눌렀을 떄, 종료 확인 페이지로 이동
	@RequestMapping("/end_check2.do")
	public String endCheck(HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		List<TravelSpot> spotList=spotService.findSpotListByRecordNum(recordNum);
		
		model.addAttribute("spotList", spotList);
		model.addAttribute("contentPage", "app_recordEndCheck2.jsp");
	
		return "app_index.jsp";
	}
	
	// 기록 종료 예 했을 때, 제목, 사진 선택 화면으로 이동 - 여행기에 저장한 모든 사진 가져감
	@RequestMapping("/end_yes_view2.do")
	public String endView(HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		TravelRecord record=recordService.findRecord(recordNum);
		List<TravelSpot> spotList=record.getTravelSpotList();
		List<Photo> photoList=new ArrayList<Photo>();
		for (TravelSpot spot : spotList){
			List<Photo> spotPhoto=spot.getPhotoList();
			for (Photo photo : spotPhoto){
				photoList.add(photo);
			}
		}
		
		model.addAttribute("photoList", photoList);
		model.addAttribute("recordTitle", record.getRecordTitle());
/*		model.addAttribute("spotList", spotList);*/
		model.addAttribute("contentPage", "app_recordInfoRegist2.jsp");
		
		return "app_index.jsp";
	}
	
	// 기록 종료 아니오 했을 떄, 다시 기록 화면으롱 이동
	@RequestMapping("/end_no2.do")
	public String endNo(HttpSession session, Model model) {
		
		return "redirect:/upload_detail2.do";
	}
		
	// 기록 종료 시, 제목, 대표사진, 대륙 선택 받아서 저장 후 기록 종료. 메인페이지로 이동
	@RequestMapping("/end_record2.do")
	public String end_record(String recordTitle, String recordPhoto, String recordContinental, String openPublic, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");

		//record에 photoName과 title update
		TravelRecord travelRecord=recordService.findRecord(recordNum);
		travelRecord.setRecordTitle(recordTitle);
		travelRecord.setRecordPhoto(recordPhoto);
		travelRecord.setOpenPublic(openPublic);
		recordService.modifyRecord(travelRecord);
		
		// recordContinental에서 각 continental값 분리
		String[] continentals=recordContinental.split(",");

		// continental 값 넣기
		for (int i=0; i<continentals.length; i++){
			recordLocationService.createContinental(continentals[i], recordNum);
		}
		
		session.removeAttribute("recordNum");
		model.addAttribute("contentPage", "app_main.jsp");
		
		return "app_index.jsp";
	}
	
	// 기록이 하나도 없을 때, 기록을 삭제하고 메인 페이지로 이동
	@RequestMapping("/end_yes_delete2.do")
	public String endYesDelete(HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		recordService.removeRecord(recordNum);
		session.removeAttribute("recordNum");
		model.addAttribute("contentPage", "app_main.jsp");
		
		return "app_index.jsp";
	}

}//end class