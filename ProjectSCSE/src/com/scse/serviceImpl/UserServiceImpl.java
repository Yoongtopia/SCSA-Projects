package com.scse.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scse.dao.CharacterDAO;
import com.scse.dao.UserDAO;
import com.scse.entity.Leader;
import com.scse.entity.School;
import com.scse.entity.Student;
import com.scse.entity.User;
import com.scse.entity.UserCharacter;
import com.scse.service.UserService;

@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
@Service("userService")
public class UserServiceImpl implements UserService {

	private UserDAO userDAO;
	private CharacterDAO characterDAO;

	@Autowired
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Autowired
	public void setCharacterDAO(CharacterDAO characterDAO) {
		this.characterDAO = characterDAO;
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addStudent(Student student, int cha_num) throws Exception {
		//선 회원가입
		userDAO.insertStudent(student);
		
		//회원가입시 캐릭터를 준다.
		//기본적으로 1234는 다 주는거다.
		String userId = student.getUserId();
		for(int i=1; i<=4; i++){
			UserCharacter userCharacter = new UserCharacter();
			userCharacter.setUserId(userId);
			userCharacter.setChaNum(i);
			characterDAO.insertUserCharacter(userCharacter);
		}
		
		//cha_num으로 넘어오는건 선택한 캐릭터이므로 체크해준다.
		return characterDAO.setCharacter(userId, cha_num);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addParent(Leader leader) throws Exception {
		UserCharacter userCharacter = new UserCharacter();
		userCharacter.setUserId(leader.getUserId());

		return userDAO.insertParent(leader);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addTeacher(Leader leader) throws Exception {
		UserCharacter userCharacter = new UserCharacter();
		userCharacter.setUserId(leader.getUserId());

		return userDAO.insertTeacher(leader);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public HashMap<String, Object> logonUser(String userId, String password) throws Exception  {
		HashMap<String, Object> map = new HashMap<>();
		
		int finalAccess = userDAO.selectFinalAccess(userId);

		
		if(finalAccess==1){
		userDAO.updateAttendanceAdd(userId);
		}else if(finalAccess>1){
		userDAO.updateAttendanceReset(userId);
		}
		
		map.put("attendanceCheck", userDAO.selectAttendanceCheck(userId));
		
		userDAO.updateFinalAccess(userId);
		userDAO.loginValidUser(userId, password);
		
		map.put("user", userDAO.loginUser(userId, password));
		map.put("myCharacters",characterDAO.selectMyCharactersWithChaName(userId));
		
		return map;
	}

	@Override
	public boolean logOutUser(String userId) {
		return userDAO.logoutUser(userId);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean modifyUser(String password, String sname, int grade,
			String email, String phone, String schoolNum, String userId) {

		return userDAO.updateUser(password, sname, grade, email, phone,
				schoolNum, userId);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean modifyVerify(String userId, String email) {

		return userDAO.updateVerify(userId, email);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean removeUser(String userId) {

		return userDAO.deleteUser(userId);
	}

	@Override
	public List<Student> viewStudentListBySchool(String schoolNum) {

		return userDAO.selectStudentListBySchool(schoolNum);
	}

	@Override
	public List<School> viewSchoolListBySchoolName(String schoolName) {
		return userDAO.selectSchoolListBySchoolName(schoolName);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean modifyUserVerifying(String conf, String userId, String email) {
		return userDAO.updateForVerifying(conf, userId, email);
	}

	@Override
	public String emailDomain(String email, String userId) {
		return userDAO.emailDomain(email, userId);
	}

	@Override
	public List<Student> findStudentList(String sName, String schoolName) {
		return userDAO.searchStudentList(sName, schoolName);
	}

	@Override
	public User findIdByUserId(String userId) {
		
		return userDAO.selectIdByUserId(userId);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateIp(String userId, String ip) {
		return userDAO.updateIp(userId, ip);
	}

}
