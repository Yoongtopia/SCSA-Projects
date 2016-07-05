package com.seoulnori.vo;

public class Notice {

	private int noticeNum;
	private String noticeImage;
	private String noticeRegDate;
	private String noticeTitle;
	private String noticeContent;
	private String noticeUpDate;
	private String userId;
	private Member member;
	
	public Notice() {
		super();
	}
	
	
	// notice 등록시 사용  --> 이미지 없을 경우 컨트롤러 단에서 처리
	public Notice(int noticeNum,String noticeImage, String noticeTitle, String noticeContent, String userId) {
		this(noticeNum, noticeImage, noticeTitle, noticeContent);
		this.userId = userId;
	}

	 //notice 수정시 사용
	public Notice(int noticeNum, String noticeImage,  String noticeTitle, String noticeContent) {
		super();
		this.noticeNum=noticeNum;
		this.noticeImage = noticeImage;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	//DB에서 notice가져올 때 사용
	public Notice(int noticeNum, String noticeImage, String noticeRegDate, String noticeTitle,
			String noticeContent, String noticeUpDate, String userId) {
		this(noticeNum, noticeImage,noticeTitle, noticeContent,userId);
		this.noticeRegDate = noticeRegDate;
		this.noticeUpDate = noticeUpDate;
	}

	
	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeImage() {
		return noticeImage;
	}

	public void setNoticeImage(String noticeImage) {
		this.noticeImage = noticeImage;
	}

	public String getNoticeRegDate() {
		return noticeRegDate;
	}

	public void setNoticeRegDate(String noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeUpDate() {
		return noticeUpDate;
	}

	public void setNoticeUpDate(String noticeUpDate) {
		this.noticeUpDate = noticeUpDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Notice [noticeNum=");
		builder.append(noticeNum);
		builder.append(", noticeImage=");
		builder.append(noticeImage);
		builder.append(", noticeRegDate=");
		builder.append(noticeRegDate);
		builder.append(", noticeTitle=");
		builder.append(noticeTitle);
		builder.append(", noticeContent=");
		builder.append(noticeContent);
		builder.append(", noticeUpDate=");
		builder.append(noticeUpDate);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}
	
}
