package com.seoulnori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seoulnori.vo.Member;
import com.seoulnori.vo.Notice;
import com.seoulnori.vo.Stamp;


@Repository
public class StampDAOImpl implements StampDAO {

private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//stamp 종류
		//1. 축제 참여시 받는 일반스탬프 
		//2. 같은 카테고리의 행사를 5번,10번씩 참여시 받는 스탬프 
		//3. 삭제 스탬프
	@Override
	public boolean insertStamp(Stamp stamp) {
		return sqlSessionTemplate.insert("Stamp.insertStamp", stamp)>0;
	}
	//관리자가 스탬프의 상태를 바꾸기 위해 사용
	@Override
	public boolean updateStamp(String stampNum, String userId, String eventId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("stampNum", stampNum);
		map.put("userId", userId);
		map.put("eventId", eventId);
		return sqlSessionTemplate.update("Stamp.updateStamp", map)>0;
	}
	// false상태로 바뀐 스탬프가 메인스탬프인지 아닌지 판단하기 위해 사용
	@Override
	public boolean checkMainStamp(String stampNum, String userId, String eventId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("stampNum", stampNum);
		map.put("userId", userId);
		map.put("eventId", eventId);
		return sqlSessionTemplate.selectOne("Stamp.checkMainStamp", map)!=null;
	}
	// false상태로 바뀐 스탬프가 메인스탬프일 경우 사용되는 메서드
	@Override
	public boolean updateMainStamp(String stampNum, String userId,
			String eventId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("stampNum", stampNum);
		map.put("userId", userId);
		map.put("eventId", eventId);
		return sqlSessionTemplate.update("Stamp.updateMainStamp", map)>0;
	}
	 //관리자가 스탬프를 삭제하기 위해 사용(현재 유스케이스에서는 필요없지만 만일을 대비해 만듬)
	@Override
	public boolean deleteStamp(String stampNum, String userId, String eventId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("stampNum", stampNum);
		map.put("userId", userId);
		map.put("eventId", eventId);
		return sqlSessionTemplate.delete("Stamp.deleteStamp", map)>0;
	}

	//관리자 및 사용자의 스탬프 상세보기용
	@Override
	public Stamp selectStampByUserIdStampNumEventId(String stampNum,
			String userId, String eventId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("stampNum", stampNum);
		map.put("userId", userId);
		map.put("eventId", eventId);
		if(sqlSessionTemplate.selectOne("Stamp.selectStampByUserIdStampNumEventId", map)!=null){
			return sqlSessionTemplate.selectOne("Stamp.selectStampByUserIdStampNumEventId", map);
		}else {
			return null;
		}
		
	}
	//사용자의 회원 아이디별 스탬프 리스트 보기
	//스탬프 상태가 '1(true)'인 것만 보여줌
	@Override
	public List<Stamp> selectStampListByUserId(String userId) {
		return sqlSessionTemplate.selectList("Stamp.selectStampListByUserId", userId);
	}

	
	//관리자의 전체 스탬프 리스트 보기
	//스탬프 상태(1 또는 -1)에 상관없이 모든 stamp를 보여줌
	@Override
	public List<Stamp> selectStampListForAdmin() {
		return sqlSessionTemplate.selectList("Stamp.stampListwithMember");
	}
	//스탬프 명예의 전당에 뿌리는 스탬프 리스트
	//아이디별로 스탬프 상태가 '1'이고 스탬프번호가 '삭제용스탬프'가 아닌 스탬프만 계산하여 
	//갯수가 많은 순서대로 보유한 스탬프 갯수와 member정보를 뿌린다.
	@Override
	public List<Member> selectStampListForUser() {
		return sqlSessionTemplate.selectList("Stamp.selectMemberListForHallOfFame");
	}
	//사용자의 대표스탬프 설정
	@Override
	public boolean makeMainStamp(String stampNum, String userId, String eventId) {
		System.out.println(stampNum+"/"+userId+"/"+eventId);
		HashMap<String, Object> map = new HashMap<>();
		map.put("stampNum", stampNum);
		map.put("userId", userId);
		map.put("eventId", eventId);
		return sqlSessionTemplate.update("Stamp.makeMainStamp", map)>0;
	}

	@Override
	public Integer countStampCategory(String userId, String stampNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("stampNum", stampNum);
		return sqlSessionTemplate.selectOne("Stamp.countStampCategory", map);
	}
	
	//관리자 스탬프 페이징
	@Override
	public List<Stamp> selectStampListForAdminWithPage(int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		return sqlSessionTemplate.selectList("Stamp.stampListwithMemberWithPage", map);
	}
	
	//사용자의 회원 아이디별 스탬프 리스트 보기
	//스탬프 상태가 '1(true)'인 것만 보여줌
	@Override
	public List<Stamp> selectStampListByUserIdWithPage(String userId, int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("userId", userId);
		return sqlSessionTemplate.selectList("Stamp.selectStampListByUserIdWithPage", map);
	}
	

}
