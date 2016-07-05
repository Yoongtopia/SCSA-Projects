package com.scse.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scse.dao.GroupDAO;
import com.scse.entity.Group;
import com.scse.entity.Student;
import com.scse.entity.User;
import com.scse.entity.UserGroup;

@Repository("groupDao")
public class GroupDAOImpl implements GroupDAO{
	
	private SqlSessionTemplate sessionTemplate;

	@Autowired
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	@Override
	public boolean insertNewGroup(String groupName, char groupType, String userId) {
		HashMap<String , Object> map = new HashMap<>();
		
		map.put("groupName", groupName);
		map.put("groupType", groupType);
		map.put("userId", userId);
		
		System.out.println(map);
		
		return sessionTemplate.update("Group.insertNewGroup", map) > 0;
	}

	@Override
	public boolean insertStudentToGroup(UserGroup userGroup) {
		return sessionTemplate.update("Group.insertStudentToGroup", userGroup) > 0;
	}
	
	@Override
	public boolean deleteStudentFromGroup(String userId) {
		return sessionTemplate.update("Group.deleteStudentFromGroup", userId) > 0;
	}

	@Override
	public boolean deleteMyGroup(int groupNum, String userId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("groupNum", groupNum);
		map.put("userId", userId);
		return sessionTemplate.update("Group.deleteMyGroup", map) > 0;
	}

	@Override
	public boolean UpdateMyGroup(int groupNum, String groupName, char groupType, String userId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("groupNum", groupNum);
		map.put("groupName", groupName);
		map.put("groupType", groupType);
		map.put("userId", userId);
		return sessionTemplate.update("Group.UpdateMyGroup", map) > 0;
	}

	@Override
	public List<Group> listMyGroup(String userId) {
		return sessionTemplate.selectList("Group.listMyGroup", userId);
	}

	@Override
	public List<Student> listMyStudent(String userId) {

		return sessionTemplate.selectList("Group.listMyStudent", userId);
	}

	@Override
	public List<User> listMyStudentLogin(String userId) {
		return sessionTemplate.selectList("Group.listMyStudentLogin", userId);
	}
	@Override
	public String selectGroupName(String userId, int groupNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("groupNum", groupNum);
		return sessionTemplate.selectOne("Group.selectGroupName", map);
	}
	@Override
	public List<Group> allListMyGroup(String userId) {
		return sessionTemplate.selectList("Group.allListMyGroup", userId);
	}
	@Override
	public Group selectGroupByGroupName(String groupName) {

		return sessionTemplate.selectOne("Group.selectGroupByGroupName", groupName);
	}
	@Override
	public List<User> listInMyGroup(int groupNum) {
		return sessionTemplate.selectList("Group.listinGroup", groupNum);
	}


}
