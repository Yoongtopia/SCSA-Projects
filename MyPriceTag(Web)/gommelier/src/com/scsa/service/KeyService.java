package com.scsa.service;

import com.scsa.vo.Key;

public interface KeyService {
	
	boolean keyCreate (String user_id, String Key);
	
	// ���� Ȯ�� �� ��� ���� ���� ���� �޼��� ȣ��
	// ��Ʈ�ѷ����� ���� ���̵�� ������ �Է��� Ű���� ������ ��
	boolean certification (String user_id, String ckey);
	
}
