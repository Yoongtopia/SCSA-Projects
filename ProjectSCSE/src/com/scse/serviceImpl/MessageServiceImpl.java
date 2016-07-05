package com.scse.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.scse.dao.MessageDAO;
import com.scse.entity.Message;
import com.scse.service.MessageService;

@Component("message")
public class MessageServiceImpl implements MessageService {

	MessageDAO messageDao;
	
	@Autowired	
	public void setMessageDao(MessageDAO messageDao) {
		this.messageDao = messageDao;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addMessage(Message message) throws Exception {
		return messageDao.insertMessage(message);
	}

	@Override
	public Message viewMessage(int msNum) throws Exception {
		return messageDao.selectMessage(msNum);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateMessage(Message message) throws Exception {
		return messageDao.updateMessage(message);
	}

	@Override
	public Message viewUnReadMessage(String messageTarget) {
		return messageDao.selectUnReadMessage(messageTarget);
	}
}