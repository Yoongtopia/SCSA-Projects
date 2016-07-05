package com.scse.entity;

import java.util.List;

public class Leader extends User {

	private String email;
	private String phone;
	private String conf;

	private List<Group> groupList;
	private School leaderSchool;
	private String schoolNum;

	public Leader() {
		super();
	}

	public Leader(String email, String phone, String conf,
			List<Group> groupList, School leaderSchool, String schoolNum) {
		super();
		this.email = email;
		this.phone = phone;
		this.conf = conf;
		this.groupList = groupList;
		this.leaderSchool = leaderSchool;
		this.schoolNum = schoolNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getConf() {
		return conf;
	}

	public void setConf(String conf) {
		this.conf = conf;
	}

	public List<Group> getGroupList() {
		return groupList;
	}

	public void setGroupList(List<Group> groupList) {
		this.groupList = groupList;
	}

	public School getLeaderSchool() {
		return leaderSchool;
	}

	public void setLeaderSchool(School leaderSchool) {
		this.leaderSchool = leaderSchool;
	}

	public String getSchoolNum() {
		return schoolNum;
	}

	public void setSchoolNum(String schoolNum) {
		this.schoolNum = schoolNum;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Leader [email=");
		builder.append(email);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", conf=");
		builder.append(conf);
		builder.append(", groupList=");
		builder.append(groupList);
		builder.append(", leaderSchool=");
		builder.append(leaderSchool);
		builder.append(", schoolNum=");
		builder.append(schoolNum);
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
		builder.append("]");
		return builder.toString();
	}

}
