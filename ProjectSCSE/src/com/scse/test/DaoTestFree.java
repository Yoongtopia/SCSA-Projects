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
			/*System.out.println("��� �����ڵ� ����Ʈ"+fdao.listFree());
			
			System.out.println("��ȸ����� ����"+fdao.listFreeOrderByHit());
			
			System.out.println("��õ������ ����"+fdao.listFreeOrderByLike());
			System.out.println("cha�� �ۼ��� �ڵ��9999,9998");
			System.out.println(fdao.listMyFree("cha"));
			System.out.println("�׽�Ʈ�� ���Ե� �ڵ��̸����� �˻�"+fdao.searchFreeByCodeName("�׽�Ʈ"));
			System.out.println("���� ���Ե� �̸����� �˻�"+fdao.searchFreeBySname("��"));
			System.out.println("�Ѱ� ���;� ��"+fdao.selectMyFree("cha", 9999));
			
			System.out.println("�޽��� ã��"+mdao.selectMessage(999));*/
			/*System.out.println(mdao.insertMessage(new Message(0, "�޽�����","�����̴�","14/05/29","cha","������")));*/
			
			/*System.out.println("���� ���� �׷� �ڵ�� cha, cha2���;� ��");		
			System.out.println(fdao.listFreeMyGroup(9999));*/
		
			/*System.out.println(fdao.deleteMyFree(9997));
			System.out.println(fdao.insertMyFree(new FreeCode(9995,"�μ�Ʈ �׽�Ʈ","14/05/29",20,20,"xx.xml","cha","1.jpg")));
			*/
			
			/*System.out.println(fdao.updateFreeHit(9999));
			System.out.println(fdao.updateRecommend(9999));*/
			
			
			/*System.out.println(fdao.updateMyFree(new FreeCode(9998,"test2����","14/05/28",44,33,"22����","cha","1update.jpg")));*/
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}