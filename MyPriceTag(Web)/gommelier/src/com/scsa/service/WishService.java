package com.scsa.service;

import java.util.List;

import com.scsa.vo.Wish;

public interface WishService {
	
	List<Wish> wishListById (String user_id);
	boolean wishRemove (String user_id, int product_num);
	boolean wishCreate (String user_id, int product_num);
	Wish wishCheck(String user_id, int product_num);
	
}
