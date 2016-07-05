package com.scse.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Decoder;
import sun.net.ProgressSource;

import com.scse.entity.Mission;
import com.scse.entity.Mission5Progress;
import com.scse.entity.Progress;
import com.scse.entity.User;
import com.scse.service.FreeService;
import com.scse.service.ProgressService;

@Controller("MissionController")
public class MissionController {

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

	@RequestMapping("/find_mission.scse")
	public String findMission(int chapNum, int quizNum, Model model,
			HttpSession session) throws Exception {
		if (((User) session.getAttribute("user")).getuType() == 's') {
			model.addAttribute("chaMap", session.getAttribute("chaMap"));
			model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
		} else {
			model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		}
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("mission", progressService
				.viewMissionByChapNumAndQuizNum(chapNum, quizNum));
		return "MainFrame";
	}

	@RequestMapping("/find_missionIndex.scse")
	public String findMissionIndex(int missionIndex, Model model,
			HttpSession session) throws Exception {
		if (((User) session.getAttribute("user")).getuType() == 's') {
			model.addAttribute("chaMap", session.getAttribute("chaMap"));
			model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
		} else {
			model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		}
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("mission",
				progressService.viewMissionByMissionIndex(missionIndex));
		session.setAttribute("mission",
				progressService.viewMissionByMissionIndex(missionIndex));
		return "MainFrame";
	}

	@RequestMapping("/find_tutorialIndex.scse")
	public String findTutorailIndex(int missionIndex, Model model,
			HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		if (user.getuType() == 's') {
			model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
			model.addAttribute("chaMap", session.getAttribute("chaMap"));
		} else {
			model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		}
		model.addAttribute("user", user);
		model.addAttribute("mission",
				progressService.viewMissionByMissionIndex(missionIndex));
		session.setAttribute("mission", progressService.viewMissionByMissionIndex(missionIndex));
		return "TutorialFrame";
	}

	@RequestMapping("/find_max_mission_index.scse")
	@ResponseBody
	public HashMap<String, Object> viewMaxMissionIndexOfStudent(Model model,
			HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		Mission mission = progressService.viewMaxMissionIndexOfStudent(userId);
		if (mission != null) {
			map.put("status", true);
			if (mission.getMissionIndex() >= 50) {
				Mission5Progress mission5 = progressService.viewMission5(
						userId, mission.getMissionIndex());
				if(mission5!=null) {
					map.put("mission", mission5);
					session.setAttribute("mission", mission5);
					session.setAttribute("missionIndex", mission5.getMissionIndex());
				}
			} else {
				map.put("mission", mission);
				session.setAttribute("mission", mission);
				session.setAttribute("missionIndex", mission.getMissionIndex());
			}
		} else {
			map.put("status", false);
			session.setAttribute("mission",
					progressService.viewMissionByMissionIndex(1));
			session.setAttribute("missionIndex", progressService
					.viewMissionByMissionIndex(1).getMissionIndex());
		}
		return map;
	}

	@RequestMapping("/enter_main.scse")
	public String enterMain(Model model, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		/*
		 * Mission mission = (Mission) session.getAttribute("mission"); int
		 * missionIndex = 0; try { missionIndex = mission.getMissionIndex(); }
		 * catch (Exception e) {
		 * 
		 * }
		 */
		int missionIndex = (int) session.getAttribute("missionIndex");
		if(missionIndex == 57) {
			if (user.getuType() == 's') {
				model.addAttribute("chaMap", session.getAttribute("chaMap"));
			}
			model.addAttribute("Sidebar", "pages/HF/SidebarForFree.jsp");
			model.addAttribute("user", session.getAttribute("user"));
			model.addAttribute("codeList", freeService.allMyFree(user.getUserId()));
			return "FreeModeFrame";
		}else if (missionIndex > 0) {
			if (((User) session.getAttribute("user")).getuType() == 's') {
				model.addAttribute("chaMap", session.getAttribute("chaMap"));
				model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
			} else {
				model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
			}
			if (missionIndex >= 50) {
				model.addAttribute("mission", progressService.viewMission5(
						user.getUserId(), missionIndex));
				return "DodgeFrame";
			} else {
				model.addAttribute("mission",
						progressService.viewMissionByMissionIndex(missionIndex));
				if (missionIndex > 10) {
					return "MainFrame";
				} else {
					if (user.getuType() == 's') {
						model.addAttribute("Sidebar",
								"pages/HF/SideBarForStudent.jsp");
					} else {
						model.addAttribute("Sidebar",
								"pages/HF/SideBarForLeader.jsp");
					}
					return "TutorialFrame";
				}
			}
		} else {

			if (user.getuType() == 's') {
				model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
				model.addAttribute("chaMap", session.getAttribute("chaMap"));
			} else {
				model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
			}
			model.addAttribute("mission",
					progressService.viewMissionByMissionIndex(1));
			return "TutorialFrame";
		}
	}

	@RequestMapping(value = "/go_performance.scse", produces = "text/plain; charset=UTF-8")
	public String goPerformance(String sName, String userId, String schoolNum,
			Model model, HttpSession session, String gN) throws Exception {
		int groupNum = Integer.parseInt(gN);
		int modelSize = 1;

		Mission mission = progressService.viewMaxMissionIndexOfStudent(userId);
		int i = mission.getChapNum();
		
		if (i == 1) {

			for (int j = 1; j <= mission.getQuizNum(); j++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 1, j, groupNum, schoolNum));
				modelSize++;
			}

			model.addAttribute("addStudyOne",
					progressService.viewNeedToStudy(userId, 1));
			model.addAttribute("tableOne",
					progressService.viewPerformanceTable(userId, 1));
		}

		else if (i == 2) {

			for (int a = 1; a <= 12; a++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 1, a, groupNum, schoolNum));
				modelSize++;
			}

			model.addAttribute("addStudyOne",
					progressService.viewNeedToStudy(userId, 1));
			model.addAttribute("tableOne",
					progressService.viewPerformanceTable(userId, 1));

			for (int jj = 1; jj <= mission.getQuizNum(); jj++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 2, jj, groupNum, schoolNum));
				modelSize++;
			}

			model.addAttribute("addStudyTwo",
					progressService.viewNeedToStudy(userId, 2));
			model.addAttribute("tableTwo",
					progressService.viewPerformanceTable(userId, 2));

		}

		else if (i == 3) {

			for (int aa = 1; aa <= 12; aa++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 1, aa, groupNum, schoolNum));
				modelSize++;
			}

			model.addAttribute("addStudyOne",
					progressService.viewNeedToStudy(userId, 1));
			model.addAttribute("tableOne",
					progressService.viewPerformanceTable(userId, 1));

			for (int jjj = 1; jjj <= 7; jjj++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 2, jjj, groupNum, schoolNum));
				modelSize++;
			}
			model.addAttribute("tableTwo",
					progressService.viewPerformanceTable(userId, 2));
			model.addAttribute("addStudyTwo",
					progressService.viewNeedToStudy(userId, 2));

			for (int kkk = 1; kkk <= mission.getQuizNum(); kkk++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 3, kkk, groupNum, schoolNum));
				modelSize++;
			}
			model.addAttribute("tableThree",
					progressService.viewPerformanceTable(userId, 3));
			model.addAttribute("addStudyThree",
					progressService.viewNeedToStudy(userId, 3));

		}

		else if (i >= 4) {

			for (int z = 1; z <= 12; z++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 1, z, groupNum, schoolNum));
				modelSize++;
			}
			model.addAttribute("addStudyOne",
					progressService.viewNeedToStudy(userId, 1));
			model.addAttribute("tableOne",
					progressService.viewPerformanceTable(userId, 1));

			for (int x = 1; x <= 7; x++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 2, x, groupNum, schoolNum));
				modelSize++;
			}
			model.addAttribute("tableTwo",
					progressService.viewPerformanceTable(userId, 2));
			model.addAttribute("addStudyTwo",
					progressService.viewNeedToStudy(userId, 2));

			for (int kkk = 1; kkk <= 10; kkk++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 3, kkk, groupNum, schoolNum));
				modelSize++;
			}
			model.addAttribute("tableThree",
					progressService.viewPerformanceTable(userId, 3));
			model.addAttribute("addStudyThree",
					progressService.viewNeedToStudy(userId, 3));

			for (int lll = 1; lll <= mission.getQuizNum(); lll++) {
				model.addAttribute(String.valueOf(modelSize), progressService
						.allTry(userId, 4, lll, groupNum, schoolNum));
				modelSize++;
			}
			model.addAttribute("tableFour",
					progressService.viewPerformanceTable(userId, 4));
			model.addAttribute("addStudyFour",
					progressService.viewNeedToStudy(userId, 4));

			model.addAttribute("time", progressService.viewTotalTime(userId));
			// 튜토리얼만 한애
		} /*else {
			return "redirect:/pages/Error.html";
		}*/

	/*	if (modelSize != mission.getMissionIndex() - 9) {
			throw new Exception();
		}*/
		int count = modelSize - 1;
		model.addAttribute("size", modelSize - 1);
		model.addAttribute("name", sName);
		model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		model.addAttribute("MainFrame", "pages/ProgressView.jsp");

		return "MainScreenForUpdate";
	}

	@RequestMapping("performance_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> viewPerformance(String userId, int chapNum,
			int quizNum, int groupNum, String schoolNum, Model model)
			throws Exception {
		HashMap<String, Object> map = new HashMap<>();

		map.put("totalTime", progressService.viewTotalTime(userId));
		map.put("performanceTable",
				progressService.viewPerformanceTable(userId, chapNum));
		map.put("tryNum", progressService.viewTryNum(userId, chapNum, quizNum));
		map.put("schoolTryNum",
				progressService.viewSchoolTryNum(schoolNum, chapNum, quizNum));
		map.put("classTryNum",
				progressService.viewClassTryNum(groupNum, chapNum, quizNum));
		map.put("needToStudy", progressService.viewNeedToStudy(userId, chapNum));

		return map;
	}

	@RequestMapping("/retry_mission.scse")
	public String retryMission(int missionIndex, Model model,
			HttpSession session) throws Exception {
		if (((User) session.getAttribute("user")).getuType() == 's') {
			model.addAttribute("chaMap", session.getAttribute("chaMap"));
			model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
		} else {
			model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		}
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("mission",
				progressService.viewMissionByMissionIndex(missionIndex));
		model.addAttribute("retryFlag", true);
		return "MainFrame";
	}

	@RequestMapping("/run_mission.scse")
	@ResponseBody
	public String runMission(int chapNum, int quizNum, int time,
			HttpSession session, Model model) throws Exception {

		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		progressService.modifyTryNumAndTime(new Progress(userId, chapNum,
				quizNum, time, "", 1, 0));
		return "updateSuccess";

	}

	@RequestMapping("/next_mission.scse")
	@ResponseBody
	public HashMap<String, Integer> nextMission(int missionIndex,
			HttpSession session, Model model) throws Exception {

		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		missionIndex += 1;

		Mission newMission = progressService
				.viewMissionByMissionIndex(missionIndex);

		int chapNum = newMission.getChapNum();
		int quizNum = newMission.getQuizNum();

		progressService.addProgress(new Progress(userId, chapNum, quizNum, 0,
				"", 0, 0));
		session.setAttribute("mission", newMission);

		return progressService.viewSuccessQuestCheck(userId);

	}

	@RequestMapping("/fail_mission.scse")
	@ResponseBody
	public HashMap<String, Integer> failMission(int chapNum, int quizNum,
			int missionIndex, HttpSession session, Model model)
			throws Exception {

		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();

		progressService.modifyTryNumAndTime(new Progress(userId, chapNum,
				quizNum, 0, "", 0, 1));

		return progressService.viewFailQuestCheck(userId, missionIndex);
	}

	@RequestMapping("/conan_quest.scse")
	@ResponseBody
	public HashMap<String, Integer> conanQuest(int missionIndex,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("conanCount",
				progressService.vewSuccessConanQuestCheck(userId, missionIndex));
		return map;
	}

	@RequestMapping("/retry_tutorial.scse")
	public String retryTutorial(int missionIndex, Model model,
			HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		if (user.getuType() == 's') {
			model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
			model.addAttribute("chaMap", session.getAttribute("chaMap"));
		} else {
			model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		}
		model.addAttribute("mission",
				progressService.viewMissionByMissionIndex(missionIndex));
		model.addAttribute("retryFlag", true);
		return "TutorialFrame";
	}

	@RequestMapping("/view_mission5.scse")
	public String findMission5(Mission5Progress mission, String from, Model model,
			HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		if (mission.getMissionIndex() > 50) {
			mission.setUserId(user.getUserId());
			if(progressService.viewMission5(user.getUserId(), mission.getMissionIndex()) == null) {
				Mission5Progress mission5 = (Mission5Progress) session
						.getAttribute("mission");
				progressService.addProgress(new Progress(user.getUserId(), mission5
						.getChapNum(), mission5.getQuizNum() + 1, 0, "", 0, 0));
				progressService.addMission5Progress(mission);
			}else if(from==null){
				progressService.editMission5Progress(mission);
			}
		}
		if (user.getuType() == 's') {
			model.addAttribute("chaMap", session.getAttribute("chaMap"));
			model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
		} else {
			model.addAttribute("Sidebar", "pages/HF/SideBarForLeader.jsp");
		}
		mission = progressService.viewMission5(user.getUserId(),
				mission.getMissionIndex());
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("mission", mission);
		session.removeAttribute("mission");
		session.setAttribute("mission", mission);
		return "DodgeFrame";
	}

	@RequestMapping("user_screen_upload_ajax.scse")
	@ResponseBody
	public HashMap<String, Object> screenUpload(String image, HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		/*BASE64Decoder decoder = new BASE64Decoder();
		byte[] decodeBytes =  decoder.decodeBuffer(arg0)*/
		try {
			//이미지 자르기
			int index = image.indexOf(',');
			String img = image.substring(index+1);
			//이미지 디코드바이트로 변환
			byte[] decodedBytes = DatatypeConverter.parseBase64Binary(img);
			BufferedImage bfi = ImageIO.read(new ByteArrayInputStream(decodedBytes));			
			File outputFile = new File(request.getServletContext().getRealPath("/watch")+ "/" + userId+".png");
			ImageIO.write(bfi, "png", outputFile);
			bfi.flush();
			map.put("status", true);
		} catch (Exception e) {
			map.put("status", false);
			e.printStackTrace();
		}
		return map;
	}
}
