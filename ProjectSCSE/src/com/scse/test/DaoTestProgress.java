package com.scse.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scse.daoImpl.ProgressDAOImpl;
import com.scse.entity.Progress;

public class DaoTestProgress {

	public static void main(String[] args) {
		
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		ProgressDAOImpl pdao=(ProgressDAOImpl) context.getBean("progressDao");
		
		try {
/*			System.out.println("�̼� ����Ʈ");
			System.out.println(pdao.listMission());
		
			System.out.println("1-2�̼� �󼼺���");
			System.out.println(pdao.selectMission(1, 2));
		
			System.out.println("1-1�� ��������� �õ�Ƚ��");
			System.out.println(pdao.selectClassTryNum(9999, 1, 1));
		
			System.out.println("1-1�� ���� �б���� �õ�Ƚ��");			
			System.out.println(pdao.selectSchoolTryNum("sc1001", 1, 1));
		
			System.out.println("1-1�� ���� �� �õ�Ƚ��");
			System.out.println(pdao.selectTryNum("cha", 1, 1));
			
			System.out.println("�����н� �� ����");
			System.out.println(pdao.selectNeedToStudy("cha"));
			
			System.out.println("���뵵 ǥ");
			System.out.println(pdao.selectPerformanceTable("cha"));
			
			System.out.println("cha�� 1-1 ����");
			System.out.println(pdao.selectProgress("cha", 1, 1));
			
			System.out.println("cha �� �н��ð�");
			System.out.println(pdao.selectTotalTime("cha")+"��");
*/	
			/*System.out.println(pdao.insertMissionProgress(new Progress("cha",1,9,20,"14/05/29",30)));*/
			/*System.out.println(pdao.updateMissionResult(new Progress("cha",1,9,20,"14/05/29",30)));*/
		
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}	
}