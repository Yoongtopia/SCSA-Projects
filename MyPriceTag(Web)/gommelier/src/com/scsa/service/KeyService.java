package com.scsa.service;

import com.scsa.vo.Key;

public interface KeyService {
	
	boolean keyCreate (String user_id, String Key);
	
	// 인증 확인 될 경우 유저 상태 변경 메서드 호출
	// 컨트롤러에서 유저 아이디와 유저가 입력한 키값을 보내야 함
	boolean certification (String user_id, String ckey);
	
}
