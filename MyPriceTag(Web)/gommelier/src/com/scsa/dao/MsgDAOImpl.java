package com.scsa.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Msg;

@Repository
public class MsgDAOImpl implements MsgDAO {
		
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public boolean msgSend(Msg msg) {
		HashMap<String, Object> map = new HashMap<>();
		
		String user_id_receiver = msg.getUser_id_receiver();
		String user_id_sender = msg.getUser_id_sender();
		String msg_content = msg.getMsg_content();
		
		map.put("user_id_receiver", user_id_receiver);
		map.put("user_id_sender", user_id_sender);
		map.put("msg_content", msg_content);
		
		return sqlSessionTemplate.insert("Msg.msgSend", map) > 0;
	}

	@Override
	public List<Msg> msgDetailByNum(int msg_num) {
		return sqlSessionTemplate.selectList("Msg.msgDetailByNum", msg_num);
	}

	@Override
	public List<Msg> msgListByReceiverId(String user_id) {
		return sqlSessionTemplate.selectList("Msg.msgListByReceiverId", user_id);
	}

	@Override
	public List<Msg> msgListBySenderId(String user_id) {
		return sqlSessionTemplate.selectList("Msg.msgListBySenderId", user_id);
	}

	@Override
	public boolean msgReceiverStatusUpdate(int msg_num) {
		return sqlSessionTemplate.update("Msg.msgReceiverStatusUpdate", msg_num) >0;
	}

	@Override
	public boolean msgSenderStatusUpdate(int msg_num) {
		return sqlSessionTemplate.update("Msg.msgSenderStatusUpdate", msg_num) >0;
	}

	@Override
	public boolean msgReceiverDeleteByNum(int msg_num) {
		return sqlSessionTemplate.delete("Msg.msgReceiverDeleteByNum", msg_num) >0;
	}

	@Override
	public boolean msgSenderDeleteByNum(int msg_num) {
		return sqlSessionTemplate.delete("Msg.msgSenderDeleteByNum", msg_num)>0;
	}

	@Override
	public Msg msgChk(String user_id) {
		
		List<Msg> list = sqlSessionTemplate.selectList("Msg.msgChk", user_id);
		if (list.size() > 0) {
			return list.get(0);			
		}
		return null;
	}

	@Override
	public int ReceiveMsgCount(String user_id) {
		return sqlSessionTemplate.selectOne("Msg.ReceiveMsgCount", user_id);
	}

	@Override
	public int SendMsgCount(String user_id) {
		return sqlSessionTemplate.selectOne("Msg.SendMsgCount", user_id);
	}

	@Override
	public List<Msg> selectReceiveMsgWithPage(String user_id, int start_num, int end_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("start_num", start_num);
		map.put("end_num", end_num);
		map.put("user_id", user_id);
		return sqlSessionTemplate.selectList("Msg.selectReceiveMsgWithPage", map);
	}

	@Override
	public List<Msg> selectSendMsgWithPage(String user_id, int start_num, int end_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("start_num", start_num);
		map.put("end_num", end_num);
		map.put("user_id", user_id);
		return sqlSessionTemplate.selectList("Msg.selectSendMsgWithPage", map);
	}

}
