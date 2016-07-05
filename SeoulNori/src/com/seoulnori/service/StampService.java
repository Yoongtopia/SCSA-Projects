package com.seoulnori.service;

import java.util.HashMap;
import java.util.List;

import com.seoulnori.vo.Member;
import com.seoulnori.vo.Stamp;

public interface StampService {
	//stamp 종류
		//1. 축제 참여시 받는 일반스탬프 
		//2. 같은 카테고리의 행사를 5번,10번씩 참여시 받는 스탬프 
		//3. 삭제 스탬프
		boolean addStamp(Stamp stamp);
		
		//관리자가 스탬프의 상태를 바꾸기 위해 사용
		boolean updateStamp(String stampNum, String userId, String eventId);
		// false상태로 바뀐 스탬프가 메인스탬프인지 아닌지 판단하기 위해 사용
		boolean checkMainStamp(String stampNum, String userId, String eventId);
		// false상태로 바뀐 스탬프가 메인스탬프일 경우 사용되는 메서드
		boolean updateMainStamp(String stampNum, String userId, String eventId);
		
		//관리자가 스탬프를 삭제하기 위해 사용(현재 유스케이스에서는 필요없지만 만일을 대비해 만듬)
		boolean removeStamp(String stampNum, String userId, String eventId);
		
		//관리자 및 사용자의 스탬프 상세보기용
		Stamp findStampByUserIdStampNumEventId(String stampNum, String userId, String eventId);
		
		//사용자의 회원 아이디별 스탬프 리스트 보기
		//스탬프 상태가 'enable'인 것만 보여줌
		List<Stamp> findStampListByUserId(String userId);
			
		//관리자의 전체 스탬프 리스트 보기
		//스탬프 상태에 상관없이 모든 stamp를 보여줌
		List<Stamp> findStampListForAdmin();
		
		//스탬프 명예의 전당에 뿌리는 스탬프 리스트
		//아이디별로 스탬프 상태가 'enable'이고 스탬프번호가 '삭제용스탬프'가 아닌 스탬프만 계산하여 
		//갯수가 많은 순서대로 보유한 스탬프 갯수와 member정보를 뿌린다.
		List<Member> findStampListForUser();
		
		//사용자의 대표스탬프 설정
		boolean makeMainStamp(String stampNum, String userId, String eventId);
		
		//특정 카테고리에 속한 스탬프를 몇 개 보유하고 있는지 확인
		Integer countStampCategory(String userId, String stampNum);
		
		//관리자  스탬프 리스트 페이징
		List<Stamp> findStampListForAdminWithPage(int startNo, int endNo);
		
		//사용자   스탬프 리스트 페이징
		List<Stamp> findStampListByUserIdWithPage(String userId, int startNo, int endNo);
}
