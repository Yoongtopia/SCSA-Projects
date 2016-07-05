package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.Member;

public interface MemberDAO {
	
	/*ȸ������
	ȸ��Ż��
	�α���
	ȸ������ ����*/
	
	public void insertMember(Member member);
	public Member login(String memberId, String password);
	public void updateMember(Member member);
	public void updateMemberStatus(String memberId);
	public void deleteMember(String memberId);
	public Member selectMember(String memberId);
	public List<Member> selectMemberList();
	public List<Member> selectMemberListByStatus(String status);
	public String selectMemberId(String memberId);
	public String selectMemberEmail(String memberEmail);
	
}//end interface