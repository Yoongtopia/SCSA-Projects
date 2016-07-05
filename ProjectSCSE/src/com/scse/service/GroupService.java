package com.scse.service;

import java.util.List;

import com.scse.entity.Group;
import com.scse.entity.Student;
import com.scse.entity.User;
import com.scse.entity.UserGroup;

public interface GroupService {
	
	Group findGroupByGroupName(String groupName);

	boolean addNewGroup(String groupName, char groupType, String userId);

	boolean addStudentToGroup(UserGroup userGroup);
	
	boolean removeStudentFromGroup(String userId);
	
	boolean removeMyGroup(int groupNum, String userId);
	
	boolean modifyMyGroup(int groupNum, String groupName, char groupType, String userId);

	List<Group> allMyGroup(String userId);

	List<Student> allMyStudent(String userId);
	
	List<User> allMyStudentLogin(String userId);
	
	List<Group> allMyListGroup(String userId);
	
	List<User> allListInMyGroup(int groupNum);	
}
