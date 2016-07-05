package com.scsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.WishDAO;
import com.scsa.vo.Wish;

@Service("Wish")
public class WishServiceImpl implements WishService {

	private WishDAO wishDao;
	
	@Autowired
	public void setWishDao(WishDAO wishDao) {
		this.wishDao = wishDao;
	}

	@Override
	public List<Wish> wishListById(String user_id) {
		return wishDao.wishListById(user_id);
	}

	@Override
	public boolean wishRemove(String user_id, int product_num) {
		return wishDao.wishDelete(user_id, product_num);
	}

	@Override
	public boolean wishCreate(String user_id, int product_num) {
		return wishDao.wishInsert(user_id, product_num);
	}

	@Override
	public Wish wishCheck(String user_id, int product_num) {
		return wishDao.wishCheck(user_id, product_num);
	}

}
