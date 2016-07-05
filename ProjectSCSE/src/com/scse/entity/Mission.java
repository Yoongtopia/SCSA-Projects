package com.scse.entity;

public class Mission {

	
	private int chapNum;
	private int quizNum;
	
	private String mapImg;
	private String quizDesc;
	private String quizLevel;
	private String quizType;
	
	private String selectorCode;
	private String boardCode;
	private String jsCode;
	private String jsName;
	private String cssName;
	private String mapCode;
	private String targetCode;
	private int rpsNum;
	
	private int missionIndex;
	private String quizHeader = null;

	public String getMapCode() {
		return mapCode;
	}
	public void setMapCode(String mapCode) {
		this.mapCode = mapCode;
	}
	public String getTargetCode() {
		return targetCode;
	}
	public void setTargetCode(String targetCode) {
		this.targetCode = targetCode;
	}
	public String getMapImg() {
		return mapImg;
	}
	public void setMapImg(String mapImg) {
		this.mapImg = mapImg;
	}
	public String getQuizDesc() {
		return quizDesc;
	}
	public void setQuizDesc(String quizDesc) {
		this.quizDesc = quizDesc;
	}
	public String getQuizLevel() {
		return quizLevel;
	}
	public void setQuizLevel(String quizLevel) {
		this.quizLevel = quizLevel;
	}
	public String getQuizType() {
		return quizType;
	}
	public void setQuizType(String quizType) {
		this.quizType = quizType;
	}
	public Mission() {
		super();
	}
	public String getSelectorCode() {
		return selectorCode;
	}
	public void setSelectorCode(String selectorCode) {
		this.selectorCode = selectorCode;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getJsCode() {
		return jsCode;
	}
	public void setJsCode(String jsCode) {
		this.jsCode = jsCode;
	}
	public String getJsName() {
		return jsName;
	}
	public void setJsName(String jsName) {
		this.jsName = jsName;
	}
	public String getCssName() {
		return cssName;
	}
	public void setCssName(String cssName) {
		this.cssName = cssName;
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
	public int getRpsNum() {
		return rpsNum;
	}
	public void setRpsNum(int rpsNum) {
		this.rpsNum = rpsNum;
	}
	public int getMissionIndex() {
		return missionIndex;
	}
	public void setMissionIndex(int missionIndex) {
		this.missionIndex = missionIndex;
	}
	public Mission(int chapNum, int quizNum, String mapImg, String quizDesc,
			String quizLevel, String quizType, String selectorCode,
			String boardCode, String jsCode, String jsName, String cssName,
			String mapCode, String targetCode, int rpsNum, int missionIndex) {
		super();
		this.chapNum = chapNum;
		this.quizNum = quizNum;
		this.mapImg = mapImg;
		this.quizDesc = quizDesc;
		this.quizLevel = quizLevel;
		this.quizType = quizType;
		this.selectorCode = selectorCode;
		this.boardCode = boardCode;
		this.jsCode = jsCode;
		this.jsName = jsName;
		this.cssName = cssName;
		this.mapCode = mapCode;
		this.targetCode = targetCode;
		this.rpsNum = rpsNum;
		this.missionIndex = missionIndex;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mission [chapNum=");
		builder.append(chapNum);
		builder.append(", quizNum=");
		builder.append(quizNum);
		builder.append(", mapImg=");
		builder.append(mapImg);
		builder.append(", quizDesc=");
		builder.append(quizDesc);
		builder.append(", quizLevel=");
		builder.append(quizLevel);
		builder.append(", quizType=");
		builder.append(quizType);
		builder.append(", selectorCode=");
		builder.append(selectorCode);
		builder.append(", boardCode=");
		builder.append(boardCode);
		builder.append(", jsCode=");
		builder.append(jsCode);
		builder.append(", jsName=");
		builder.append(jsName);
		builder.append(", cssName=");
		builder.append(cssName);
		builder.append(", mapCode=");
		builder.append(mapCode);
		builder.append(", targetCode=");
		builder.append(targetCode);
		builder.append(", rpsNum=");
		builder.append(rpsNum);
		builder.append(", missionIndex=");
		builder.append(missionIndex);
		builder.append("]");
		return builder.toString();
	}

		
}
