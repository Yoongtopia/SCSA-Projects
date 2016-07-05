package com.scse.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scse.entity.FreeCode;
import com.scse.entity.Mission5Progress;
import com.scse.entity.Progress;
import com.scse.entity.User;
import com.scse.service.FreeService;
import com.scse.service.ProgressService;

@Controller ("FreeController")
public class FreeController {

	private ProgressService progressService;
	private FreeService freeService;
	
	@Autowired
	public void setProgressService(ProgressService progressService) {
		this.progressService = progressService;
	}

	@Autowired	
	public void setFreeService(FreeService freeService) {
		this.freeService = freeService;
	}

	//리스트 불러오기
	@RequestMapping("free_code_list.scse")
	public String freeCodeList(Model model, String schoolNum, HttpSession session, String orderType) throws Exception{
		User user = (User) session.getAttribute("user");
		if(orderType.equals("codeDate")) {
			model.addAttribute("codeGalery", freeService.allFreeByDate());
		}else if(orderType.equals("codeHit")) {
			model.addAttribute("codeGalery", freeService.viewFreeCodeOrderByHit());
		}else if(orderType.equals("codeLike")) {
			model.addAttribute("codeGalery", freeService.viewFreeCodeOrderByLike());
		}else if(orderType.equals("sameSchool")) {
			model.addAttribute("codeGalery", freeService.viewMyGroupFreeCode(schoolNum));
		}
		model.addAttribute("user", user);
		model.addAttribute("codeList", freeService.allMyFree(user.getUserId()));
		model.addAttribute("Sidebar", "pages/HF/SidebarForFree.jsp");
		model.addAttribute("MainFrame", "pages/FreeCodeList.jsp");
		return "FreeModeManagementFrame";
	}
	
	//자유모드 코드 추가, 수정하기
	@RequestMapping("manage_free_code.scse")
	public String manageFreeCode(FreeCode freeCode, String manageFlag, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		model.addAttribute("Sidebar", "pages/HF/SidebarForFree.jsp");
		User user = (User) session.getAttribute("user");
		//코딩 이미지 변환
		String userId = user.getUserId();
	
		if(manageFlag.equals("insert")) {
			freeCode.setUserId(user.getUserId());
			freeService.addMyFree(freeCode);
		} else {
			freeService.modifyMyFree(freeCode);
		}
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("freeCode", freeCode);
		model.addAttribute("codeList", freeService.allMyFree(user.getUserId()));
		return "FreeModeFrame";
	}
	
	//자유모드 코드 삭제하기
	@RequestMapping("del_free_code.scse")
	public String delFreeCode(int codeNum, Model model, HttpSession session) throws Exception{
		String userId = ((User) session.getAttribute("user")).getUserId();
		freeService.removeMyFree(codeNum);
		model.addAttribute("Sidebar", "pages/HF/SidebarForFree.jsp");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("freeCode", freeService.viewMyFree(userId, codeNum));
		model.addAttribute("codeList", freeService.allMyFree(userId));
		return "FreeModeFrame";
	}
	
	//자유모드 수정하기
	@RequestMapping("modify_free_code.scse")
	public String modifyFreeCode(){
		
		return "";
	}
	
	//자유모드 좋아요하기
	//ajax로
	@RequestMapping("like_free_code_ajax.scse")
	@ResponseBody
	public String likeFreeCode(int codeNum) throws Exception{
		freeService.modifyRecommend(codeNum);		
		return "updateSuccess";
	}
	
	//내 자유 모드 리스트 불러오기
	@RequestMapping("my_free_code_list.scse")
	public String myFreeCodeList(){
		
		return "";
	}
	
	// 자유 모드 시작 메서드
	@RequestMapping("/start_free.scse")
	public String startFreeMode(Mission5Progress mission, Model model, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		Mission5Progress mission5 = (Mission5Progress) session
				.getAttribute("mission");
		if(progressService.viewMission5(user.getUserId(), mission.getMissionIndex())== null) {
			mission.setUserId(user.getUserId());
			progressService.addProgress(new Progress(user.getUserId(), mission5
					.getChapNum(), mission5.getQuizNum() + 1, 0, "", 0, 0));
			progressService.addMission5Progress(mission);
		}
		if (user.getuType() == 's') {
			model.addAttribute("chaMap", session.getAttribute("chaMap"));
		}
		model.addAttribute("Sidebar", "pages/HF/SidebarForFree.jsp");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("freeCode", mission);
		model.addAttribute("codeList", freeService.allMyFree(user.getUserId()));
		return "FreeModeFrame";
	}
	
	@RequestMapping("/select_free.scse")
	public String selectFreeCode(int codeNum, String freeUserId, Model model, HttpSession session) throws Exception {
		String userId = ((User) session.getAttribute("user")).getUserId();
		FreeCode freeCode = null;
		if(!(userId.equals(freeUserId))) {
			freeCode = freeService.viewMyFree(freeUserId, codeNum);
			model.addAttribute("likeCodeNum", freeCode.getCodeNum());
			freeCode.setCodeNum(-1);
		}else {
			freeCode = freeService.viewMyFree(userId, codeNum);
		}
		model.addAttribute("Sidebar", "pages/HF/SidebarForFree.jsp");
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("freeCode", freeCode);
		model.addAttribute("codeList", freeService.allMyFree(userId));
		return "FreeModeFrame";
	}
	
	@RequestMapping("save_image_free_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> saveImageFree(String codeScreenShot, HttpSession session, HttpServletRequest request){
		HashMap<String, Object> map = new HashMap<>();
		try{
			User user = (User) session.getAttribute("user");
			String userId = user.getUserId();
			int index = codeScreenShot.indexOf(',');
			String img = codeScreenShot.substring(index+1);
			byte[] decodeBytes = DatatypeConverter.parseBase64Binary(img);
			BufferedImage bfi = ImageIO.read(new ByteArrayInputStream(decodeBytes));
			File outputFile = new File(request.getServletContext().getRealPath("/freecode")+ "/" + userId+".png");
			ImageIO.write(bfi, "png", outputFile);
			bfi.flush();
			map.put("status", true);
		} catch (Exception e){
			map.put("status", false);
		}
		
		return map;
	}
	
	@RequestMapping("/search_code.scse")
	public String searchFreeCode(String codeName, String sName, HttpSession session, Model model) throws Exception {
		User user = (User) session.getAttribute("user");
		model.addAttribute("codeGalery", freeService.findFreeBySnameAndCodeName(sName, codeName));
		model.addAttribute("user", user);
		model.addAttribute("codeList", freeService.allMyFree(user.getUserId()));
		model.addAttribute("Sidebar", "pages/HF/SidebarForFree.jsp");
		model.addAttribute("MainFrame", "pages/FreeCodeList.jsp");
		return "FreeModeManagementFrame";
	}
	
}