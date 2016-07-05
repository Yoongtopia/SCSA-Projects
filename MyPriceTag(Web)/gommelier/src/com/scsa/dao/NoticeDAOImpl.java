package com.scsa.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.vo.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<Notice> selectNoticeList() {
		return sqlSessionTemplate.selectList("Notice.selectNoticeList");
	}

	@Override
	public Notice selectNoticeByNum(int notice_num) {
		return sqlSessionTemplate.selectOne("Notice.selectNoticeByNum", notice_num);
	}

	@Override
	public boolean noticeDeleteByNum(int notice_num) {
		return sqlSessionTemplate.delete("Notice.noticeDeleteByNum", notice_num) >0;
	}

	@Override
	public boolean noticeInsert(Notice notice) {		
		return sqlSessionTemplate.insert("Notice.noticeInsert", notice) >0;
	}

	@Override
	public boolean noticeUpdateByNum(int notice_num, String notice_title, String notice_content) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("notice_num", notice_num);
		map.put("notice_title", notice_title);
		map.put("notice_content", notice_content);
		return sqlSessionTemplate.update("Notice.noticeUpdateByNum", map) > 0;
		
	}

	@Override
	public int listCount() {
		return sqlSessionTemplate.selectOne("Notice.listCount");
	}

	@Override
	public List<Notice> selectNoticeListWithPage(int start_num, int end_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("start_num", start_num);
		map.put("end_num", end_num);
		return sqlSessionTemplate.selectList("Notice.selectNoticeListWithPage", map);
	}

}
