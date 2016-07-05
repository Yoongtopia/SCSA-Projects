package com.scsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.TagDAO;
import com.scsa.vo.Tag;
@Service("Tag")
public class TagServiceImpl implements TagService {

	private TagDAO tagDao;
	
	@Autowired
	public void setTagDao(TagDAO tagDao) {
		this.tagDao = tagDao;
	}

	@Override
	public String[] tagAutoComplete() {
		List<Tag> list =  tagDao.tagAutoComplete();
		final int SIZE = list.size();
		String[] tag = new String[SIZE];
		for (int i = 0; i < SIZE; i++) {
			 tag[i] = list.get(i).getTag();
		}
		return tag;
	}

	@Override
	public List<Tag> findTagListByTag(String[] tag) {
		return tagDao.selectTagListByTag(tag);
	}

	@Override
	public List<Tag> findTagListBySquare(int square_num) {
		return tagDao.selectTagListBySquare(square_num);
	}

}
