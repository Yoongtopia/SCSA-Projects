package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.Member;

public interface MemberService {

	public void createMember(Member member);
	public Member login(String memberId, String password);
	public void modifyMember(Member member);
	public void modifyMemberStatus(String memberId);
	public void removeMember(String memberId);
	public Member findMember(String memberId);
	public List<Member> findMemberLsit();
	public List<Member> findMemberLsitByStatus(String status);
	public String findMemberId(String memberId);
	public String findMemberEmail(String memberEmail);
	
}