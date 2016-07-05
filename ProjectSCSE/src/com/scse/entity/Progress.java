package com.scse.entity;

public class Progress {

	private int chapNum;
	private int quizNum;
	private String userId;
	private int time;
	private int tryNum;
	private String studyDate;
	private int failNum;	
	
	private User progressUser;
	private Mission progressMission;

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getTryNum() {
		return tryNum;
	}
	public void setTryNum(int tryNum) {
		this.tryNum = tryNum;
	}
	public String getStudyDate() {
		return studyDate;
	}
	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
	}
	public User getProgressUser() {
		return progressUser;
	}
	public void setProgressUser(User progressUser) {
		this.progressUser = progressUser;
	}
	public Mission getProgressMission() {
		return progressMission;
	}
	public void setProgressMission(Mission progressMission) {
		this.progressMission = progressMission;
	}
	public Progress() {
		super();
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
	public int getFailNum() {
		return failNum;
	}
	public void setFailNum(int failNum) {
		this.failNum = failNum;
	}
	
	public Progress(String userId,int chapNum, int quizNum,  int time,
			String studyDate,int tryNum) {
		super();
		this.chapNum = chapNum;
		this.quizNum = quizNum;
		this.userId = userId;
		this.time = time;
		this.tryNum = tryNum;
		this.studyDate = studyDate;
	}
	public Progress(int chapNum, int quizNum, String userId, int time,
			 int tryNum, String studyDate, User progressUser,
			Mission progressMission) {
		super();
		this.chapNum = chapNum;
		this.quizNum = quizNum;
		this.userId = userId;
		this.time = time;
		this.tryNum = tryNum;
		this.studyDate = studyDate;
		this.progressUser = progressUser;
		this.progressMission = progressMission;
	}
	
	
	public Progress(String userId, int chapNum, int quizNum, int time,
			String studyDate, int tryNum, int failNum) {
		super();
		this.userId = userId;
		this.chapNum = chapNum;
		this.quizNum = quizNum;
		this.time = time;
		this.studyDate = studyDate;
		this.tryNum = tryNum;
		this.failNum = failNum;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Progress [userId=");
		builder.append(userId);
		builder.append(", chapNum=");
		builder.append(chapNum);
		builder.append(", quizNum=");
		builder.append(quizNum);
		builder.append(", time=");
		builder.append(time);
		builder.append(", studyDate=");
		builder.append(studyDate);
		builder.append(", tryNum=");
		builder.append(tryNum);
		builder.append(", failNum=");
		builder.append(failNum);
		builder.append(", progressUser=");
		builder.append(progressUser);
		builder.append(", progressMission=");
		builder.append(progressMission);
		builder.append("]");
		return builder.toString();
	}
	
}