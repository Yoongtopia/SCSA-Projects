package com.scsa.service;

import java.util.List;
import com.scsa.vo.Msg;

public interface MsgService {
	
	boolean	msgSend (Msg msg);
	// 메시지 상태 수정하는 dao 메서드 동시에 수행
	List<Msg> msgDetailByNum (int msg_num);
	List<Msg> msgListByReceiverId (String user_id);
	List<Msg> msgListBySenderId (String user_id);
	boolean msgReceiverRemoveByNum(int msg_num);
	boolean msgSenderRemoveByNum(int msg_num);
	
	//읽은거 확인
	boolean msgReceiverStatusUpdate (int msg_num);
	boolean msgSenderStatusUpdate (int msg_num);
	
	//페이징
	int ReceiveMsgCount(String user_id);
	int SendMsgCount(String user_id);
	List<Msg> findReceiveMsgWithPage(String user_id, int start_num, int end_num);
	List<Msg> findSendMsgWithPage(String user_id, int start_num, int end_num);
	
	//메시지 계속 확인
	Msg msgChk(String user_id);
}
