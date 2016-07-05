package com.scsa.service;

import java.util.List;
import com.scsa.vo.Msg;

public interface MsgService {
	
	boolean	msgSend (Msg msg);
	// �޽��� ���� �����ϴ� dao �޼��� ���ÿ� ����
	List<Msg> msgDetailByNum (int msg_num);
	List<Msg> msgListByReceiverId (String user_id);
	List<Msg> msgListBySenderId (String user_id);
	boolean msgReceiverRemoveByNum(int msg_num);
	boolean msgSenderRemoveByNum(int msg_num);
	
	//������ Ȯ��
	boolean msgReceiverStatusUpdate (int msg_num);
	boolean msgSenderStatusUpdate (int msg_num);
	
	//����¡
	int ReceiveMsgCount(String user_id);
	int SendMsgCount(String user_id);
	List<Msg> findReceiveMsgWithPage(String user_id, int start_num, int end_num);
	List<Msg> findSendMsgWithPage(String user_id, int start_num, int end_num);
	
	//�޽��� ��� Ȯ��
	Msg msgChk(String user_id);
}
