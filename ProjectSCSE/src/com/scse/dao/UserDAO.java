package com.scse.dao;

import java.util.List;

import com.scse.entity.Leader;
import com.scse.entity.School;
import com.scse.entity.Student;
import com.scse.entity.User;

public interface UserDAO {

	boolean insertStudent(Student student);
	
	boolean insertParent(Leader leader);
	
	boolean insertTeacher(Leader leader);
	
	User loginUser(String userId, String password);
	/*
	User loginLeader(String userId, String password);*/
	
	boolean loginValidUser(String userId, String password);
	
	boolean logoutUser(String userId);
	
	boolean updateUser(String password, String sName, int grade, String email, String phone, String schoolNum, String userId);

	boolean updateVerify(String userId, String email);

	boolean deleteUser(String userId);
	
	List<Student> selectStudentListBySchool(String schoolNum);

	List<School> selectSchoolListBySchoolName(String schoolName);
	
	boolean updateForVerifying(String conf, String userId, String email);

	String emailDomain(String email, String userId);
	
	List<Student> searchStudentList (String sName, String schoolName);
	
	int selectFinalAccess(String userId);
	
	boolean updateAttendanceAdd(String userId);
	
	boolean updateAttendanceReset(String userId);
	
	int selectAttendanceCheck(String userId);
	
	boolean updateFinalAccess(String userId);

	User selectIdByUserId(String userId);
	
	boolean updateIp(String userId, String ip);
}
