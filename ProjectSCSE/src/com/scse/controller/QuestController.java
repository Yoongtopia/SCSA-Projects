package com.scse.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scse.entity.User;
import com.scse.entity.UserCharacter;
import com.scse.service.CharacterService;

@Controller("QuestContrller")
public class QuestController {

	private CharacterService characterService;

	@Autowired
	public void setCharacterService(CharacterService characterService) {
		this.characterService = characterService;
	}

	// 캐릭터리스트 뿌리기
	@RequestMapping("character_list.scse")
	public String characterList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		try {
			model.addAttribute("list", characterService.allCharacter());
			model.addAttribute("mylist",
					characterService.viewMyCharacterList(user.getUserId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("Sidebar", "pages/HF/SideBarForStudent.jsp");
		model.addAttribute("MainFrame", "pages/CharacterList.jsp");
		return "MainScreenForUpdate";
	}

	// 캐릭터 바꾸기
	@RequestMapping("character_change.scse")
	public String characterString(String chaSelect, HttpSession session){
		User user = (User) session.getAttribute("user");
		int chaNum = Integer.parseInt(chaSelect);
		try {
			characterService.settingCharacter(user.getUserId(), chaNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.removeAttribute("characterInfo");		
		try {
			session.setAttribute("characterInfo", characterService.viewOneUserCharacter(user.getUserId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/character_list.scse";
	}
	
	@RequestMapping("/success_quest.scse")
	@ResponseBody
	public String successQuest(int chaNum, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		ArrayList<UserCharacter> newChaList = new ArrayList<UserCharacter>();
		newChaList.add(new UserCharacter(userId, chaNum));
		characterService.addUserCharacter(newChaList);
		ArrayList<UserCharacter> chaList = (ArrayList<UserCharacter>) characterService.viewMyQuestCharacterList(userId);
		if(user.getuType()=='s') {
			HashMap<String, String> chaMap = new HashMap<String, String>();
			for(UserCharacter cha:chaList) {
				chaMap.put(cha.getCharacter().getChaName(), cha.getCharacter().getChaName());
			}
			session.setAttribute("chaMap", chaMap);
		}
		return "UpdateSuccess";
	}
	
	@RequestMapping("/success_chapter_quest.scse")
	@ResponseBody
	public String successChapterQuest(int chaNum1, int chaNum2, int chaNum3, int chaNum4, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		ArrayList<UserCharacter> newChaList = new ArrayList<UserCharacter>();
		newChaList.add(new UserCharacter(((User)session.getAttribute("user")).getUserId(), chaNum1));
		newChaList.add(new UserCharacter(((User)session.getAttribute("user")).getUserId(), chaNum2));
		newChaList.add(new UserCharacter(((User)session.getAttribute("user")).getUserId(), chaNum3));
		newChaList.add(new UserCharacter(((User)session.getAttribute("user")).getUserId(), chaNum4));
		characterService.addUserCharacter(newChaList);
		ArrayList<UserCharacter> chaList = (ArrayList<UserCharacter>) characterService.viewMyQuestCharacterList(userId);
		if(user.getuType()=='s') {
			HashMap<String, String> chaMap = new HashMap<String, String>();
			for(UserCharacter cha:chaList) {
				chaMap.put(cha.getCharacter().getChaName(), cha.getCharacter().getChaName());
			}
			session.setAttribute("chaMap", chaMap);
		}
		return "UpdateSuccess";
	}
	
}
