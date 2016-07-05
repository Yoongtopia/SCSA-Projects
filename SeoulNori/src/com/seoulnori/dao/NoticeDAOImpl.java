package com.seoulnori.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seoulnori.vo.Notice;


@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insertNotice(Notice notice) {
		return sqlSessionTemplate.insert("Notice.insertNotice", notice)>0;
	}

	@Override
	public boolean updateNotice(Notice notice) {
		return sqlSessionTemplate.update("Notice.updateNotice", notice)>0;
	}

	@Override
	public boolean deleteNotice(int noticeNum) {
		return sqlSessionTemplate.delete("Notice.deleteNotice", noticeNum)>0;
	}

	@Override
	public Notice selectNoticeByNoticeNum(int noticeNum) {
		return sqlSessionTemplate.selectOne("Notice.selectNoticeByNoticeNum", noticeNum);
	}

	@Override
	public List<Notice> selectNoticeList() {
		return sqlSessionTemplate.selectList("Notice.selectNoticeList");
	}

	@Override
	public List<Notice> searchNoticeByTitle(String noticeTitle) {
		return sqlSessionTemplate.selectList("Notice.searchNoticeByTitle", noticeTitle);
	}

	@Override
	public int selectPageCount() {
		return sqlSessionTemplate.selectOne("Notice.selectPageCount");
	}

	@Override
	public List<Notice> selectNoticeListWithPage(int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		return sqlSessionTemplate.selectList("Notice.selectNoticeListWithPage", map);
	}
	
}
