package com.seoulnori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seoulnori.dao.MemberDAO;
import com.seoulnori.dao.MemberDAOImpl;
import com.seoulnori.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;
	
	@Autowired
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	//회원가입
	@Override
	public boolean addtMember(Member member, String eventId) {
		if(member.getMemberStatus().equals("승인")){
			memberDAO.insertMember(member);
		}else {
			memberDAO.insertMember(member);
			memberDAO.insertEventManager(member.getUserId(), eventId);
		}
		
		return true;
	}

	//정보수정
	@Override
	public boolean modifyMember(Member member) {
		return memberDAO.updateMember(member);
	}
	
	//강퇴및탈퇴
	@Override
	public boolean removeMember(String userId) {
		return memberDAO.deleteMember(userId);
	}

	//상세조회
	@Override
	public Member selectMemberById(String userId) {
		return memberDAO.selectMemberById(userId);
	}

	//회원 전체 조회
	@Override
	public List<Member> selectMemberList(int startNo, int endNo) {
		return memberDAO.selectMemberList(startNo, endNo);
	}

	//로그인
	@Override
	public Member login(String userId, String password) {
		return memberDAO.login(userId, password);
	}

	//이름, 아이디 검색
	@Override
	public List<Member> selectMemberByUserIdOrNickname(String userId,
			String nickname) {
		return memberDAO.selectMemberByUserIdOrNickname(userId, nickname);
	}

	//회원타입별 조회
	@Override
	public List<Member> selectMemberByMemberType(String memberType) {
		return memberDAO.selectMemberByMemberType(memberType);
	}

	//행사담당자, 담당 행사 조회
	@Override
	public Member selectEventListByEventManager(String userId) {
		return memberDAO.selectEventListByEventManager(userId);
	}
	//승인/대기 수정
	@Override
	public boolean modifyMemberStatus(String userId, String memberStatus) {
		return memberDAO.updateMemberStatus(userId, memberStatus);
	}

	@Override
	public int findPageCount(String memberType) {
		return memberDAO.selectPageCount(memberType);
	}
	
	
	
}
