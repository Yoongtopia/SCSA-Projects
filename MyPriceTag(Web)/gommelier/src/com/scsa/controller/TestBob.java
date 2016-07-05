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
		List<List<Pair<String,String>>>reslut =  analyzer.analyze("�����ܼ�Ʈ");
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
		
		/*		//��ǰ ���
		Product product = new Product();
		product.setProduct_price(5000);
		product.setSquare_num(1);
		product.setProduct_content("���̤ù̾���Ƥä�");
		User user = new User();
		user.setUser_id("test");
		product.setUser(user);
		ArrayList<Img> imgList = new ArrayList<>();
		imgList.add(new Img(0, 0, "�����̹���", 2));	
		imgList.add(new Img(0, 0, "�̹���1", 1));	
		imgList.add(new Img(0, 0, "�̹���2", 1));			
		product.setImgList(imgList);
		ArrayList<Tag> tagList = new ArrayList<>();
		tagList.add(new Tag(0, "�±�1", 0));
		tagList.add(new Tag(0, "�±�2", 0));
		tagList.add(new Tag(0, "�±�3", 0));
		tagList.add(new Tag(0, "�±�4", 0));
		product.setTagList(tagList);
		
		System.out.println(productService.productCreate(product));*/
		
		// ����
		//System.out.println(productService.productRemoveByNum(134));
		
		// ���̵�� ����Ʈ �˻�
		//System.out.println(productService.productListById("test"));
		
		// ��ǰ��ȣ�� ������
		//System.out.println(productService.productDetailByNum(1));
		
		// �±� �Ѱ��� ��ǰ ����Ʈ �˻�
		//System.out.println(productService.productListByTag("������"));
		
		// ������ ��ǰ ����Ʈ ��������
		//System.out.println(productService.productListBySquare(1));
		
		// ��Ī
		//String[] tag = {"å��", "����"};
		//System.out.println(productService.findProductListForMatchResult(tag, 1, 10000));
		
		// �±׷� �ٸ� �±� ����Ʈ ã��
		//String[] tag = {"å��", "����"};
		//System.out.println(tagService.findTagListByTag(tag));
		
		//������ �±� ����Ʈ
		//System.out.println(tagService.findTagListBySquare(1));
		
		//���̵�� Ǫ�� ����Ʈ ã��
		//System.out.println(pushService.pushListById("dongwon"));
		
		//Ǫ�� ��ȣ�� Ǫ�� ã��
		//System.out.println(pushService.pushDetailByNum(1));
		
		//Ǫ�� ��ȣ�� Ǫ�� ����
		//String[] push_tag = {"å��", "����"};
		//System.out.println(pushService.pushModifyByNum(2, 20000, 2, push_tag));
		
		//Ǫ�� ���
/*		Push push = new Push();
		push.setPush_num(0);
		push.setUser_id("tom");
		push.setPush_price(10000);
		//push.setPush_status(0);
		push.setPush_square(1);
		ArrayList<PushTag> pushTagList = new ArrayList<>();
		pushTagList.add(new PushTag(0,0,"��å"));
		pushTagList.add(new PushTag(0,0,"����"));
		pushTagList.add(new PushTag(0,0,"���찳"));
		push.setPushTagList(pushTagList);
				
		System.out.println(pushService.pushCreate(push));*/
		
		//Ǫ�� ��ȣ�� Ǫ�� ����
		//System.out.println(pushService.pushRemoveByNum(7));
		
		//Ǫ����ȣ�� Ǫ�� ���� ����
		//System.out.println(pushService.pushStatusModify(2, 1));
		
		//���̵�� ���� ����Ʈ ã��
		//System.out.println(wishService.wishListById("dongwon"));
		
		//���� ����
/*		Wish wish = new Wish();
		wish.setProduct_num(24);
		wish.setUser_id("dongwon");
		System.out.println(wishService.wishRemove(wish));*/
		
		//Ű ����
		System.out.println(keyService.keyCreate("tom", "294ASD3"));
		
		//����Ȯ��
		//System.out.println(keyService.certification("tom", "294ASD3"));
		
	}
}	
		

