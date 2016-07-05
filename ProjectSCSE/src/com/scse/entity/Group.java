package com.scse.entity;

import java.io.Serializable;
import java.util.List;

public class Group implements Serializable{

	private int groupNum;
	private String groupName;
	private char groupType;

	private Leader groupLeader;
	private School groupSchool;
	private List<Notice> groupNotice;
	private List<User> studentList;

	public Group() {
		super();
	}

	public Group(int groupNum, String groupName, char groupType,
			Leader groupLeader, School groupSchool, List<Notice> groupNotice,
			List<User> studentList) {
		super();
		this.groupNum = groupNum;
		this.groupName = groupName;
		this.groupType = groupType;
		this.groupLeader = groupLeader;
		this.groupSchool = groupSchool;
		this.groupNotice = groupNotice;
		this.studentList = studentList;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public char getGroupType() {
		return groupType;
	}

	public void setGroupType(char groupType) {
		this.groupType = groupType;
	}

	public Leader getGroupLeader() {
		return groupLeader;
	}

	public void setGroupLeader(Leader groupLeader) {
		this.groupLeader = groupLeader;
	}

	public School getGroupSchool() {
		return groupSchool;
	}

	public void setGroupSchool(School groupSchool) {
		this.groupSchool = groupSchool;
	}

	public List<Notice> getgroupNotice() {
		return groupNotice;
	}

	public void setgroupNotice(List<Notice> groupNotice) {
		this.groupNotice = groupNotice;
	}

	public List<User> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<User> studentList) {
		this.studentList = studentList;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Group [groupNum=");
		builder.append(groupNum);
		builder.append(", groupName=");
		builder.append(groupName);
		builder.append(", groupType=");
		builder.append(groupType);
		builder.append(", groupLeader=");
		builder.append(groupLeader);
		builder.append(", groupSchool=");
		builder.append(groupSchool);
		builder.append(", groupNotice=");
		builder.append(groupNotice);
		builder.append(", studentList=");
		builder.append(studentList);
		builder.append("]");
		return builder.toString();
	}

}
