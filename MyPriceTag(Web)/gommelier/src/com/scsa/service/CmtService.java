package com.scsa.service;

import java.util.List;

import com.scsa.vo.Cmt;

public interface CmtService {
	
	boolean cmtCreate (Cmt cmt);
	boolean cmtModify (String cmt_content, int cmt_num);
	boolean cmtRemove (int cmt_num);
	List<Cmt> cmtListByProductNum(int product_num);
	List<Cmt> cmtChildListByParentNum(int parent_num);
}
