package com.scse.service;

import java.util.HashMap;
import java.util.List;

import com.scse.entity.Leader;
import com.scse.entity.School;
import com.scse.entity.Student;
import com.scse.entity.User;


public interface UserService {
	
	boolean addStudent(Student student, int cha_num) throws Exception;
	
	boolean addParent(Leader leader) throws Exception;
	
	boolean addTeacher(Leader leader) throws Exception;
	
	HashMap<String, Object> logonUser(String userId, String password) throws Exception ;
	
	boolean modifyUserVerifying(String conf, String userId, String email);
	
	boolean logOutUser(String userId);
	
	boolean modifyUser(String password, String sname, int grade, String email, String phone, String schoolNum, String userId);

	boolean modifyVerify(String userId, String email);

	boolean removeUser(String userId);
	
	List<Student> viewStudentListBySchool(String schoolNum);
	
	List<School> viewSchoolListBySchoolName(String schoolName);
	
	String emailDomain(String email, String userId);
	
	List<Student> findStudentList(String sName, String schoolName);

	User findIdByUserId(String userId);
	
	boolean updateIp(String userId, String ip);
}
