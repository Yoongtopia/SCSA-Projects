package com.scse.entity;

public class Mission5 {

	private int missionIndex;
	private int chapNum;
	private int quizNum;
	private String quizHeader;
	private String selectorCode;
	
	public Mission5() {
		super();
	}

	public Mission5(int missionIndex, int chapNum, int quizNum,
			String quizHeader, String selectorCode) {
		super();
		this.missionIndex = missionIndex;
		this.chapNum = chapNum;
		this.quizNum = quizNum;
		this.quizHeader = quizHeader;
		this.selectorCode = selectorCode;
	}

	public String getSelectorCode() {
		return selectorCode;
	}

	public void setSelectorCode(String selectorCode) {
		this.selectorCode = selectorCode;
	}

	public int getMissionIndex() {
		return missionIndex;
	}

	public void setMissionIndex(int missionIndex) {
		this.missionIndex = missionIndex;
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

	public String getQuizHeader() {
		return quizHeader;
	}

	public void setQuizHeader(String quizHeader) {
		this.quizHeader = quizHeader;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mission5 [getSelectorCode()=");
		builder.append(getSelectorCode());
		builder.append(", getMissionIndex()=");
		builder.append(getMissionIndex());
		builder.append(", getChapNum()=");
		builder.append(getChapNum());
		builder.append(", getQuizNum()=");
		builder.append(getQuizNum());
		builder.append(", getQuizHeader()=");
		builder.append(getQuizHeader());
		builder.append("]");
		return builder.toString();
	}
	
}
