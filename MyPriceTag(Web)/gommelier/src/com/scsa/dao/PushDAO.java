package com.scsa.dao;

import java.util.List;

import com.scsa.vo.Push;

public interface PushDAO {
	boolean pushInsert (Push push);
	List<Push> pushListById (String user_id);
	Push pushDetailByNum (int push_num);
	boolean pushUpdateByNum (int push_num, int push_price);
	boolean pushSquareUpdateByNum (int push_num, int push_square);
	boolean pushTagInsertByNum (int push_num, String[] push_tag);
	boolean pushTagDeleteByNum (int push_num);
	boolean pushDeleteByNum (int push_num);
	boolean pushStatusUpdate(int push_num, int push_status);
	List<Push> pushService (int product_square, int product_price, String[] tag);
	boolean pushCheck (int push_check, int product_num, int push_num);
}
