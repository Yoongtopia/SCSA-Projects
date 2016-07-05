package com.seoulnori.service;

import java.util.List;

import com.seoulnori.vo.Event;
import com.seoulnori.vo.Member;

public interface MemberService {

	boolean addtMember(Member member, String eventId);
	boolean modifyMember(Member member);
	boolean modifyMemberStatus(String userId, String memberStatus);
	boolean removeMember(String userId);
	Member selectMemberById(String userId);
	List<Member> selectMemberList(int startNo, int endNo);
	Member login(String userId, String password);
	List<Member> selectMemberByUserIdOrNickname(String userId, String nickname);
	List<Member> selectMemberByMemberType(String memberType);
	Member selectEventListByEventManager(String userId);
	int findPageCount(String memberType);
}
