package com.scsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.MsgDAO;
import com.scsa.vo.Msg;
@Service("Msg")
public class MsgServiceImpl implements MsgService {

	private MsgDAO msgDao;
	
	@Autowired
	public void setMsgDao(MsgDAO msgDao) {
		this.msgDao = msgDao;
	}

	@Override
	public boolean msgSend(Msg msg) {
		return msgDao.msgSend(msg);
	}

	@Override
	public List<Msg> msgDetailByNum(int msg_num) {
		List<Msg> msg =  msgDao.msgDetailByNum(msg_num);
		if (msg != null) {
			msgDao.msgSenderStatusUpdate(msg_num);
			msgDao.msgReceiverStatusUpdate(msg_num);
		}
		return msg;
	}

	@Override
	public List<Msg> msgListByReceiverId(String user_id) {
		return msgDao.msgListByReceiverId(user_id);
	}

	@Override
	public List<Msg> msgListBySenderId(String user_id) {
		return msgDao.msgListBySenderId(user_id);
	}

	@Override
	public boolean msgReceiverRemoveByNum(int msg_num) {
		return msgDao.msgReceiverDeleteByNum(msg_num);
	}

	@Override
	public boolean msgSenderRemoveByNum(int msg_num) {
		return msgDao.msgSenderDeleteByNum(msg_num);
	}

	@Override
	public boolean msgReceiverStatusUpdate(int msg_num) {
		return msgDao.msgReceiverStatusUpdate(msg_num);
	}

	@Override
	public boolean msgSenderStatusUpdate(int msg_num) {
		return msgDao.msgSenderStatusUpdate(msg_num);
	}

	@Override
	public Msg msgChk(String user_id) {
		return msgDao.msgChk(user_id);
	}

	@Override
	public int ReceiveMsgCount(String user_id) {
		return msgDao.ReceiveMsgCount(user_id);
	}

	@Override
	public int SendMsgCount(String user_id) {
		return msgDao.SendMsgCount(user_id);
	}

	@Override
	public List<Msg> findReceiveMsgWithPage(String user_id, int start_num, int end_num) {
		return msgDao.selectReceiveMsgWithPage(user_id, start_num, end_num);
	}

	@Override
	public List<Msg> findSendMsgWithPage(String user_id, int start_num, int end_num) {
		return msgDao.selectSendMsgWithPage(user_id, start_num, end_num);
	}

}
