package com.scse.test;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.scse.dao.FreeDAO;
import com.scse.dao.GroupDAO;
import com.scse.dao.ProgressDAO;
import com.scse.dao.UserDAO;
import com.scse.daoImpl.CharacterDAOImpl;
import com.scse.daoImpl.GroupDAOImpl;
import com.scse.daoImpl.NoticeDAOImpl;
import com.scse.daoImpl.UserDAOImpl;
import com.scse.entity.Group;
import com.scse.entity.Leader;
import com.scse.entity.Progress;
import com.scse.entity.School;
import com.scse.entity.Student;
import com.scse.entity.User;
import com.scse.entity.UserGroup;
import com.scse.service.UserService;
import com.scse.serviceImpl.UserServiceImpl;

public class DaoTestSH {

	public static void main(String[] args) {
	ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
	FreeDAO fdao=(FreeDAO)context.getBean("freeDao");
	UserDAO udao=(UserDAO) context.getBean("userDao");	
	GroupDAO gdao=(GroupDAO) context.getBean("groupDao");	
	ProgressDAO pdao=(ProgressDAO) context.getBean("progressDao");	
	UserService us = (UserService) context.getBean("userService");
	
	try {
		//로그인
//		System.out.println(udao.insertStudent(new Student("jo1", "jo1", "조석현",5,"sc2451")));
//		System.out.println(udao.insertParent(new Leader("cmc", "cmc", "정민철", "cmc@cmc.com", "010-5456-7894")));
//	    System.out.println(udao.insertTeacher(new Leader("kkh", "kkh", "김경호", "cmc@cmc.com", "010-5456-7894","sc1500")));
//	    System.out.println(udao.loginUser("cmc","cmc"));
//	    System.out.println(udao.loginValidUser("csh","csh"));
//	    System.out.println(udao.logoutUser("cmc"));
//	    System.out.println(udao.updateUser("jsh","조석현", 4, "sh1@sh.com", "010-0100-0100", "sc1012", "jo"));
//		
//		System.out.println(udao.updateVerify("jo", "sh1@sh.com"));
//		System.out.println(udao.deleteUser("jo"));
//		System.out.println(udao.selectStudentListBySchool("sc2451"));
//		System.out.println(gdao.insertNewGroup("용찬이네집", 'c', "cmc"));
//		System.out.println(gdao.insertStudentToGroup(new UserGroup("csh", 1, 's')));
//		System.out.println(gdao.deleteStudentFromGroup("csh"));
//		System.out.println(gdao.deleteMyGroup(9999, "cha"));
//		System.out.println(gdao.UpdateMyGroup(9999, "용찬이네진짜리얼집", 'h', "kim"));
//		System.out.println(gdao.listMyGroup("test"));
//		System.out.println(gdao.listMyStudent("kim", 9999));
//		System.out.println(gdao.listMyStudentLogin("kim", 9999));
//		System.out.println(pdao.selectMissionByUserId("csh"));
//		System.out.println(pdao.selectMaxMissionIndexOfStudent("csh"));
//		System.out.println(pdao.selectMissionByMissionIndex(24));
		System.out.println(us.logonUser("sds", "sds"));
/*		System.out.println(ndao.searchNoticeByNoticeContent("타"));*/
/*		System.out.println(udao.searchNoticeByNoticeTitle("아"));*/
/*		System.out.println(ndao.selectNotice(9999));*/
		
		
		
	} catch (Exception e) {
		e.printStackTrace();	
		}	
	}
}