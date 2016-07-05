package com.seoulnori.vo;

public class Review {
	
	private int reviewNum;
	private String userId;
	private float starPoint;
	private String reviewRegDate;
	private String reviewContent;
	private String reviewUpDate;
	private String reviewImage;
	private String eventId;
	private Member member;
	private String eventTitle;
	
	public Review() {
		super();
	}
	
	//review 등록시
	public Review(String userId, float starPoint, String reviewContent, String eventId) {
		super();
		this.starPoint = starPoint;
		this.reviewContent = reviewContent;
		this.userId = userId;
		this.eventId=eventId;	
	}
	
	
	//review 수정시
	public Review(String userId, float starPoint, String reviewContent, String reviewImage, String eventId) {
		this(userId, starPoint, reviewContent, eventId);
		this.reviewImage = reviewImage;
	}

	//review 가져올때
	public Review(int reviewNum, String userId, float starPoint,
			String reviewRegDate, String reviewContent, String reviewUpDate,
			String reviewImage, String eventId) {
		this(userId, starPoint,reviewContent, reviewImage, eventId);
		this.reviewNum = reviewNum;
		this.reviewRegDate = reviewRegDate;
		this.reviewUpDate = reviewUpDate;
	}
	

	public Review(int reviewNum, String userId, float starPoint,
			String reviewRegDate, String reviewContent, String reviewUpDate,
			String reviewImage, String eventId, Member member, String eventTitle) {
		super();
		this.reviewNum = reviewNum;
		this.userId = userId;
		this.starPoint = starPoint;
		this.reviewRegDate = reviewRegDate;
		this.reviewContent = reviewContent;
		this.reviewUpDate = reviewUpDate;
		this.reviewImage = reviewImage;
		this.eventId = eventId;
		this.member = member;
		this.eventTitle = eventTitle;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public float getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}

	public String getReviewRegDate() {
		return reviewRegDate;
	}

	public void setReviewRegDate(String reviewRegDate) {
		this.reviewRegDate = reviewRegDate;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewUpDate() {
		return reviewUpDate;
	}

	public void setReviewUpDate(String reviewUpDate) {
		this.reviewUpDate = reviewUpDate;
	}

	public String getReviewImage() {
		return reviewImage;
	}

	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Review [reviewNum=");
		builder.append(reviewNum);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", starPoint=");
		builder.append(starPoint);
		builder.append(", reviewRegDate=");
		builder.append(reviewRegDate);
		builder.append(", reviewContent=");
		builder.append(reviewContent);
		builder.append(", reviewUpDate=");
		builder.append(reviewUpDate);
		builder.append(", reviewImage=");
		builder.append(reviewImage);
		builder.append(", eventId=");
		builder.append(eventId);
		builder.append("]");
		return builder.toString();
	}
	
	

}
