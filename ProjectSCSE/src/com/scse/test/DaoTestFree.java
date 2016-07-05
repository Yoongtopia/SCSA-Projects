package com.scse.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scse.daoImpl.FreeDAOImpl;
import com.scse.daoImpl.MessageDAOImpl;
import com.scse.entity.FreeCode;

public class DaoTestFree {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		MessageDAOImpl mdao=(MessageDAOImpl) context.getBean("messageDao");
		FreeDAOImpl fdao=(FreeDAOImpl) context.getBean("freeDao");
				
		try {
			/*System.out.println("모든 자유코드 리스트"+fdao.listFree());
			
			System.out.println("조회수대로 정렬"+fdao.listFreeOrderByHit());
			
			System.out.println("추천순으로 정렬"+fdao.listFreeOrderByLike());
			System.out.println("cha가 작성한 코드들9999,9998");
			System.out.println(fdao.listMyFree("cha"));
			System.out.println("테스트가 포함된 코드이름으로 검색"+fdao.searchFreeByCodeName("테스트"));
			System.out.println("차가 포함된 이름으로 검색"+fdao.searchFreeBySname("차"));
			System.out.println("한개 나와야 함"+fdao.selectMyFree("cha", 9999));
			
			System.out.println("메시지 찾기"+mdao.selectMessage(999));*/
			/*System.out.println(mdao.insertMessage(new Message(0, "메시지다","내용이다","14/05/29","cha","조석현")));*/
			
			/*System.out.println("내가 속한 그룹 코드들 cha, cha2나와야 함");		
			System.out.println(fdao.listFreeMyGroup(9999));*/
		
			/*System.out.println(fdao.deleteMyFree(9997));
			System.out.println(fdao.insertMyFree(new FreeCode(9995,"인서트 테스트","14/05/29",20,20,"xx.xml","cha","1.jpg")));
			*/
			
			/*System.out.println(fdao.updateFreeHit(9999));
			System.out.println(fdao.updateRecommend(9999));*/
			
			
			/*System.out.println(fdao.updateMyFree(new FreeCode(9998,"test2수정","14/05/28",44,33,"22수정","cha","1update.jpg")));*/
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}