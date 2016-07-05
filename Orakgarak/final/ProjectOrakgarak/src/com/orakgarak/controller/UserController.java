package com.orakgarak.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.UserService;
import com.orakgarak.vo.User;
import com.orakgarak.vo.UserAdvanced;

@Controller
public class UserController {

	private Logger logger = Logger.getLogger(UserController.class);
	private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/user_login.do")
	@ResponseBody
	public HashMap<String, Object> login(String email, String password, Model model, HttpServletRequest request){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String name=userService.login(email, password);
			HttpSession session=request.getSession();
			if(name!=null){
				session.setAttribute("user",userService.findUserView(email));
				session.setAttribute("favorite", userService.getUserFav(email));
				session.setMaxInactiveInterval(60*60);
				map.put("status", true);
				map.put("favorite", userService.getUserFav(email));
			}else{
				model.addAttribute("message","로그인에 실패하였습니다.");
				map.put("status", false);
			}
			return map;
	}

	@RequestMapping("/user_logout.do")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "welcome";
	}

	@RequestMapping("/user_registForm.do")
	public String studentRegistForm(Model model) {
		model.addAttribute("contentPage", "joinus.jsp");
		return "index";
	}

	@RequestMapping("/user_regist.do")
	public String studentRegist(User user, Model model, HttpServletRequest request) {
		
		userService.create(user);
		
		model.addAttribute("contentPage", "pentagon/report.jsp");
		HttpSession session=request.getSession();
		session.setAttribute("user",userService.findUserView(user.getEmail()));
		return "redirect:/stock_detail.do";
	}

	@RequestMapping("/user_list.do")
	public String subjectView(Model model) {
		List<User> userList = userService.findUserList();
		model.addAttribute("userList", userList);
		model.addAttribute("contentPage", "userlist.jsp");
		return "index";
	}
	
	@RequestMapping("/user_management.do")
	public String list(Model model) {
		List<User> userList = userService.findUserList();
		model.addAttribute("userList", userList);
		model.addAttribute("contentPage", "memberManagement.jsp");
		return "index";
	}

	@RequestMapping("/check_id.do")
	@ResponseBody
	public HashMap<String, Object> checkId(String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		User user = userService.findUserView(email);
		if (user == null) {
			map.put("status", true);
			map.put("message", " ");
		} else {
			map.put("status", false);
			map.put("message", "이미 등록된 이메일입니다");
		}
		return map;
	}
	
	@RequestMapping("/check_name.do")
	@ResponseBody
	public HashMap<String, Object> checkName(String name) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		User user = userService.findUserByName(name);
		if (user == null) {
			map.put("status", true);
			map.put("namemessage", " ");
		} else {
			map.put("status", false);
			map.put("namemessage", "이미 등록된 닉네임입니다");
		}
		return map;
	}
	

	@RequestMapping("/user_search.do")
	public String studentSearch(String email, Model model,
			HttpServletRequest request) {
		User user = userService.findUserView(email);
		model.addAttribute("user", user);
		model.addAttribute("contentPage", "userlist.jsp");

		return "index";
	}

	@RequestMapping("/user_delete.do")
	public String deleteUser(String email, Model model, HttpSession session) {

		boolean flag = userService.remove(email);
		if (flag) {
			session.invalidate();
			model.addAttribute("message", "탈퇴가 성공적으로 처리되었습니다.");
		} else {
			model.addAttribute("message", "탈퇴 실패하였습니다. 다시 시도해 주세요.");
			model.addAttribute("contentPage", "my/mypage.jsp");
		}
		return "welcome";
	}
	
	@RequestMapping("/user_deleteByAdmin.do")
	public String deleteUserByAdmin(String email, Model model) {

		boolean flag = userService.remove(email);
		if (flag) {
			model.addAttribute("message", "탈퇴가 성공적으로 처리되었습니다.");
			model.addAttribute("contentPage", "my/mypage.jsp");
		} else {
			model.addAttribute("message", "탈퇴 실패하였습니다. 다시 시도해 주세요.");
			model.addAttribute("contentPage", "my/mypage.jsp");
		}
		return "index";
	}
	
	@RequestMapping("/user_update.do")
	public String updateUser(User user, Model model, HttpServletRequest request){
		userService.update(user);
		HttpSession session=request.getSession();
		session.setAttribute("user",userService.findUserView(user.getEmail()));
		return "redirect:/mypage.do";
	}
	
	@RequestMapping("/mypage.do")
	public String myPage(Model model,HttpSession session){
		
		String userId = ((User)session.getAttribute("user")).getEmail(); //email이 유저아이디니 이렇게 합니다.
		
		
		
		model.addAttribute("favorite", userService.getUserFav(userId));
		model.addAttribute("simulation", userService.updateAndSelectSimulationWithCurrentPrice(userId));
		
		model.addAttribute("contentPage", "my/mypage.jsp");
		
		return "index";
	}
	
	@RequestMapping("/favorite.do")
	public String favorite(Model model,HttpSession session){
		
		String userId = ((User)session.getAttribute("user")).getEmail(); //email이 유저아이디니 이렇게 합니다.
		model.addAttribute("favorite", userService.getUserFav(userId));
			
		model.addAttribute("contentPage", "my/favorite.jsp");
		
		return "index";
	}
	
	@RequestMapping("/tabFavoirte.do")
	@ResponseBody
	public HashMap<String, Object> tabFavorite(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String userId = ((User)session.getAttribute("user")).getEmail(); //email이 유저아이디니 이렇게 합니다.
		
		if (userId != null) {
			map.put("status", true);
			map.put("favorite", userService.getUserFav(userId));
			
		} else {
			map.put("status", false);
		}
		return map;
	}
	
	@RequestMapping("/simulation.do")
	public String simulationPage(Model model,HttpSession session){
		
		String userId = ((User)session.getAttribute("user")).getEmail(); //email이 유저아이디니 이렇게 합니다.
	
		model.addAttribute("simulation", userService.updateAndSelectSimulationWithCurrentPrice(userId));
		
		model.addAttribute("contentPage", "my/simulation.jsp");
		
		return "index";
	}
	
	@RequestMapping("/tabSimulation.do")
	@ResponseBody
	public HashMap<String, Object> simulation(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String userId = ((User)session.getAttribute("user")).getEmail(); //email이 유저아이디니 이렇게 합니다.
		if (userId != null) {
			map.put("status", true);
			map.put("simulation", userService.updateAndSelectSimulationWithCurrentPrice(userId));
			
		} else {
			map.put("status", false);
			
		}
		return map;
	
		
		
	}

	@RequestMapping("/valuation.do")
	public String moveValuation(Model model){
		model.addAttribute("contentPage", "pentagon/report.jsp");
		return "index";
	}
	
	@RequestMapping("/checkFavorite.do")
	@ResponseBody
	public Boolean checkFavorite(String userId, String code){
		
		
		boolean flag = userService.checkFav(userId, code);
		
		return flag;
		
	}//end function
	
	
	@RequestMapping("/addFavorite.do")
	@ResponseBody
	public Boolean addFavorite(String userId, String code){
		boolean flag = userService.addFav(userId, code);
	
		return flag;
		
	}//end function
	
	@RequestMapping("/deleteFav.do")
	public String deleteFav(String userId, String codeForFav){
		userService.delFav(userId, codeForFav);
		return "redirect:/favorite.do";
	}//end function
	
	@RequestMapping("/deleteFavReport.do")
	@ResponseBody
	public Boolean deleteFavReport(String userId, String codeForFav){
		boolean flag=userService.delFav(userId, codeForFav);
		return flag;
	}//end function
	
	
	@RequestMapping("/getRemainCash.do")
	@ResponseBody
	public HashMap<String,Object> getRemainCash(HttpSession session){
		String userId = ((User)session.getAttribute("user")).getEmail();
		HashMap<String, Object> map = new HashMap<>();
		
		if (userId==null){
			map.put("status", 0);
		}

		UserAdvanced userAdvanced = userService.getUserSim(userId);
	
		
		if(userAdvanced!=null){
			map.put("userAdvanced", userAdvanced);
			map.put("status", 1);
			return map;
		}
		return map;
	}//end getRemainCash()
	
	@RequestMapping("/buy.do")
	@ResponseBody
	public HashMap<String,Object> buy(HttpSession session, String userId, String volumeString, String code){
		
		HashMap<String, Object> map = new HashMap<>();
		int volume = 0;
		try{
		 volume = Integer.parseInt(volumeString);
		}catch(NumberFormatException e){
			map.put("status", 3);
			return map;
		}
		//주문수량이 1억이상이고 0보다 작으면 그리고 쓸데없는 글자라도 온다면
		if(!(volume>0 && volume<100000000)){
			map.put("status", 999);
			return map;
		}
		
		//밑은, 세션에 저장된 놈과 지금 넘어온 아이디를 비교해서 같다면 계속 합니다.
		String sessionUserId = ((User)session.getAttribute("user")).getEmail();
		//로그인된 아이디와 넘어온 값들에대한 검증
		if(!userId.equals(sessionUserId)){
			map.put("status",666); //아이디가 맞지않는경우, session이 다르고 get으로 직접접근을 했을경우임. 보안공격이 있었다는 증거
			return map;
		}
		
		boolean flag = userService.buy(userId, volume, code);
		
		if(flag==false){
			map.put("status", 2);
		}else{
			map.put("status", 1);
		}
		
		return map;
	}//end buy()
	
	@RequestMapping("/sell.do")
	public String sell(String code, int tradeSeq, HttpSession session){
		
		
		try{
		//session에 들어있는 값을 검사함!
		String userId = ((User)session.getAttribute("user")).getEmail();
		userService.sellStock(tradeSeq, userId, code);
		return "redirect:/simulation.do";
		
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:/simulation.do";
		}
				
		
	}//end sell();
	
	
	@RequestMapping("/prefer_test.do")
	public String preferTest(Model model){
		
		model.addAttribute("contentPage", "my/prefertest.jsp");
		return "index";
	}//end prefertest();
	

	
}//end public class
