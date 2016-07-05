package com.scsa.dao;

import java.util.List;

import com.scsa.vo.Cmt;

public interface CmtDAO {
	boolean cmtInsert (Cmt cmt);
	boolean cmtUpdate (String cmt_content, int cmt_num);
	boolean cmtDelete (int cmt_num);
	List<Cmt> cmtList (int product_num);
	List<Cmt> cmtChildListByParentNum (int parent_num);
}
