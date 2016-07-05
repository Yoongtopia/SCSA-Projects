package com.scsa.dao;

import java.util.List;

import com.scsa.vo.Wish;

public interface WishDAO {
	List<Wish> wishListById (String user_id);
	boolean wishDelete (String user_id, int product_num);
	boolean wishInsert (String user_id, int product_num);
	Wish wishCheck(String user_id, int product_num);
}
