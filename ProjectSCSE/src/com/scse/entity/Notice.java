package com.scse.entity;

public class Notice {

	private int noticeNum;
	private String noticeTitle;
	private String noticeDate;
	private String noticeContent;
		
	private String leaderId;
	private int groupNum;
	
	private String noticeTarget;

	private Group noticeGroup;
	
	
	
	public Group getNoticeGroup() {
		return noticeGroup;
	}

	public void setNoticeGroup(Group noticeGroup) {
		this.noticeGroup = noticeGroup;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}

	public Notice() {
		super();
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	
	public String getNoticeTarget() {
		return noticeTarget;
	}

	public void setNoticeTarget(String noticeTarget) {
		this.noticeTarget = noticeTarget;
	}

	public Notice(int noticeNum, String noticeTitle, String noticeDate,
			String noticeContent, String leaderId, int groupNum,
			String noticeTarget, Group noticeGroup) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
		this.leaderId = leaderId;
		this.groupNum = groupNum;
		this.noticeTarget = noticeTarget;
		this.noticeGroup = noticeGroup;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Notice [noticeNum=");
		builder.append(noticeNum);
		builder.append(", noticeTitle=");
		builder.append(noticeTitle);
		builder.append(", noticeDate=");
		builder.append(noticeDate);
		builder.append(", noticeContent=");
		builder.append(noticeContent);
		builder.append(", leaderId=");
		builder.append(leaderId);
		builder.append(", groupNum=");
		builder.append(groupNum);
		builder.append(", noticeTarget=");
		builder.append(noticeTarget);
		builder.append(", noticeGroup=");
		builder.append(noticeGroup);
		builder.append("]");
		return builder.toString();
	}

	
	

	
}