package com.scsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.CmtDAO;
import com.scsa.vo.Cmt;

@Service("cmt")
public class CmtServiceImpl implements CmtService {
	
	private CmtDAO cmtDao;
	
	@Autowired
	public void setCmtDao(CmtDAO cmtDao) {
		this.cmtDao = cmtDao;
	}
	
	@Override
	public boolean cmtCreate(Cmt cmt) {
		return cmtDao.cmtInsert(cmt);
	}

	@Override
	public boolean cmtModify(String cmt_content, int cmt_num) {
		return cmtDao.cmtUpdate(cmt_content, cmt_num);
	}

	@Override
	public boolean cmtRemove(int cmt_num) {
		return cmtDao.cmtDelete(cmt_num);
	}

	@Override
	public List<Cmt> cmtListByProductNum(int product_num) {
		return cmtDao.cmtList(product_num);
	}

	@Override
	public List<Cmt> cmtChildListByParentNum(int parent_num) {
		return cmtDao.cmtChildListByParentNum(parent_num);
	}

}
