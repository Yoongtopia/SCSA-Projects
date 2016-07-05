
package com.scsa.controller;



import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.service.CmtService;
import com.scsa.vo.Cmt;
import com.scsa.vo.User;

@Controller
public class CmtController {

	private CmtService cmtService;

	@Autowired
	public void setCmtService(CmtService cmtService) {
		this.cmtService = cmtService;
	}

	@RequestMapping("/cmt_register.do")
	@ResponseBody
	public HashMap<String, Object> addCmt(String cmt_content,
			int product_num, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Cmt cmt = new Cmt();
		
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		
		cmt.setCmt_content(cmt_content);
		cmt.setProduct_num(product_num);
		cmt.setUser_id(user_id);
		

		cmtService.cmtCreate(cmt);
		ArrayList<Cmt> cmtList = (ArrayList<Cmt>) cmtService
				.cmtListByProductNum(product_num);
		if (cmtList.size() > 0) {
			map.put("status", true);
			map.put("cmtList", cmtList);
		} else {
			map.put("status", false);
		}
		return map;
	}

	@RequestMapping("/cmt_list.do")
	@ResponseBody
	public HashMap<String, Object> cmtList(String cmt_content,
			String product_num, HttpSession session, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int productNum = Integer.parseInt(product_num);
		ArrayList<Cmt> cmtList = (ArrayList<Cmt>) cmtService
				.cmtListByProductNum(productNum);
		if (cmtList.size() > 0) {
			map.put("status", true);
			map.put("cmtList", cmtList);
		} else {
			map.put("status", false);
		}
		return map;
	}

	@RequestMapping("/cmt_of_cmt_register.do")
	@ResponseBody
	public HashMap<String, Object> addCmtOfCmt(String cmt_content,
			String product_num, HttpSession session, String parent_num,
			Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		
		int productNum = Integer.parseInt(product_num);
		int parentNum = Integer.parseInt(parent_num);
		
		Cmt cmt = new Cmt();
		cmt.setCmt_content(cmt_content);
		cmt.setProduct_num(productNum);
		cmt.setUser_id(user_id);
		cmt.setParent_num(parentNum);
		cmtService.cmtCreate(cmt);

		ArrayList<Cmt> reCmtList = (ArrayList<Cmt>) cmtService.cmtChildListByParentNum(parentNum);
		for (Cmt cmt2 : reCmtList) {
		}
		
		if (reCmtList.size() > 0) {
			map.put("status", true);
			map.put("reCmtList", reCmtList);
		} else {
			map.put("status", false);
		}
		return map;
	}
	
	@RequestMapping("/cmt_delete.do")
	@ResponseBody
	public HashMap<String, Object> cmtDelete(int cmt_num, String product_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		cmtService.cmtRemove(cmt_num);
		int productNum = Integer.parseInt(product_num);
		ArrayList<Cmt> cmtList = (ArrayList<Cmt>) cmtService
				.cmtListByProductNum(productNum);
		
		if(cmtList.size() > 0){
			map.put("status", true);
			map.put("cmtList", cmtList);
		}else{
			map.put("status", false);
		}

		return map;
	}
	
	@RequestMapping("reReply_list.do")
	@ResponseBody
	public HashMap<String, Object> reReplyList(int cmt_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int parent_num = cmt_num;
		
		ArrayList<Cmt> reCmtList = (ArrayList<Cmt>) cmtService.cmtChildListByParentNum(parent_num);
		
		for (Cmt cmt : reCmtList) {
		}
		
		if(reCmtList.size() >0){
			map.put("status", true);
			map.put("reCmtList", reCmtList);
		}else{
			map.put("status", false);
		}
		return map;
	}
	
	
	@RequestMapping("/reCmt_delete.do")
	@ResponseBody
	public HashMap<String, Object> reCmtDelete(int cmt_num, String product_num, int parent_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		cmtService.cmtRemove(cmt_num);
		
		ArrayList<Cmt> reCmtList = (ArrayList<Cmt>) cmtService.cmtChildListByParentNum(parent_num);
		
	/*	for (Cmt cmt : reCmtList) {
		}*/
		
		if(reCmtList.size() >0){
			map.put("status", true);
			map.put("reCmtList", reCmtList);
		}else{
			map.put("status", false);
		}
		return map;
	}
}
