package com.scsa.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.service.ProductService;
import com.scsa.service.TagService;
import com.scsa.service.UnivService;
import com.scsa.vo.Tag;
import com.scsa.vo.Univ;

@Controller
public class SquareController {

	private UnivService univService;
	private ProductService productService;
	private TagService tagService;
	
	ArrayList<String[]> list = new ArrayList<>();
	String[] square1 = {"노원구", "중랑구", "동대문구", "성동구", "광진구"};
	String[] square2 = {"종로구", "성북구", "강북구", "도봉구", "중구 "};
	String[] square3 = {"마포구", "서대문구", "은평구", "용산구"};
	String[] square4 = {"구로구", "강서구", "양천구", "영등포구", "동작구", "금천구"};
	String[] square5 = {"서초구", "강남구", "송파구", "강동구", "관악구"};
	
	@Autowired
	public void setUnivService(UnivService univService) {
		this.univService = univService;
	}

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Autowired
	public void setTagService(TagService tagService) {
		this.tagService = tagService;
	}
	
	
	@RequestMapping("/mouseover_on_map.do")
	public String squareInfoList(String square_num, Model model) {
		int squareNum = Integer.parseInt(square_num);
		model.addAttribute("square_num", square_num);
		model.addAttribute("productQuantity", productService.productListBySquare(squareNum).size());
		return "square_info";
	}
	
	
	@RequestMapping("/tag_list_by_square_num.do")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> tagListByNum(int square_num, Model model) throws UnsupportedEncodingException{
		ArrayList<Tag> tagList = (ArrayList<Tag>)tagService.findTagListBySquare(square_num);
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		for(Tag t : tagList){
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("text", t.getTag());
			map.put("weight", t.getCount());
			list.add(map);
		}
		return list;
	}
	
	@RequestMapping("square_by_gu_name.do")
	@ResponseBody
	public HashMap<String, Object> SquareByGuName(String name, Model model){
		HashMap<String, Object> result = new HashMap<>();
		int square_num = 0;
		//DB없이 그냥 만듦
		/* Square1 - 노원구, 중랑구, 동대문구, 성동구, 광진구 */
		/* Square2 - 종로구, 성북구, 강북구, 도봉구, 중구 */
		/* Square3 - 마포구, 서대문구, 은평구, 용산구 */
		/* Square4 - 구로구, 강서구, 양천구, 영등포구, 동작구, 금천구 */
		/* Square5 - 서초구, 강남구, 송파구, 강동구, 관악구 */
		HashMap<String, Integer> seoul = new HashMap<>();
		insertData();
	
		//검색위한 해시맵
		for (String string : square5) {
			seoul.put(string, 5);
		}
		for (String string : square4) {
			seoul.put(string, 4);
		}
		for (String string : square3) {
			seoul.put(string, 3);
		}
		for (String string : square2) {
			seoul.put(string, 2);
		}
		for (String string : square1) {
			seoul.put(string, 1);
		}
	
		//비교하고 리턴
		int chk = 1;
		for (String string : seoul.keySet()) {
			if(string.startsWith(name)){
				square_num = seoul.get(string);
			}
		}
		
		//결과 리턴
		if (square_num == 0) {
			result.put("square_num", "0");
			return result;
		}
		result.put("square_num", square_num);
		result.put("gu", list.get(square_num-1));
		
		return result;
	}
	@RequestMapping("gu_list_by_square.do")
	@ResponseBody
	public HashMap<String, Object> seoulData(int square_num){
		HashMap<String, Object> seoul = new HashMap<>();
		insertData();
		
		seoul.put("gu", list.get(square_num-1));
		return seoul;
	}
	
	public void insertData(){
		list.add(square1);
		list.add(square2);
		list.add(square3);
		list.add(square4);
		list.add(square5);
	}

}
