package com.scse.entity;

import java.util.List;

public class User {

	private String userId;
	private String password;
	private String sName;
	private String rDate;
	private char checkConnect;
	private char uType;
	private String schoolNum;
	private String finalAccess;

	private List<Character> characterList;
	private List<FreeCode> codeList;

	private Group userGroup;
	private Student userStudent;
	private Leader userLeader;
	private School userSchool;

	// À¸¾Ó

	private String schoolName;
	private int chapNum;
	private int quizNum;

	private String ip;

	public User() {
		super();
	}

	public User(String userId, String password, String sName, String rDate,
			char checkConnect, char uType, String schoolNum,
			String finalAccess, List<Character> characterList,
			List<FreeCode> codeList, Group userGroup, Student userStudent,
			Leader userLeader, School userSchool, String schoolName,
			int chapNum, int quizNum, String ip) {
		super();
		this.userId = userId;
		this.password = password;
		this.sName = sName;
		this.rDate = rDate;
		this.checkConnect = checkConnect;
		this.uType = uType;
		this.schoolNum = schoolNum;
		this.finalAccess = finalAccess;
		this.characterList = characterList;
		this.codeList = codeList;
		this.userGroup = userGroup;
		this.userStudent = userStudent;
		this.userLeader = userLeader;
		this.userSchool = userSchool;
		this.schoolName = schoolName;
		this.chapNum = chapNum;
		this.quizNum = quizNum;
		this.ip = ip;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public char getCheckConnect() {
		return checkConnect;
	}

	public void setCheckConnect(char checkConnect) {
		this.checkConnect = checkConnect;
	}

	public char getuType() {
		return uType;
	}

	public void setuType(char uType) {
		this.uType = uType;
	}

	public String getSchoolNum() {
		return schoolNum;
	}

	public void setSchoolNum(String schoolNum) {
		this.schoolNum = schoolNum;
	}

	public String getFinalAccess() {
		return finalAccess;
	}

	public void setFinalAccess(String finalAccess) {
		this.finalAccess = finalAccess;
	}

	public List<Character> getCharacterList() {
		return characterList;
	}

	public void setCharacterList(List<Character> characterList) {
		this.characterList = characterList;
	}

	public List<FreeCode> getCodeList() {
		return codeList;
	}

	public void setCodeList(List<FreeCode> codeList) {
		this.codeList = codeList;
	}

	public Group getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(Group userGroup) {
		this.userGroup = userGroup;
	}

	public Student getUserStudent() {
		return userStudent;
	}

	public void setUserStudent(Student userStudent) {
		this.userStudent = userStudent;
	}

	public Leader getUserLeader() {
		return userLeader;
	}

	public void setUserLeader(Leader userLeader) {
		this.userLeader = userLeader;
	}

	public School getUserSchool() {
		return userSchool;
	}

	public void setUserSchool(School userSchool) {
		this.userSchool = userSchool;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public int getChapNum() {
		return chapNum;
	}

	public void setChapNum(int chapNum) {
		this.chapNum = chapNum;
	}

	public int getQuizNum() {
		return quizNum;
	}

	public void setQuizNum(int quizNum) {
		this.quizNum = quizNum;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [userId=");
		builder.append(userId);
		builder.append(", password=");
		builder.append(password);
		builder.append(", sName=");
		builder.append(sName);
		builder.append(", rDate=");
		builder.append(rDate);
		builder.append(", checkConnect=");
		builder.append(checkConnect);
		builder.append(", uType=");
		builder.append(uType);
		builder.append(", schoolNum=");
		builder.append(schoolNum);
		builder.append(", finalAccess=");
		builder.append(finalAccess);
		builder.append(", characterList=");
		builder.append(characterList);
		builder.append(", codeList=");
		builder.append(codeList);
		builder.append(", userGroup=");
		builder.append(userGroup);
		builder.append(", userStudent=");
		builder.append(userStudent);
		builder.append(", userLeader=");
		builder.append(userLeader);
		builder.append(", userSchool=");
		builder.append(userSchool);
		builder.append(", schoolName=");
		builder.append(schoolName);
		builder.append(", chapNum=");
		builder.append(chapNum);
		builder.append(", quizNum=");
		builder.append(quizNum);
		builder.append(", ip=");
		builder.append(ip);
		builder.append(", getUserId()=");
		builder.append(getUserId());
		builder.append(", getPassword()=");
		builder.append(getPassword());
		builder.append(", getsName()=");
		builder.append(getsName());
		builder.append(", getrDate()=");
		builder.append(getrDate());
		builder.append(", getCheckConnect()=");
		builder.append(getCheckConnect());
		builder.append(", getuType()=");
		builder.append(getuType());
		builder.append(", getSchoolNum()=");
		builder.append(getSchoolNum());
		builder.append(", getFinalAccess()=");
		builder.append(getFinalAccess());
		builder.append(", getCharacterList()=");
		builder.append(getCharacterList());
		builder.append(", getCodeList()=");
		builder.append(getCodeList());
		builder.append(", getUserGroup()=");
		builder.append(getUserGroup());
		builder.append(", getUserStudent()=");
		builder.append(getUserStudent());
		builder.append(", getUserLeader()=");
		builder.append(getUserLeader());
		builder.append(", getUserSchool()=");
		builder.append(getUserSchool());
		builder.append(", getSchoolName()=");
		builder.append(getSchoolName());
		builder.append(", getChapNum()=");
		builder.append(getChapNum());
		builder.append(", getQuizNum()=");
		builder.append(getQuizNum());
		builder.append(", getIp()=");
		builder.append(getIp());
		builder.append("]");
		return builder.toString();
	}

}
