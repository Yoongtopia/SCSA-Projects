package com.scse.dao;

import java.util.List;

import com.scse.entity.Group;
import com.scse.entity.Student;
import com.scse.entity.User;
import com.scse.entity.UserGroup;

public interface GroupDAO {

	boolean insertNewGroup(String groupName, char groupType, String userId);

	boolean insertStudentToGroup(UserGroup userGroup);
	
	boolean deleteStudentFromGroup(String userId);
	
	boolean deleteMyGroup(int groupNum, String userId);
	
	boolean UpdateMyGroup(int groupNum, String groupName, char groupType, String userId);

	List<Group> listMyGroup(String userId);
	
	List<Group> allListMyGroup(String userId);

	List<Student> listMyStudent(String userId);
	
	String selectGroupName(String userId, int groupNum);
	
	List<User> listMyStudentLogin(String userId);

	Group selectGroupByGroupName(String groupName);

	List<User> listInMyGroup(int groupNum);	


	
}
