package com.seoulnori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seoulnori.vo.Event;
import com.seoulnori.vo.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	//회원가입
	@Override
	public boolean insertMember(Member member) {
		return sqlSessionTemplate.insert("Member.insertMember", member) > 0;
	}
	
	//이벤트 담당자, 담당행사 등록(승인)
	@Override
	public boolean insertEventManager(String userId, String eventId) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("userId", userId);
		map.put("eventId", eventId);
		return sqlSessionTemplate.insert("Member.insertEventManager", map) > 0;
	}

	//정보수정
	@Override
	public boolean updateMember(Member member) {
		return sqlSessionTemplate.update("Member.updateMember", member) > 0;
	}

	//삭제
	@Override
	public boolean deleteMember(String userId) {
		return sqlSessionTemplate.delete("Member.deleteMember", userId) > 0;
	}

	//회원 상세 조회
	@Override
	public Member selectMemberById(String userId) {
		return sqlSessionTemplate.selectOne("Member.selectMemberById", userId);
	}

	//전체 회원 목록
	@Override
	public List<Member> selectMemberList(int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		return sqlSessionTemplate.selectList("Member.selectMemberList", map);
	}

	//로그인
	@Override
	public Member login(String userId, String password) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("userId", userId);
		map.put("password", password);
		return sqlSessionTemplate.selectOne("Member.login", map);
	}

	//아이디, 닉네임으로 회원 검색
	@Override
	public List<Member> selectMemberByUserIdOrNickname(String userId, String nickname) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		if(userId != null && userId.trim().length() != 0){
			map.put("userId", userId);
			}
			if(nickname != null && nickname.trim().length() != 0){
				map.put("nickname", nickname);
			}
		return sqlSessionTemplate.selectList("Member.selectMemberByUserIdOrNickname", map);
	}

	//멤버타입별 정렬
	@Override
	public  List<Member> selectMemberByMemberType(String memberType) {
		return sqlSessionTemplate.selectList("Member.selectMemberByMemberType", memberType);
	}

	// 행사담당자, 담당행사 리스트
	@Override
	public Member selectEventListByEventManager(String userId) {
		return sqlSessionTemplate.selectOne("Member.selectEventListByManager", userId);
	}

	@Override
	public boolean updateMemberStatus(String userId, String memberStatus) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("memberStatus", memberStatus);
		return sqlSessionTemplate.update("Member.updateMemberStatus", map) > 0;
	}

	@Override
	public int selectPageCount(String memberType) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberType", memberType);
		return sqlSessionTemplate.selectOne("Member.selectPageCount", map);
	}



}
