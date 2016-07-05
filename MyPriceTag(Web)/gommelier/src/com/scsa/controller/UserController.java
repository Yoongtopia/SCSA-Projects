package com.scsa.controller;

import java.util.ArrayList;
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

import com.scsa.service.ProductService;
import com.scsa.service.UnivService;
import com.scsa.service.UserService;
import com.scsa.service.WishService;
import com.scsa.vo.Product;
import com.scsa.vo.Univ;
import com.scsa.vo.User;
import com.scsa.vo.Wish;

@Controller
public class UserController {

	// wish�좎럩伊숂뙴�묒삕�좏릪roduct �좎럩伊숋옙�우물占쏙퐢占썲뜝�뚮닲占쎌빢�숋옙�됯뎡�좎럩伊숂뙴�묒삕�좎룞�숅넫濡レ넍�좎럥踰딉옙類㏃삕�ル〕�쇿뜝�덉굣占쎈벨�숅넫濡レ쭢�좎럩�⑨옙�얠삕占쎈뜆援꿴턁占쎈꺼占쎌닂�숅넫濡ル샬�좎럥흮占쎈벨�숅넫濡レ쭢�좎룞�쇿뜝�뚯쪠占쎌룊�숋옙怨쀪뎡
	private UserService userService;
	private UnivService univService;
	private WishService wishService;
	private ProductService productService;

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Autowired
	public void setWishService(WishService wishService) {
		this.wishService = wishService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setUnivService(UnivService univService) {
		this.univService = univService;
	}
	
	@RequestMapping("/user_register.do")
	public String addUser(HttpSession session, String user_id, String user_password,
			String user_name, String user_phone, String user_email,
			String univ_code, Model model) {
		User user = new User();
		user.setUser_id(user_id);
		user.setUser_password(user_password);
		user.setUser_name(user_name);
		user.setUser_phone(user_phone);
		user.setUser_email(user_email);
		user.setUniv_code(univ_code);
		if(userService.userCreate(user)){
			session.setAttribute("user", userService.login(user_id, user_password));
		};
		
		return "index";
	}
	
	@RequestMapping(value = "/login.do")
	@ResponseBody
	public HashMap<String, Object> login(String user_id, String user_password, Model model,
			HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		User userinfo = userService.login(user_id, user_password);
		if (userinfo != null) {
			session.setAttribute("user", userinfo);
			map.put("status", true);
		} else {
			map.put("status", false);
		}
		return map;
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(String user_id, HttpSession session, Model model) {
		session.invalidate();
		return "redirect:/index.jsp";
	}

	@RequestMapping("/id_check.do")
	@ResponseBody
	public HashMap<String, Object> idCheck(String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		User user = userService.idCheck(user_id);
		if (user != null) {
			map.put("status", true);
			map.put("user", user);
		} else {
			map.put("status", false);
		}
		return map;
	}



	@RequestMapping("/move_user_update_form.do")
	public String moveUserModifyUser(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		User modifyUser = userService.idCheck(user.getUser_id());
		model.addAttribute("modify_user", modifyUser);
		model.addAttribute("univList", univService.findUnivList());
		model.addAttribute("univInfo",
				univService.findUnivByUnivCode(modifyUser.getUniv_code()));
		model.addAttribute("page", "/my_info/my_info.jsp");
		return "index";
	}

	@RequestMapping("/wish_list_by_id.do")
	public String wishListById(HttpSession session, Model model) {
		ArrayList<Product> list = new ArrayList<>();
		
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		
		List<Wish> wishList =  wishService.wishListById(user_id);
		if(wishList.size() > 0){
			list = (ArrayList<Product>) wishList.get(0).getProductList();
		}
		
		//�좎럩伊숂뙴�묒삕占쎌슜�삣뜝�뚮듌占쏙옙�좎럩伊숂뙴�묒삕占쎌슜�삣뜝�뚮듌占쎈벨�숋쭖�ㅼ맶�좎럩�울옙占썲뜝�뚯쪠占쎈엪�숋옙�됰탿�좎룞�쇿뜝�뚯쪠占쎈〕�숁뉩關援��좎럩伊숂뙴�묒삕占쎌슜�삣뜝�덉굡占쎈뿰�숋옙�곕콦 �좎럩伊숂뙴�묒삕占쎌슜�삣뜝�뚮듌占쎈벨�숋쭖�ㅼ맶�좎럩�울옙占썲뜝�뚯쪠占싼띿춻占쏙옙援꿨뜝�뚯쪠�룹쉻�쇿뜝�숈삕�ル∥堉꾢뜝�덈뼺占쏙옙�숋옙�⑹맶�좎럩�울옙占�.
		model.addAttribute("chk", "wish");
		model.addAttribute("list", list);
		model.addAttribute("page", "product_list.jsp");

		return "index";
	}

	@RequestMapping("product_detail.do")
	public String productDetail(int product_num, Model model) {
		Product product = productService.productDetailByNum(product_num);
		model.addAttribute("product", product);

		return "modal/product_detail";
	}

	// �좎럩伊숂뙴�묒삕占쎌슜�삣뜝�뚮듌占쏙옙�좎럩伊숂뙴��삕筌뤾퍗�겼뜝�뚮닲占쎌빢�숋옙�됯뎡
	@RequestMapping("user_detail.do")
	public String userDetail(String user_id, Model model) {
		//�좎럩伊숂뙴�묒삕占쎌슜�삣뜝�뚮듌占쎈벨�숅넫濡レ쭢�좎럩�⑨옙�얠삕占쎈뜆援�
		
		User user = userService.findUserByUserId(user_id);
		Univ userUniv = univService.findUnivByUnivCode(user.getUniv_code());
		
		String productCount = productService.findSellingRate(user_id);
		String forSale = productService.findSellingRate2(user_id);
		
		int allProduct = Integer.parseInt(productCount);
		int forSaleProduct = Integer.parseInt(forSale);
		int soldOut = allProduct - forSaleProduct;
		
		double allProduct2 = (double)allProduct;
		double soldOut2 = (double)soldOut;
		double ratio = (soldOut2/allProduct2)*100;
		double sellingRate = Double.parseDouble(String.format("%.2f", ratio));

		model.addAttribute("productCount", productCount);
		model.addAttribute("forSale", forSale);
		model.addAttribute("soldOut", soldOut);
		model.addAttribute("sellingRate", sellingRate);
		
		model.addAttribute("seller", user);
		model.addAttribute("univ", userUniv);	
		
		//�좎럩伊숂뙴�묒삕占쎌슜�삣뜝�뚮듌占쏙옙�좎럩伊숋옙�낆춻占쏙옙援��좎럩伊숂뙴�묒삕占쎈맧占썲뜝�뚯쪠�룹쉻�숋옙�⑹맶�좎럩�울옙占�		
		List<Product> productListById = productService.productListById(user_id);
		model.addAttribute("list", productListById);

		return "modal/user_detail";
	}

	@RequestMapping("/user_modify.do")
	public String userModify(String user_id, String user_password,
			String user_name, String user_phone, String user_email,
			String univ_code) {

		User user = new User();
		user.setUser_id(user_id);
		user.setUser_password(user_password);
		user.setUser_name(user_name);
		user.setUser_phone(user_phone);
		user.setUser_email(user_email);
		user.setUniv_code(univ_code);
		userService.userModify(user);
		
		return "redirect: move_user_update_form.do";
	}

	@RequestMapping("/user_delete.do")
	public String userDelete(String user_id, Model model) {
		userService.byebye(user_id);
		return "redirect:/login.do";
	}

	@RequestMapping("/my_product_list.do")
	public String myProductList(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		model.addAttribute("chk","mine");	
		model.addAttribute("list", productService.productListById(user_id));
		model.addAttribute("page", "product_list.jsp");

		return "index";
	}

	@RequestMapping("/delete_wishlist.do")
	@ResponseBody
	public HashMap<String, Object> deleteWishlist(HttpSession session,
			int product_num) {
		boolean flag = false;
		HashMap<String, Object> map = new HashMap<String, Object>();

		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		

		if (wishListCheck(user_id, product_num) == false) {

			if (wishService.wishRemove(user_id, product_num)) {
				map.put("status", true);
			} else {
				map.put("status", false);
			}

		} else {
			map.put("status", false);
		}

		return map;
	}

	@RequestMapping("/add_wishlist.do")
	@ResponseBody
	public HashMap<String, Object> addWishList(HttpSession session,
			int product_num) {
		boolean flag = false;
		HashMap<String, Object> map = new HashMap<String, Object>();

		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();

		if (wishListCheck(user_id, product_num)) {

			if (wishService.wishCreate(user_id, product_num)) {
				map.put("status", true);
			} else {
				map.put("status", false);
			}

		} else {
			map.put("status", false);
		}

		return map;
	}

	public boolean wishListCheck(String user_id, int product_num) {
		boolean flag = false;

		Wish wishCheck = wishService.wishCheck(user_id, product_num);

		if (wishCheck != null) {
			flag = false;
		} else {
			flag = true;
		}
		return flag;
	}

	@RequestMapping("/wish_check.do")
	@ResponseBody
	public HashMap<String, Object> wishCheck(HttpSession session,
			int product_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		Wish wishCheck = wishService.wishCheck(user_id, product_num);

		if (wishCheck != null) {
			map.put("status", true);
		} else {
			map.put("status", false);
		}

		return map;
	}

	@RequestMapping(value = "/login_app.do", method = RequestMethod.POST)
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

}// end
