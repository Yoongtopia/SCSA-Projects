package com.scse.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scse.dao.GroupDAO;
import com.scse.entity.Group;
import com.scse.entity.Student;
import com.scse.entity.User;
import com.scse.entity.UserGroup;
import com.scse.service.GroupService;

@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
@Service("groupService")
public class GroupServiceImpl implements GroupService {

	private GroupDAO groupDAO = null;

	@Autowired
	public void setGroupDAO(GroupDAO groupDAO) {
		this.groupDAO = groupDAO;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addNewGroup(String groupName, char groupType, String userId) {

		return groupDAO.insertNewGroup(groupName, groupType, userId);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean removeStudentFromGroup(String userId) {

		return groupDAO.deleteStudentFromGroup(userId);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addStudentToGroup(UserGroup userGroup) {

		return groupDAO.insertStudentToGroup(userGroup);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean removeMyGroup(int groupNum, String userId) {

		return groupDAO.deleteMyGroup(groupNum, userId);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean modifyMyGroup(int groupNum, String groupName,
			char groupType, String userId) {

		return groupDAO.UpdateMyGroup(groupNum, groupName, groupType, userId);
	}

	@Override
	public List<Group> allMyGroup(String userId) {

		return groupDAO.listMyGroup(userId);
	}

	@Override
	public List<Student> allMyStudent(String userId) {

		return groupDAO.listMyStudent(userId);

	}

	@Override
	public List<User> allMyStudentLogin(String userId) {

		return groupDAO.listMyStudentLogin(userId);
	}

	@Override
	public List<Group> allMyListGroup(String userId) {
		return groupDAO.allListMyGroup(userId);
	}

	@Override
	public Group findGroupByGroupName(String groupName) {

		return groupDAO.selectGroupByGroupName(groupName);
	}

	@Override
	public List<User> allListInMyGroup(int groupNum) {
		return groupDAO.listInMyGroup(groupNum);
	}

}
