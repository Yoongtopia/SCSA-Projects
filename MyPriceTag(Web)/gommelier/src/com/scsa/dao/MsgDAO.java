package com.scsa.dao;

import java.util.List;

import com.scsa.vo.Msg;

public interface MsgDAO {
	boolean	msgSend (Msg msg);
	List<Msg> msgDetailByNum (int msg_num);
	List<Msg> msgListByReceiverId (String user_id);
	List<Msg> msgListBySenderId (String user_id);
	boolean msgReceiverStatusUpdate (int msg_num);
	boolean msgSenderStatusUpdate (int msg_num);
	boolean msgReceiverDeleteByNum(int msg_num);
	boolean msgSenderDeleteByNum(int msg_num);
	int ReceiveMsgCount(String user_id);
	int SendMsgCount(String user_id);
	List<Msg> selectReceiveMsgWithPage(String user_id, int start_num, int end_num);
	List<Msg> selectSendMsgWithPage(String user_id, int start_num, int end_num);
	
	//새메시지 확인
	Msg msgChk(String user_id);
}
