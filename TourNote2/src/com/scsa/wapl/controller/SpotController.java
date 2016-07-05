package com.scsa.wapl.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class SpotController {

	private Logger logger = Logger.getLogger(SpotController.class);
	
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
	
	@RequestMapping("/index.do")
	public String startPage() {
		
		return "";
	}
	
	@RequestMapping("/time_set.do")
	@ResponseBody
	public HashMap<String, Object> timeSet(Model model, HttpSession session, HttpServletRequest request) {
		
		int recordNum = (int)session.getAttribute("recordNum");
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		String dateStart = recordService.findRecordStartTime(recordNum, memberId);
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date date = new Date();
		
		String dateStop = dateFormat.format(date);
 
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date d1 = null;
		Date d2 = null;
		
/*		long diffSeconds = 0;*/
		long diffMinutes = 0;
		long diffHours = 0;
		long diffDays = 0;
		try {
			d1 = format.parse(dateStart);
			d2 = format.parse(dateStop);

			long diff = d2.getTime() - d1.getTime();
 
/*			diffSeconds = diff / 1000 % 60;*/
			diffMinutes = diff / (60 * 1000) % 60;
			diffHours = diff / (60 * 60 * 1000) % 24;
			diffDays = diff / (24 * 60 * 60 * 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("days", diffDays);
		map.put("hours", diffHours);
		map.put("minutes", diffMinutes);
		
		return map;
	}
	
	// ��� �������� �̵�
	@RequestMapping("/spot_main.do")
	public String goSpotPage(Model model, HttpSession session, HttpServletRequest request) {
		Member member=(Member)session.getAttribute("member");
		List<TravelRecord> recordList=recordService.findRecordById(member.getMemberId());
		request.setAttribute("recordList", recordList);
		model.addAttribute("recordList", recordList);
		model.addAttribute("contentPage", "spotMain.jsp");
		return "index.jsp";
	}
	
	// ��� �������� �󼼺��� ������
	@RequestMapping("/upload_detail.do")
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
			latitude=spotList.get(spotList.size()-1).getSpotLatitude();
			longitude=spotList.get(spotList.size()-1).getSpotLongitude();
		}
		
		//������ record num�� �ִ� ��� ��θ� �ð������� ������
		List<RecordRoute> routeList=recordLocationService.findRouteByNum(recordNum);
		request.setAttribute("routeList", routeList);
		
		request.setAttribute("spotList", spotList);
		model.addAttribute("spotList", spotList);
		request.setAttribute("recordNum", recordNum);
		
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("contentPage", "mainPage.jsp");		
		model.addAttribute("target", "n2");
		return "index.jsp";
	}
		
	// record ��ư ������ ���� ��� �̾��, ���� �������� ����â���� �̵�
	@RequestMapping(value="/record_start.do")
	public String recordStart(HttpSession session, Model model) throws UnsupportedEncodingException{
		// id�� �������� ����(record title ����) ��� ��� ��������
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		List<TravelRecord> recordList=recordService.findNotEndRecordById(memberId);

		model.addAttribute("recordList", recordList);
		model.addAttribute("contentPage", "recordTypeSelect.jsp");
		return "index.jsp";
	}
	
	// �����ϱ� ���� ��, ���� �Է� â���� �̵�
	@RequestMapping(value="/view_titleRegist.do")
	public String viewTitleRegist(HttpSession session, Model model) throws UnsupportedEncodingException{
		model.addAttribute("contentPage", "recordTitleRegist.jsp");
		return "index.jsp";
	}
	
	// ���� �Է¹޾� ���ο� ��� �����ϰ�, spotMain �������� �̵�
	@RequestMapping(value="/regist_record.do")
	public String registRecord(String recordTitle, HttpSession session, Model model) throws UnsupportedEncodingException{
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		recordService.createRecord(new TravelRecord(memberId,recordTitle));
		
		List<TravelRecord> recordList=recordService.findRecordById(memberId);
		int recordNum=recordList.get(0).getRecordNum();
		session.setAttribute("recordNum", recordNum);
		
		/*model.addAttribute("contentPage", "spotMain.jsp");*/
		return "redirect:/upload_detail.do";
	}
	
	// ��� ���� ���̹Ƿ�, �׳� spotMain �������� �̵�
	@RequestMapping(value="/cancel_record.do")
	public String cancelRecord(HttpSession session, Model model) throws UnsupportedEncodingException{
		/*return "redirect:/upload_detail.do";*/
		model.addAttribute("contentPage", "mainPage.jsp");		
		model.addAttribute("target", "n2");
		return "index.jsp";
	}
	
	// �̾ �ۼ��� �ۼ� ���̴� ��� ����Ʈ�� ������ ���� â���� �̵�
	@RequestMapping(value="/view_recordList.do")
	public String viewRecordList(HttpServletRequest request, HttpSession session, Model model) throws UnsupportedEncodingException{
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		List<TravelRecord> recordList=recordService.findNotEndRecordById(memberId);

		request.setAttribute("recordList", recordList);
		model.addAttribute("contentPage", "recordSelect.jsp");
		return "index.jsp";
	}
	
	// �̾ �ۼ��� ����� spot���� �����
	@RequestMapping(value="/continue_record.do")
	public String continueRecord(int recordNum, HttpServletRequest request, HttpSession session, Model model) throws UnsupportedEncodingException{
		session.setAttribute("recordNum", recordNum);
		
		return "redirect:/upload_detail.do";
	}
	
	// Ÿ�Ӷ��� ����, ����¡ ó��
	@RequestMapping("timeline_list.do")
	@ResponseBody
	public HashMap<String, Object> timeLineList(Model model, HttpSession session, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int recordNum = (int)session.getAttribute("recordNum");
		List<TravelSpot> timeLineList=spotService.timeLineList(recordNum);
		if (timeLineList.size()>0){
			map.put("status", true);
			map.put("timeLineList", timeLineList);
		} else {
			map.put("status", false);
		}
		
		return map;
	}	
	
	// ��,���� ��� ȭ������ �̵� - ������ġ, ������ġ
	@RequestMapping("/uploadCont_view.do")
	public String contView(String uploadType, Double latitude, Double longitude, HttpSession session, Model model){
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = spotService.countRecordNum(recordNum)+1;
		session.setAttribute("spotNum", spotNum);

		if (!uploadType.equals("photoUpload")){
			model.addAttribute("latitude", latitude);
			model.addAttribute("longitude", longitude);
		}
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("contentPage", "uploadCont.jsp");
		return "index.jsp";
	}
	
	// ��,���� ��� ȭ������ �ڷΰ��� - ������ġ, ������ġ
	@RequestMapping("/uploadCont_view_back.do")
	public String contViewBack(String country, String transportationType, String transportation, Double latitude, Double longitude, String uploadType, HttpSession session, Model model){
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");
		TravelSpot travelSpot=spotService.findSpot(recordNum, spotNum);
		List<Photo> photoList=spotService.findPhotoBySpotNumAndRecordNum(recordNum, spotNum);
		
		// ������ �ִ� �� ����� ���� ���� ����
		transportationService.removeTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
		
		if (transportation != null){
			String[] transportationList=transportation.split(",");
			String[] transportationTypeList=transportationType.split(",");
	
			if (! transportation.equals("")){
				for (int index=0; index<transportationList.length; index++){
					if (transportationService.countTransportationListByName(transportationList[index]) != 0){
						transportationService.createTravelTransportation(new TravelTransportation(spotNum, index+1, transportationTypeList[index], transportationList[index], country), recordNum);
					} else {
						//������ �������� ���̺� ���� �ֱ�
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
		model.addAttribute("contentPage", "uploadCont.jsp");
		return "index.jsp";
	}
	
	// ��,���� ���� �� ������ ȭ������ - ������ġ, ������ġ
	@RequestMapping("/uploadTransportation_view.do")
	public String transportationView(String uploadType, String title, String content, Double latitude, Double longitude, HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException, JpegProcessingException{
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");
		Member member=(Member) session.getAttribute("member");
		String memberId=member.getMemberId();
				
		TravelSpot travelSpot=spotService.findSpot(recordNum, spotNum);
		// ���� ����� ������ �ٽ� ����, ������ ���� ����
		if (travelSpot == null){
			spotService.createSpot(new TravelSpot(spotNum, memberId, title, content, latitude, longitude, recordNum, uploadType));
		} else {
			travelSpot.setSpotTitle(title);
			travelSpot.setSpotCont(content);
			spotService.modifySpot(travelSpot);
		}
		
		
		String saveDir=request.getServletContext().getRealPath("/image");
		
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;  //�������� ���ε�
		List<MultipartFile> files = multipartRequest.getFiles("image");
	
		// ���� ����
		for (MultipartFile file : files){
			if (file.getOriginalFilename() != ""){
				file.transferTo(new File(saveDir+"/"+file.getOriginalFilename()));
				String image = file.getOriginalFilename();
				String extName=image.substring(image.lastIndexOf(".")+1, image.length());
				File f=new File(saveDir +"/" + image);
				//��Ÿ ���� �ִ� ��, ���� �� ������
				if ((extName.equals("jpg") || extName.equals("jpeg") || extName.equals("JPG") ||extName.equals("JPEG"))
						&& JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class) != null){
						Double currentLatitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLatitude();
						Double currentLongitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLongitude();
						spotService.createPhoto(new Photo(image, currentLatitude, currentLongitude), recordNum, spotNum);	
				} else {
					spotService.createPhoto(new Photo(image), recordNum, spotNum);
				}
			}
		}
		
/*		// ���� ����
		for (MultipartFile file : files){
			if (file.getOriginalFilename() != ""){
				file.transferTo(new File(saveDir+"/"+file.getOriginalFilename()));
				String image = file.getOriginalFilename();
				File f=new File(saveDir +"/" + image);
				//��Ÿ ���� �ִ� ��, ���� �� ������
				if (JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class) != null){
					Double currentLatitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLatitude();
					Double currentLongitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLongitude();
					spotService.createPhoto(new Photo(image, currentLatitude, currentLongitude), recordNum, spotNum);	
				} else {
					spotService.createPhoto(new Photo(image), recordNum, spotNum);
				}
				
			}
		}*/
		
		// �ڷΰ��� �ؼ� �� ���, ������ ����� ���� ���� �ٽ� �����ֵ��� ����ֱ�
		List<TravelTransportation> travelTransportationList=transportationService.findTravelTransportationListBySpotNumAndRecordNum(spotNum, recordNum);
		request.setAttribute("travelTransportationList", travelTransportationList);
		
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("contentPage", "uploadTransportation.jsp");
		return "index.jsp";
	}
	
	// �������� ���� �� spotMain �������� - ������ġ, ������ġ
	@RequestMapping("/upload_spot.do")
	public String uploadSpot(String country, String transportationType, String transportation, HttpServletRequest request, HttpSession session, Model model) throws JpegProcessingException, IOException{
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
				
		// ���� ���� - ������ �ִ� �� ����� �ٽ� ����
		transportationService.removeTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
		
		String[] transportationList=transportation.split(",");
		String[] transportationTypeList=transportationType.split(",");
		
		if (! transportation.equals("")){
			for (int index=0; index<transportationList.length; index++){
				if (transportationService.countTransportationListByName(transportationList[index]) != 0){
					transportationService.createTravelTransportation(new TravelTransportation(spotNum, index+1, transportationTypeList[index], transportationList[index], country), recordNum);
				} else {
					//������ �������� ���̺� ���� �ֱ�
					transportationService.createTransportation(new Transportation(transportationTypeList[index], transportationList[index], country));
					transportationService.createTravelTransportation(new TravelTransportation(spotNum, index+1, transportationTypeList[index], transportationList[index], country), recordNum);
				}
				
			}
		}
		
		session.removeAttribute("spotNum");
		return "redirect:/upload_detail.do";
	}
	
	// ��,���� ���� �� ��ġ ���� ȭ������ - ���� ��ġ
	@RequestMapping("/uploadTransportation_view_byPhoto.do")
	public String transportationViewByPhoto(String uploadType, String title, String content, HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException, JpegProcessingException{
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");
		Member member=(Member) session.getAttribute("member");
		String memberId=member.getMemberId();

		TravelSpot travelSpot=spotService.findSpot(recordNum, spotNum);
		// ���� ����� ������ �ٽ� ����, ������ ���� ����
		if (travelSpot == null){
			spotService.createSpot(new TravelSpot(spotNum, memberId, title, content, 0, 0, recordNum, uploadType));
		} else {
			travelSpot.setSpotTitle(title);
			travelSpot.setSpotCont(content);
			spotService.modifySpot(travelSpot);
		}
		
		
		String saveDir=request.getServletContext().getRealPath("/image");
		
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;  //�������� ���ε�
		List<MultipartFile> files = multipartRequest.getFiles("image");
	
		// ���� ����
		for (MultipartFile file : files){
			if (file.getOriginalFilename() != ""){
				file.transferTo(new File(saveDir+"/"+file.getOriginalFilename()));
				String image = file.getOriginalFilename();
				String extName=image.substring(image.lastIndexOf(".")+1, image.length());
				File f=new File(saveDir +"/" + image);
				//��Ÿ ���� �ִ� ��, ���� �� ������
				if ((extName.equals("jpg") || extName.equals("jpeg") || extName.equals("JPG") ||extName.equals("JPEG"))
						&& JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class) != null){
						Double currentLatitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLatitude();
						Double currentLongitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLongitude();
						spotService.createPhoto(new Photo(image, currentLatitude, currentLongitude), recordNum, spotNum);	
				} else {
					spotService.createPhoto(new Photo(image), recordNum, spotNum);
				}
			}
		}
		
/*		// ���� ����
		for (MultipartFile file : files){
			if (file.getOriginalFilename() != ""){
				file.transferTo(new File(saveDir+"/"+file.getOriginalFilename()));
				String image = file.getOriginalFilename();
				File f=new File(saveDir +"/" + image);
				//��Ÿ ���� �ִ� ��, ���� �� ������
				if (JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class) != null){
					Double currentLatitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLatitude();
					Double currentLongitude=JpegMetadataReader.readMetadata(f).getDirectory(GpsDirectory.class).getGeoLocation().getLongitude();
					spotService.createPhoto(new Photo(image, currentLatitude, currentLongitude), recordNum, spotNum);	
				} else {
					spotService.createPhoto(new Photo(image), recordNum, spotNum);
				}
				
			}
		}*/
		
		List<Photo> photoList=spotService.findPhotoWithGps(recordNum, spotNum);
		request.setAttribute("photoList", photoList);
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("contentPage", "addressSelect.jsp");
		return "index.jsp";
	}
	
	// ������ ��ġ ��� ��, ���� ��� �������� �̵� - ���� ��ġ
	@RequestMapping("/regist_gps.do")
	public String registGps(String uploadType, String gps, HttpServletRequest request, HttpSession session, Model model) throws JpegProcessingException, IOException{
		int index=gps.indexOf("/");
		Double latitude=Double.parseDouble(gps.substring(0, index));
		Double longitude=Double.parseDouble(gps.substring(index+1));

		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
		
		// ���� ��Ͽ� ������ ��ġ ����ϵ��� update
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
		
		// �ڷΰ��� �ؼ� �� ���, ������ ����� ���� ���� �ٽ� �����ֵ��� ����ֱ�
		List<TravelTransportation> travelTransportationList=transportationService.findTravelTransportationListBySpotNumAndRecordNum(spotNum, recordNum);
		request.setAttribute("travelTransportationList", travelTransportationList);
		
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("contentPage", "uploadTransportation.jsp");
		return "index.jsp";
	}
	
	
	// ��� ���� ��� ��ư ������ ��ϵ� ���,����,���� ���� - ������ġ, ������ġ
	@RequestMapping("/upload_delete.do")
	public String uploadDelete(HttpServletRequest request, HttpSession session, Model model) throws JpegProcessingException, IOException{
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
		
		//spotNum�� �ش��ϴ� ���� ������ ����
		spotService.removePhotoBySpotNumAndRecordNum(recordNum, spotNum);
		//spotNum�� �ش��ϴ� ���� ������ ����
		transportationService.removeTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
		//spotNum�� �ش��ϴ� ���� ��� ������ ����
		spotService.removeSpot(recordNum, spotNum);
		
		session.removeAttribute("spotNum");
		return "redirect:/upload_detail.do";
	}
	
	// ����� ���� ����
	@RequestMapping("/delete_image.do")
	@ResponseBody
	public void deleteImage(String photoName, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
		
		spotService.removePhoto(photoName, recordNum, spotNum);
	}
	
	// ���� �ߺ� üũ
	@RequestMapping("/photo_check.do")
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
	
	// ���� ���(spot) ����
	@RequestMapping("/delete_spot.do")
	public String deleteSpot(int spotNum, HttpServletRequest request, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		
		//spotNum�� �ش��ϴ� ���� ������ ����
		spotService.removePhotoBySpotNumAndRecordNum(recordNum, spotNum);
		//spotNum�� �ش��ϴ� ���� ������ ����
		transportationService.removeTravelTransportationBySpotNumAndRecordNum(spotNum, recordNum);
		//spotNum�� �ش��ϴ� ���� ��� ������ ����
		spotService.removeSpot(recordNum, spotNum);

		//spotNum���� spotNum�� ū ��Ͽ� ���Ͽ�, spot, photo, transportation spotNum �ϳ��� ����
		List<TravelSpot> spotList=spotService.findSpotListByRecordNum(recordNum);
		for (TravelSpot spot : spotList){
			if (spot.getSpotNum() > spotNum){
				spotService.modifySpotNum(spot);
			}
		}		
		return "redirect:/upload_detail.do";
	}
	
	// �� spot �󼼺���
	@RequestMapping("/view_detail.do")
	public String viewDetail(int spotNum, HttpServletRequest request, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");

		List<Photo> pList = spotService.findPhotoBySpotNumAndRecordNum(recordNum, spotNum);
		TravelSpot spot = spotService.findSpot(recordNum, spotNum);
		model.addAttribute("pList", pList);
		model.addAttribute("spot", spot);
		
		return "spotDetail.jsp";
	}
	
	// ����â���� ���� ���ε� �������� �̵�
	@RequestMapping("/edit_photoUpload_form.do")
	public String goEditPhotoUploadPage(Model model, HttpServletRequest request, int recordNum, int spotNum) {
		model.addAttribute("recordNum", recordNum);
		model.addAttribute("spotNum", spotNum);
		return "recordEditPhotoUpload.jsp";
	}

	
	// ����â���� �������ε�
	@RequestMapping("/edit_photoUpload.do")
	public String editPhotoUpload(HttpServletRequest request, HttpSession session, Model model) throws IllegalStateException, IOException, JpegProcessingException{
		int recordNum = Integer.parseInt(request.getParameter("recordNum"));
		int spotNum = Integer.parseInt(request.getParameter("spotNum"));
						
		String saveDir=request.getServletContext().getRealPath("/image");
		
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;  //�������� ���ε�
		List<MultipartFile> files = multipartRequest.getFiles("image");
	
		// ���� ����
		for (MultipartFile file : files){
			if (file.getOriginalFilename() != ""){
				file.transferTo(new File(saveDir+"/"+file.getOriginalFilename()));
				String image = file.getOriginalFilename();
				spotService.createPhoto(new Photo(image), recordNum, spotNum);	
			}
		}
		return "editRecordForm.do?recordNum="+recordNum;		
	}
	
	// ��� ���� ��ư ������ ��, ���� Ȯ�� �������� �̵�
	@RequestMapping("/end_check.do")
	public String endCheck(HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		List<TravelSpot> spotList=spotService.findSpotListByRecordNum(recordNum);
		
		model.addAttribute("spotList", spotList);
		model.addAttribute("contentPage", "recordEndCheck.jsp");
	
		return "index.jsp";
	}
	
	// ��� ���� �� ���� ��, ����, ���� ���� ȭ������ �̵� - ����⿡ ������ ��� ���� ������
	@RequestMapping("/end_yes_view.do")
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
		model.addAttribute("contentPage", "recordInfoRegist.jsp");
		
		return "index.jsp";
	}
	
	// ����� �ϳ��� ���� ��, ����� �����ϰ� ���� �������� �̵�
	@RequestMapping("/end_yes_delete.do")
	public String endYesDelete(HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		recordService.removeRecord(recordNum);
		session.removeAttribute("recordNum");
		model.addAttribute("contentPage", "mainPage.jsp");
		
		return "index.jsp";
	}
	
	// ��� ���� �ƴϿ� ���� ��, �ٽ� ��� ȭ������ �̵�
	@RequestMapping("/end_no.do")
	public String endNo(HttpSession session, Model model) {
		
		return "redirect:/upload_detail.do";
	}
		
	// ��� ���� ��, ����, ��ǥ����, ��� ���� �޾Ƽ� ���� �� ��� ����. ������������ �̵�
	@RequestMapping("/end_record.do")
	public String end_record(String recordTitle, String recordPhoto, String recordContinental, String openPublic, boolean goEdit, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");

		//record�� photoName�� title update
		TravelRecord travelRecord=recordService.findRecord(recordNum);
		travelRecord.setRecordTitle(recordTitle);
		travelRecord.setRecordPhoto(recordPhoto);
		travelRecord.setOpenPublic(openPublic);
		recordService.modifyRecord(travelRecord);
		
		// recordContinental���� �� continental�� �и�
		String[] continentals=recordContinental.split(",");

		// continental �� �ֱ�
		for (int i=0; i<continentals.length; i++){
			recordLocationService.createContinental(continentals[i], recordNum);
		}
		
		session.removeAttribute("recordNum");
		model.addAttribute("contentPage", "mainPage.jsp");
		
		if (goEdit){
			return "redirect:/editRecordForm.do?recordNum="+recordNum;
		} else {
			return "index.jsp";
		}
	}

}//end class