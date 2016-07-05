package com.scsa.dao;

import java.util.List;

import com.scsa.vo.Tag;

public interface TagDAO {
	List<Tag> tagAutoComplete ();
	List<Tag> selectTagListByTag (String[] tag);
	List<Tag> selectTagListBySquare (int square_num);
}
