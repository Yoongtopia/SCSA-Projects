package com.scse.dao;

import com.scse.entity.Message;

public interface MessageDAO {

	boolean insertMessage(Message message) throws Exception;
	Message selectMessage(int msNum) throws Exception;
	boolean updateMessage(Message message) throws Exception;
	Message selectUnReadMessage(String messageTarget);
}
