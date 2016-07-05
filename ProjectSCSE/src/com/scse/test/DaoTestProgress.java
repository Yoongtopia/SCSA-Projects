package com.scse.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scse.daoImpl.ProgressDAOImpl;
import com.scse.entity.Progress;

public class DaoTestProgress {

	public static void main(String[] args) {
		
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		ProgressDAOImpl pdao=(ProgressDAOImpl) context.getBean("progressDao");
		
		try {
/*			System.out.println("미션 리스트");
			System.out.println(pdao.listMission());
		
			System.out.println("1-2미션 상세보기");
			System.out.println(pdao.selectMission(1, 2));
		
			System.out.println("1-1번 문제반평균 시도횟수");
			System.out.println(pdao.selectClassTryNum(9999, 1, 1));
		
			System.out.println("1-1번 문제 학교평균 시도횟수");			
			System.out.println(pdao.selectSchoolTryNum("sc1001", 1, 1));
		
			System.out.println("1-1번 문제 차 시도횟수");
			System.out.println(pdao.selectTryNum("cha", 1, 1));
			
			System.out.println("보충학습 할 문항");
			System.out.println(pdao.selectNeedToStudy("cha"));
			
			System.out.println("성취도 표");
			System.out.println(pdao.selectPerformanceTable("cha"));
			
			System.out.println("cha의 1-1 진도");
			System.out.println(pdao.selectProgress("cha", 1, 1));
			
			System.out.println("cha 총 학습시간");
			System.out.println(pdao.selectTotalTime("cha")+"분");
*/	
			/*System.out.println(pdao.insertMissionProgress(new Progress("cha",1,9,20,"14/05/29",30)));*/
			/*System.out.println(pdao.updateMissionResult(new Progress("cha",1,9,20,"14/05/29",30)));*/
		
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}	
}