package com.scsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.PushDAO;
import com.scsa.vo.Product;
import com.scsa.vo.Push;
import com.scsa.vo.Tag;
@Service("Push")
public class PushServiceImpl implements PushService {

	private PushDAO pushDao;
	
	@Autowired
	public void setPushDao(PushDAO pushDao) {
		this.pushDao = pushDao;
	}

	@Override
	public boolean pushCreate(Push push) {
		return pushDao.pushInsert(push);
	}

	@Override
	public List<Push> pushListById(String user_id) {
		return pushDao.pushListById(user_id);
	}

	@Override
	public Push pushDetailByNum(int push_num) {
		return pushDao.pushDetailByNum(push_num);
	}

	@Override
	public boolean pushModifyByNum(int push_num, int push_price,
			int push_square, String[] push_tag) {

		for (String string : push_tag) {
		}
		boolean a = pushDao.pushUpdateByNum(push_num, push_price);
		boolean b = pushDao.pushSquareUpdateByNum(push_num, push_square);
		boolean c = pushDao.pushTagDeleteByNum(push_num);
		boolean d = pushDao.pushTagInsertByNum(push_num, push_tag);
		if (a && b) {
			return true;
		}		
		return false;
	}

	@Override
	public boolean pushRemoveByNum(int push_num) {
		return pushDao.pushDeleteByNum(push_num);
	}

	@Override
	public boolean pushStatusModify(int push_num, int push_status) {
		return pushDao.pushStatusUpdate(push_num, push_status);
	}
	
	@Override
	public List<Push> pushMegSend(Product product) {
		int product_square = product.getSquare_num();
		int product_price = product.getProduct_price();
		int product_num = product.getProduct_num();
		
		List<Tag> tagList = product.getTagList();
		final int SIZE = tagList.size();
		String[] tag = new String[SIZE];
		for (int i = 0; i < SIZE; i++) {
			tag[i] = tagList.get(i).getTag();
		}
		
		List<Push> sendList = pushDao.pushService(product_square, product_price, tag);		
		for (Push push : sendList) {
			push.setProduct_num(product_num);
		}
		return sendList;
	}

	@Override
	public boolean pushCheck(int push_check, int product_num, int push_num) {
		return pushDao.pushCheck(push_check, product_num, push_num);
	}


}
