package com.scsa.service;

import java.util.List;
import com.scsa.vo.Tag;

public interface TagService {
	
	String[] tagAutoComplete ();
	List<Tag> findTagListByTag (String[] tag);
	List<Tag> findTagListBySquare (int square_num);
	
}
