package com.scsa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.shineware.nlp.komoran.core.MorphologyAnalyzer;
import kr.co.shineware.util.common.model.Pair;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scsa.vo.Tag;

@Controller
public class TestBob2 {
	public static void main(String[] args) {
		/*String[] tag = {"자전거","책상","의자"};

		String[] tag1 = {tag[0], tag[2]};

		HashMap<String, Object> map = new HashMap<>();
		map.put("hello", "hello");
		map.put("tag", tag[0]);
		System.out.println(map.get("hello").toString()+map.get("tag").toString());
		
		map.put("tag", tag[1]);
		System.out.println(map.get("hello").toString()+map.get("tag").toString());*/

	}
}
/*		String tag= "null['자전거','책상','의자']";
		String tag1= tag.substring(4);
		String tag2= tag1.trim().replaceAll("\'", "").replace(",", ", ");
		System.out.println(tag2);*/
		
		
		/*int l = tag1.toString().length();
		String tag2= tag1.substring(5, l-1);
		System.out.println(tag2);
		String[] split_tag = tag2.split("\\,");
		for (int i = 0; i < split_tag.length; i++) {
			System.out.println(split_tag[i]);*/
	
/*	@RequestMapping(value="analysis_test.do", method=RequestMethod.POST)
	public String analysis (String product_content, Model model, HttpServletRequest request){
		ArrayList<Tag> tagList = new ArrayList<Tag>();
			
		String path = request.getServletContext().getRealPath("/datas");
		MorphologyAnalyzer analyzer = new MorphologyAnalyzer(path);
		
		//analyzer.setUserDic(path+"/dic.txt");
		List<List<Pair<String,String>>> result =  analyzer.analyze(product_content);
		
		for (List<Pair<String, String>> wordResult : result) {
			for (Pair<String, String> pair : wordResult) {
				if (pair.getSecond().matches("NN[A-Z]*")) {
					tagList.add(new Tag(0, 0, pair.getFirst().toString(), 0));
				}
			}
		}
		
		final int SIZE = tagList.size();
		String[] tags = new String[SIZE];
		for (int i = 0; i < SIZE; i++) {
			 tags[i] = tagList.get(i).getTag();
		}
		
		model.addAttribute("tags", tags);
		return "test_bob";
	}*/

	

