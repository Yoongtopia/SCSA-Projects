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
	
	// ��� �������� �̵�
	@RequestMapping("/spot_main2.do")
	public String goSpotPage(Model model, HttpSession session, HttpServletRequest request) {
		Member member=(Member)session.getAttribute("member");
		List<TravelRecord> recordList=recordService.findRecordById(member.getMemberId());
		request.setAttribute("recordList", recordList);
		model.addAttribute("recordList", recordList);
		model.addAttribute("contentPage", "app_main.jsp");
		return "app_index.jsp";
	}
	
	// ��� �������� �󼼺��� ������
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
		
		//������ record num�� �ִ� ��� ��θ� �ð������� ������
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
	
	// record ��ư ������ ���� ��� �̾��, ���� �������� ����â���� �̵�
	@RequestMapping(value="/record_start2.do")
	public String recordStart(HttpSession session, Model model) throws UnsupportedEncodingException{
		// id�� �������� ����(record title ����) ��� ��� ��������
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		List<TravelRecord> recordList=recordService.findNotEndRecordById(memberId);

		model.addAttribute("recordList", recordList);
		model.addAttribute("contentPage", "app_recordTypeSelect2.jsp");
		return "app_index.jsp";
	}
	
	// �����ϱ� ���� ��, ���� �Է� â���� �̵�
	@RequestMapping(value="/view_titleRegist2.do")
	public String viewTitleRegist(HttpSession session, Model model) throws UnsupportedEncodingException{
		model.addAttribute("contentPage", "app_recordTitleRegist2.jsp");
		return "app_index.jsp";
	}
	
	// ���ο� ��� �����ϰ�, spotMain �������� �̵�
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
	
	// ��� ���� ���̹Ƿ�, �׳� spotMain �������� �̵�
	@RequestMapping(value="/cancel_record2.do")
	public String cancelRecord(HttpSession session, Model model) throws UnsupportedEncodingException{
		/*return "redirect:/upload_detail.do";*/
		model.addAttribute("contentPage", "app_main.jsp");	
		return "app_index.jsp";
	}
	
	// �̾ �ۼ��� �ۼ� ���̴� ��� ����Ʈ�� ������ ���� â���� �̵�
	@RequestMapping(value="/view_recordList2.do")
	public String viewRecordList(HttpServletRequest request, HttpSession session, Model model) throws UnsupportedEncodingException{
		Member member=(Member)session.getAttribute("member");
		String memberId=member.getMemberId();
		List<TravelRecord> recordList=recordService.findNotEndRecordById(memberId);

		request.setAttribute("recordList", recordList);
		model.addAttribute("contentPage", "app_recordSelect2.jsp");
		return "app_index.jsp";
	}
	
	// �̾ �ۼ��� ����� spot���� �����
	@RequestMapping(value="/continue_record2.do")
	public String continueRecord(int recordNum, HttpServletRequest request, HttpSession session, Model model) throws UnsupportedEncodingException{
		session.setAttribute("recordNum", recordNum);
		
		return "redirect:/upload_detail2.do";
	}
		
	
	// ��,���� ��� ȭ������ �̵� - ������ġ, ������ġ
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
	
	// ��,���� ��� ȭ������ �ڷΰ��� - ������ġ, ������ġ
	@RequestMapping("/uploadCont_view_back2.do")
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
		model.addAttribute("contentPage", "app_uploadCont2.jsp");
		return "app_index.jsp";
	}
	
	// ��,���� ���� �� ������ ȭ������ - ������ġ, ������ġ
	@RequestMapping("/uploadTransportation_view2.do")
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
		
		// �ڷΰ��� �ؼ� �� ���, ������ ����� ���� ���� �ٽ� �����ֵ��� ����ֱ�
		List<TravelTransportation> travelTransportationList=transportationService.findTravelTransportationListBySpotNumAndRecordNum(spotNum, recordNum);
		request.setAttribute("travelTransportationList", travelTransportationList);
		
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("uploadType", uploadType);
		model.addAttribute("contentPage", "app_uploadTransportation2.jsp");
		return "app_index.jsp";
	}
	
	// �������� ���� �� spotMain �������� - ������ġ, ������ġ
	@RequestMapping("/upload_spot2.do")
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
		return "redirect:/upload_detail2.do";
	}
	
	// ��,���� ���� �� ��ġ ���� ȭ������ - ���� ��ġ
	@RequestMapping("/uploadTransportation_view_byPhoto2.do")
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
	
	// ������ ��ġ ��� ��, ���� ��� �������� �̵� - ���� ��ġ
	@RequestMapping("/regist_gps2.do")
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
		model.addAttribute("contentPage", "app_uploadTransportation2.jsp");
		return "app_index.jsp";
	}
	
	
	// ��� ���� ��� ��ư ������ ��ϵ� ���,����,���� ���� - ������ġ, ������ġ
	@RequestMapping("/upload_delete2.do")
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
		return "redirect:/upload_detail2.do";
	}
	
	// ����� ���� ����
	@RequestMapping("/delete_image2.do")
	@ResponseBody
	public void deleteImage(String photoName, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		int spotNum = (int) session.getAttribute("spotNum");	
		
		spotService.removePhoto(photoName, recordNum, spotNum);
	}
	
	// ���� �ߺ� üũ
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
	
	// ���� ���(spot) ����
	@RequestMapping("/delete_spot2.do")
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
				
		return "redirect:/upload_detail2.do";
	}
	
	// �� spot�� photoList��ȸ
	@RequestMapping("/spot_photoList2.do")
	@ResponseBody
	public HashMap<String, Object> spotPhotoList(int spotNum, HttpServletRequest request, HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");

		List<Photo> pList = spotService.findPhotoBySpotNumAndRecordNum(recordNum, spotNum);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pList", pList);
		return map;
	}
	
	// �� spot �󼼺���
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
	
	// ����â���� ���� ���ε� �������� �̵�
	@RequestMapping("/edit_photoUpload_form2.do")
	public String goEditPhotoUploadPage(Model model, HttpServletRequest request, int recordNum, int spotNum) {
		model.addAttribute("recordNum", recordNum);
		model.addAttribute("spotNum", spotNum);
		return "app_recordEditPhotoUpload.jsp";
	}

	
	// ����â���� �������ε�
	@RequestMapping("/edit_photoUpload2.do")
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
		return "editRecordForm2.do?recordNum="+recordNum;		
	}

	// ��� ���� ��ư ������ ��, ���� Ȯ�� �������� �̵�
	@RequestMapping("/end_check2.do")
	public String endCheck(HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		List<TravelSpot> spotList=spotService.findSpotListByRecordNum(recordNum);
		
		model.addAttribute("spotList", spotList);
		model.addAttribute("contentPage", "app_recordEndCheck2.jsp");
	
		return "app_index.jsp";
	}
	
	// ��� ���� �� ���� ��, ����, ���� ���� ȭ������ �̵� - ����⿡ ������ ��� ���� ������
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
	
	// ��� ���� �ƴϿ� ���� ��, �ٽ� ��� ȭ������ �̵�
	@RequestMapping("/end_no2.do")
	public String endNo(HttpSession session, Model model) {
		
		return "redirect:/upload_detail2.do";
	}
		
	// ��� ���� ��, ����, ��ǥ����, ��� ���� �޾Ƽ� ���� �� ��� ����. ������������ �̵�
	@RequestMapping("/end_record2.do")
	public String end_record(String recordTitle, String recordPhoto, String recordContinental, String openPublic, HttpSession session, Model model) {
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
		model.addAttribute("contentPage", "app_main.jsp");
		
		return "app_index.jsp";
	}
	
	// ����� �ϳ��� ���� ��, ����� �����ϰ� ���� �������� �̵�
	@RequestMapping("/end_yes_delete2.do")
	public String endYesDelete(HttpSession session, Model model) {
		int recordNum=(int) session.getAttribute("recordNum");
		recordService.removeRecord(recordNum);
		session.removeAttribute("recordNum");
		model.addAttribute("contentPage", "app_main.jsp");
		
		return "app_index.jsp";
	}

}//end class