package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.wapl.dao.MemberDAO;
import com.scsa.wapl.entity.Member;

@Component
@Transactional(propagation=Propagation.SUPPORTS)
public class MemberServiceImplByKyo implements MemberService {

	private MemberDAO memberDao;
	
	@Autowired
	public void setMemberDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public void createMember(Member member) {
		memberDao.insertMember(member);
	}

	@Override
	public Member login(String memberId, String password) {
		return memberDao.login(memberId, password);
	}

	@Override
	public void modifyMember(Member member) {
		memberDao.updateMember(member);
	}

	@Override
	public void modifyMemberStatus(String memberId) {
		memberDao.updateMemberStatus(memberId);
	}

	@Override
	public void removeMember(String memberId) {
		memberDao.deleteMember(memberId);
	}

	@Override
	public Member findMember(String memberId) {
		return memberDao.selectMember(memberId);
	}

	@Override
	public List<Member> findMemberLsit() {
		return memberDao.selectMemberList();
	}

	@Override
	public List<Member> findMemberLsitByStatus(String status) {
		return memberDao.selectMemberListByStatus(status);
	}

	@Override
	public String findMemberId(String memberId) {
		return memberDao.selectMemberId(memberId);
	}
	
	@Override
	public String findMemberEmail(String memberEmail) {
		return memberDao.selectMemberEmail(memberEmail);
	}

}