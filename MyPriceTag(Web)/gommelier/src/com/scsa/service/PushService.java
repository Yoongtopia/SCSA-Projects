package com.scsa.service;

import java.util.List;

import com.scsa.vo.Product;
import com.scsa.vo.Push;

public interface PushService {
	
	boolean pushCreate (Push push);
	List<Push> pushListById (String user_id);
	Push pushDetailByNum (int push_num);
	//수정 관련 메서드 모두 호출
	boolean pushModifyByNum (int push_num, int push_price, int push_square, String[] push_tag);
	boolean pushRemoveByNum (int push_num);
	boolean pushStatusModify(int push_num, int push_status);
	List<Push> pushMegSend (Product product);
	boolean pushCheck (int push_check, int product_num, int push_num);
}
