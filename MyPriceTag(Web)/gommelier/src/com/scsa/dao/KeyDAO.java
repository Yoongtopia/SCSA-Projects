package com.scsa.dao;

import com.scsa.vo.Key;

public interface KeyDAO {
	boolean keyInsert (String user_id, String key);
	String certification (String user_id);
	boolean keyDelete (String user_id);
}
