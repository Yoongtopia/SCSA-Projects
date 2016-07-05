package com.scsa.wapl.entity;

public class Member {

	private String memberId;
	private String password;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberRank;
	private String memberStatus;

	public Member() {
		super();
	}

	public Member(String memberId, String password, String memberName,
			String memberEmail, String memberPhone) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
	}

	public Member(String memberId, String password, String mamberName,
			String memberEmail, String memberPhone, String memberRank,
			String memberStatus) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = mamberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberRank = memberRank;
		this.memberStatus = memberStatus;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberRank() {
		return memberRank;
	}

	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [memberId=");
		builder.append(memberId);
		builder.append(", password=");
		builder.append(password);
		builder.append(", mamberName=");
		builder.append(memberName);
		builder.append(", memberEmail=");
		builder.append(memberEmail);
		builder.append(", memberPhone=");
		builder.append(memberPhone);
		builder.append(", memberRank=");
		builder.append(memberRank);
		builder.append(", memberStatus=");
		builder.append(memberStatus);
		builder.append("]");
		return builder.toString();
	}

}