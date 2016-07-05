package com.seoulnori.dao;

import java.util.List;

import com.seoulnori.vo.Event;
import com.seoulnori.vo.Member;

public interface MemberDAO {
	
	boolean insertMember(Member member);
	boolean insertEventManager(String userId, String eventId);
	boolean updateMember(Member member);
	boolean updateMemberStatus(String userId, String memberStatus);
	boolean deleteMember(String userId);
	Member selectMemberById(String userId);
	List<Member> selectMemberList(int startNo, int endNo);
	Member login(String userId, String password);
	List<Member> selectMemberByUserIdOrNickname(String userId, String nickname);
	List<Member> selectMemberByMemberType(String memberType);
	Member selectEventListByEventManager(String userId);
	int selectPageCount(String memberType);
}
