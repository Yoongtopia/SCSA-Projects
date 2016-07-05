package com.scsa.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.dao.ProductDAO;
import com.scsa.service.ProductService;
import com.scsa.service.PushService;
import com.scsa.service.UserService;
import com.scsa.vo.Product;
import com.scsa.vo.Push;
import com.scsa.vo.User;
@Controller
public class MobileController {
	private ProductService productService;
	private PushService pushService;
	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Autowired
	public void setPushService(PushService pushService) {
		this.pushService = pushService;
	}

	@RequestMapping("m_product_list.do")
	public String mProductList(Model model){
		model.addAttribute("mProductList", productService.mProductList());
		return "m_product_list";
	}
	
	@RequestMapping("m_product_detail.do")
	public String productDetail(int product_num, Model model) {
		model.addAttribute("product", productService.productDetailByNum(product_num));
		return "m_product_detail";
	}
	
	@RequestMapping("m_push_list.do")
	public String pushListById(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();

		List<Push> pushListById = pushService.pushListById(user_id);

		model.addAttribute("pushListById", pushListById);
	
		return "m_push_list";
	}
	
	@RequestMapping(value="m_product_list_by_tag.do", method=RequestMethod.POST)
	public String productListByTag(String tag, Model model){
		model.addAttribute("mProductList",productService.productListByTag(tag));
		return "m_product_list";
	}
	
	@RequestMapping("m_push_remove_by_num.do")
	public String pushRemoveByNum(int[] push_num, HttpSession session,
			Model model) {

		if (push_num.length > 0) {

			for (int push_num2 : push_num) {
				pushService.pushRemoveByNum(push_num2);
			}
		}
		return "redirect:m_push_list.do";
	}
	
	@RequestMapping(value = "get_reg_id.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getRegId(HttpServletRequest request, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String reg_id = request.getParameter("reg_id");
		User user = userService.findUserByRegId(reg_id);
		if (user != null) {
			session.setAttribute("user", user);
			map.put("flag", true);
		} else {
			session.setAttribute("reg_id", reg_id);
			map.put("flag", false);
		}
		return map;
	}

	@RequestMapping(value = "m_login.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> login(String user_id, String user_password, Model model,
			HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		User user = userService.login(user_id, user_password);
		if (user != null && user.getUser_status() == 1) {
			//미인증회원일 경우
			map.put("status", 1);
		} else if (user != null && (user.getUser_status() == 2 || user.getUser_status() == 3)) {
			//인증회원이거나 관리자인 경우
			userService.regIdcreate((String)session.getAttribute("reg_id"), user_id);
			session.setAttribute("user", user);
			map.put("status", 2);
		} else{
			//회원이 아니거나 아이디, 비번이 틀린경우
			map.put("status", 3);
		}
		return map;
	}
	
/*	@RequestMapping(value = "/login_app.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> loginApp(HttpServletRequest request,
			Model model, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String user_id = request.getParameter("user_id");
		String user_password = request.getParameter("user_password");
		String reg_id = request.getParameter("regId");

		User user = userService.login(user_id, user_password);
		if (user != null && user.getUser_status() == 2) {
			userService.regIdcreate(reg_id, user_id);
			session.setAttribute("user", user);
			map.put("flag", true);
		} else {
			model.addAttribute("page", "./errors/loginError.jsp");
			map.put("flag", false);
		}
		return map;
	}
	*/
	
	@RequestMapping("/m_logout.do")
	public String logout(String user_id, HttpSession session, Model model) {
		session.invalidate();
		return "m_login";
	}
	
	@RequestMapping("m_push_list_by_id.do")
	public String mPushListById(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();


		List<Push> pushListById = pushService.pushListById(user_id);
		model.addAttribute("pushListById", pushListById);
		//model.addAttribute("page", "my_info/pushlist.jsp");
		return "my_info/pushlist";
	}
	
	@RequestMapping(value = "m_login_check.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> mLoginCheck(HttpServletRequest request, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		String reg_id = request.getParameter("reg_id");
		User user = userService.findUserByRegId(reg_id);
		session.setAttribute("user", user);
		map.put("flag", true);
		return map;
	}

}
