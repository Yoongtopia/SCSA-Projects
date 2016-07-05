package com.scse.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scse.dao.UserDAO;
import com.scse.entity.Leader;
import com.scse.entity.School;
import com.scse.entity.Student;
import com.scse.entity.User;

@Repository("userDao")
public class UserDAOImpl implements UserDAO {

	private SqlSessionTemplate sessionTemplate;

	@Autowired
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	@Override
	public boolean insertStudent(Student student) {
		return sessionTemplate.update("User.insertStudent", student) > 0;
	}

	@Override
	public boolean insertParent(Leader leader) {
		return sessionTemplate.update("User.insertParent", leader) > 0;

	}

	@Override
	public boolean insertTeacher(Leader leader) {
		return sessionTemplate.update("User.insertTeacher", leader) > 0;
	}

	@Override
	public User loginUser(String userId, String password) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (userId != null && userId.trim().length() != 0) {
			map.put("userId", userId);
		}

		if (password != null && password.trim().length() != 0) {
			map.put("password", password);
		}

		return sessionTemplate.selectOne("User.loginUser", map);
	}

	/*
	 * @Override public User loginLeader(String userId, String password) {
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * 
	 * if (userId != null && userId.trim().length() != 0) { map.put("userId",
	 * userId); }
	 * 
	 * if (password != null && password.trim().length() != 0) {
	 * map.put("password", password); }
	 * 
	 * return sessionTemplate.selectOne("User.loginLeader", map); }
	 */

	@Override
	public boolean loginValidUser(String userId, String password) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (userId != null && userId.trim().length() != 0) {
			map.put("userId", userId);
		}

		if (password != null && password.trim().length() != 0) {
			map.put("password", password);
		}
		return sessionTemplate.update("User.loginValidUser", map) > 0;
	}

	@Override
	public boolean logoutUser(String userId) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("User.logoutUser", userId) > 0;
	}

	@Override
	public boolean updateUser(String password, String sName, int grade,
			String email, String phone, String schoolNum, String userId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("password", password);
		map.put("sName", sName);
		map.put("grade", grade);
		map.put("email", email);
		map.put("phone", phone);
		map.put("schoolNum", schoolNum);
		map.put("userId", userId);
		return sessionTemplate.update("User.updateUser", map) > 0;
	}

	@Override
	public boolean updateVerify(String userId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("email", email);
		return sessionTemplate.update("User.updateVerify", map) > 0;

	}

	@Override
	public boolean deleteUser(String userId) {
		return sessionTemplate.update("User.deleteUser", userId) > 0;
	}

	@Override
	public List<Student> selectStudentListBySchool(String schoolNum) {
		return sessionTemplate.selectList("User.selectStudentListBySchool",
				schoolNum);
	}

	@Override
	public List<School> selectSchoolListBySchoolName(String schoolName) {
		return sessionTemplate.selectList("School.selectSchool", schoolName);
	}

	@Override
	public boolean updateForVerifying(String conf, String userId, String email) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("conf", conf);
		map.put("userId", userId);
		map.put("email", email);
		return sessionTemplate.update("User.updateForVerifying", map) > 0;
	}

	@Override
	public String emailDomain(String email, String userId) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("email",email);
		map.put("userId",userId);
			return sessionTemplate.selectOne("User.emailDomain", map);
	}

	@Override
	public List<Student> searchStudentList(String sName, String schoolName) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("sName", sName);
		map.put("schoolName", schoolName);
		return sessionTemplate.selectList("User.searchStudentBySchoolOrStudent", map);
	}

	@Override
	public int selectFinalAccess(String userId) {
		
		return sessionTemplate.selectOne("User.selectFinalAccess", userId);
	}

	@Override
	public boolean updateAttendanceAdd(String userId) {
		return sessionTemplate.update("User.updateAttendanceAdd", userId) > 0;
	}

	@Override
	public boolean updateAttendanceReset(String userId) {
		return sessionTemplate.update("User.updateAttendanceReset", userId) > 0;
	}

	@Override
	public int selectAttendanceCheck(String userId) {
		
		return sessionTemplate.selectOne("User.selectAttendanceCheck", userId);
	}

	@Override
	public boolean updateFinalAccess(String userId) {
		
		return sessionTemplate.update("User.updateFinalAccess", userId) > 0;
	}

	@Override
	public User selectIdByUserId(String userId) {

		return sessionTemplate.selectOne("User.selectIdByUserId", userId);
	}

	@Override
	public boolean updateIp(String userId, String ip) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("ip", ip);
		return sessionTemplate.update("User.updateIp", map) > 0;
	}
	
	

}
