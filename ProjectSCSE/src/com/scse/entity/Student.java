package com.scse.entity;

import java.util.List;

public class Student extends User {

	private int grade;
	private List<Group> groupList;
	private School stuSchool;
	private Progress stuProgress;

	public Student() {
		super();
	}

	public Student(int grade, List<Group> groupList, School stuSchool,
			Progress stuProgress) {
		super();
		this.grade = grade;
		this.groupList = groupList;
		this.stuSchool = stuSchool;
		this.stuProgress = stuProgress;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public List<Group> getGroupList() {
		return groupList;
	}

	public void setGroupList(List<Group> groupList) {
		this.groupList = groupList;
	}

	public School getStuSchool() {
		return stuSchool;
	}

	public void setStuSchool(School stuSchool) {
		this.stuSchool = stuSchool;
	}

	public Progress getStuProgress() {
		return stuProgress;
	}

	public void setStuProgress(Progress stuProgress) {
		this.stuProgress = stuProgress;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Student [grade=");
		builder.append(grade);
		builder.append(", groupList=");
		builder.append(groupList);
		builder.append(", stuSchool=");
		builder.append(stuSchool);
		builder.append(", stuProgress=");
		builder.append(stuProgress);
		builder.append(", getGrade()=");
		builder.append(getGrade());
		builder.append(", getGroupList()=");
		builder.append(getGroupList());
		builder.append(", getStuSchool()=");
		builder.append(getStuSchool());
		builder.append(", getStuProgress()=");
		builder.append(getStuProgress());
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
		builder.append(", toString()=");
		builder.append(super.toString());
		builder.append("]");
		return builder.toString();
	}

}
