package com.scse.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scse.daoImpl.CharacterDAOImpl;
import com.scse.daoImpl.NoticeDAOImpl;
import com.scse.entity.Notice;
import com.scse.entity.UserCharacter;

public class DaoTest {

	public static void main(String[] args) {
			
	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
	NoticeDAOImpl ndao=(NoticeDAOImpl)context.getBean("noticeDao");
	CharacterDAOImpl cdao=(CharacterDAOImpl) context.getBean("characterDao");	
	
	
	try {
		/*System.out.println(ndao.listNotice(9999));
		System.out.println("타찾기"+ndao.searchNoticeByNoticeContent("타"));
		System.out.println("아찾기"+ndao.searchNoticeByNoticeTitle("아"));
		System.out.println("가찾기"+ndao.searchNoticeByNoticeTitle("가"));
		System.out.println("23찾기"+ndao.searchNoticeByNoticeTitle("23"));
		System.out.println(ndao.selectNotice(9999));
		
		System.out.println(cdao.listCharacter());
		System.out.println(cdao.selectUserCharacter("cha",9999));
		*/		
		
		/*System.out.println(ndao.deleteNotice(9998));*/
		
		/*System.out.println(ndao.insertNotice(new Notice(0,"마바사","14/05/29","카타파하","cha",9999)));*/
		/*System.out.println(ndao.updateNotice(new Notice(9997,"가나다라수정","14/05/28","마바사수정","cha",9998)));*/
		/*System.out.println(cdao.insertUserCharacter(new UserCharacter("cha",9998,'n')));*/
					
	} catch (Exception e) {
		e.printStackTrace();	
		}	
	}
}