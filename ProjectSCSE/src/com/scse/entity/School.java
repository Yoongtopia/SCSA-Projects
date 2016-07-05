package com.scse.entity;

import java.io.Serializable;

public class School implements Serializable { 

	private String schoolNum;
	private String schoolName;
	private String schoolAddress;
	public String getSchoolNum() {
		return schoolNum;
	}
	public void setSchoolNum(String schoolNum) {
		this.schoolNum = schoolNum;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSchoolAddress() {
		return schoolAddress;
	}
	public void setSchoolAddress(String schoolAddress) {
		this.schoolAddress = schoolAddress;
	}
	public School() {
		super();
	}
	public School(String schoolNum, String schoolName, String schoolAddress) {
		super();
		this.schoolNum = schoolNum;
		this.schoolName = schoolName;
		this.schoolAddress = schoolAddress;
	}
	
	
	public School(String schoolNum) {
		super();
		this.schoolNum = schoolNum;
	}
	
	@Override
	public String toString() {
		return "School [schoolNum=" + schoolNum + ", schoolName=" + schoolName
				+ ", schoolAddress=" + schoolAddress + "]";
	}
	
	
	
	
	
}
