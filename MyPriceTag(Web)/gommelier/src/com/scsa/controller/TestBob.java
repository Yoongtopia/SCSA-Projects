package com.scsa.controller;

import java.util.List;

import kr.co.shineware.nlp.komoran.core.MorphologyAnalyzer;
import kr.co.shineware.util.common.model.Pair;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scsa.service.KeyService;
import com.scsa.service.ProductService;
import com.scsa.service.PushService;
import com.scsa.service.TagService;
import com.scsa.service.UnivService;
import com.scsa.service.WishService;

public class TestBob {

	public static void main(String[] args) {
		
/*		MorphologyAnalyzer analyzer = new MorphologyAnalyzer("datas/");
		analyzer.setUserDic("datas/dic.txt");
		List<List<Pair<String,String>>>reslut =  analyzer.analyze("싸이콘서트");
		for (List<Pair<String, String>> wordResult : reslut) {
			for (Pair<String, String> pair : wordResult) {
				if (pair.getSecond().matches("NN[A-Z]*")) {
					System.out.println(pair);
				}
				//System.out.println(pair);
			}
			System.out.println();
		}*/
		

		
		
		
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		
		ProductService productService = context.getBean("Product", ProductService.class);
		//UnivService univService = context.getBean("Univ", UnivService.class);
		TagService tagService = context.getBean("Tag", TagService.class);
		PushService pushService = context.getBean("Push", PushService.class);
		WishService wishService = context.getBean("Wish", WishService.class);
		KeyService keyService = context.getBean("Key", KeyService.class);
		
		/*		//상품 등록
		Product product = new Product();
		product.setProduct_price(5000);
		product.setSquare_num(1);
		product.setProduct_content("ㄴ이ㅓ미어림ㄴ아ㅓㄹ");
		User user = new User();
		user.setUser_id("test");
		product.setUser(user);
		ArrayList<Img> imgList = new ArrayList<>();
		imgList.add(new Img(0, 0, "메인이미지", 2));	
		imgList.add(new Img(0, 0, "이미지1", 1));	
		imgList.add(new Img(0, 0, "이미지2", 1));			
		product.setImgList(imgList);
		ArrayList<Tag> tagList = new ArrayList<>();
		tagList.add(new Tag(0, "태그1", 0));
		tagList.add(new Tag(0, "태그2", 0));
		tagList.add(new Tag(0, "태그3", 0));
		tagList.add(new Tag(0, "태그4", 0));
		product.setTagList(tagList);
		
		System.out.println(productService.productCreate(product));*/
		
		// 삭제
		//System.out.println(productService.productRemoveByNum(134));
		
		// 아이디로 리스트 검색
		//System.out.println(productService.productListById("test"));
		
		// 상품번호로 디테일
		//System.out.println(productService.productDetailByNum(1));
		
		// 태그 한개로 상품 리스트 검색
		//System.out.println(productService.productListByTag("아이폰"));
		
		// 지역별 상품 리스트 가져오기
		//System.out.println(productService.productListBySquare(1));
		
		// 매칭
		//String[] tag = {"책상", "의자"};
		//System.out.println(productService.findProductListForMatchResult(tag, 1, 10000));
		
		// 태그로 다른 태그 리스트 찾기
		//String[] tag = {"책상", "의자"};
		//System.out.println(tagService.findTagListByTag(tag));
		
		//지역별 태그 리스트
		//System.out.println(tagService.findTagListBySquare(1));
		
		//아이디로 푸쉬 리스트 찾기
		//System.out.println(pushService.pushListById("dongwon"));
		
		//푸쉬 번호로 푸쉬 찾기
		//System.out.println(pushService.pushDetailByNum(1));
		
		//푸쉬 번호로 푸쉬 수정
		//String[] push_tag = {"책상", "의자"};
		//System.out.println(pushService.pushModifyByNum(2, 20000, 2, push_tag));
		
		//푸쉬 등록
/*		Push push = new Push();
		push.setPush_num(0);
		push.setUser_id("tom");
		push.setPush_price(10000);
		//push.setPush_status(0);
		push.setPush_square(1);
		ArrayList<PushTag> pushTagList = new ArrayList<>();
		pushTagList.add(new PushTag(0,0,"공책"));
		pushTagList.add(new PushTag(0,0,"연필"));
		pushTagList.add(new PushTag(0,0,"지우개"));
		push.setPushTagList(pushTagList);
				
		System.out.println(pushService.pushCreate(push));*/
		
		//푸쉬 번호로 푸쉬 삭제
		//System.out.println(pushService.pushRemoveByNum(7));
		
		//푸쉬번호로 푸쉬 상태 변경
		//System.out.println(pushService.pushStatusModify(2, 1));
		
		//아이디로 위시 리스트 찾기
		//System.out.println(wishService.wishListById("dongwon"));
		
		//위시 삭제
/*		Wish wish = new Wish();
		wish.setProduct_num(24);
		wish.setUser_id("dongwon");
		System.out.println(wishService.wishRemove(wish));*/
		
		//키 생성
		System.out.println(keyService.keyCreate("tom", "294ASD3"));
		
		//인증확인
		//System.out.println(keyService.certification("tom", "294ASD3"));
		
	}
}	
		

