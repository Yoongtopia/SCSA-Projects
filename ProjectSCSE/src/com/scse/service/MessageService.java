package com.scse.service;

import com.scse.entity.Message;

public interface MessageService {

	boolean addMessage(Message message) throws Exception;
	Message viewMessage(int msNum) throws Exception;
	boolean updateMessage(Message message) throws Exception;
	Message viewUnReadMessage(String messageTarget);
}
