package com.scse.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scse.dao.MessageDAO;
import com.scse.entity.Message;

@Repository("messageDao")
public class MessageDAOImpl implements MessageDAO {

	private SqlSessionTemplate sqlSessionTemplate;
		
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insertMessage(Message message) throws Exception {
		return sqlSessionTemplate.insert("Message.insertMessage", message)>0;
	}

	@Override
	public Message selectMessage(int msNum) throws Exception {
		return sqlSessionTemplate.selectOne("Message.selectMessageByMsNum", msNum);
	}

	@Override
	public boolean updateMessage(Message message) throws Exception {
		return sqlSessionTemplate.update("Message.updateMessage",message)>0;
	}

	@Override
	public Message selectUnReadMessage(String messageTarget) {
		return sqlSessionTemplate.selectOne("Message.selectUnReadMessage", messageTarget);
	}
}