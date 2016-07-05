package com.scse.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scse.dao.NoticeDAO;
import com.scse.entity.Notice;

@Repository("noticeDao")
public class NoticeDAOImpl implements NoticeDAO {

	private SqlSessionTemplate sqlSessionTemplate;
		
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insertNotice(Notice notice) throws Exception {
		notice.setNoticeTitle("");
		return sqlSessionTemplate.insert("Notice.insertNotice", notice)>0;
	}

	@Override
	public boolean deleteNotice(int noticeNum) throws Exception {
		return sqlSessionTemplate.delete("Notice.deleteNotice", noticeNum)>0;
	}

	@Override
	public boolean updateNotice(String noticeContent, int noticeNum) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("noticeContent", noticeContent);
		map.put("noticeNum", noticeNum);
		System.out.println(noticeNum);
		
		System.out.println(map);
		
		return sqlSessionTemplate.update("Notice.updateNotice", map)>0;
	}

	@Override
	public List<Notice> listNotice(int groupNum)
			throws Exception {
		return sqlSessionTemplate.selectList("Notice.selectMyNotice", groupNum);
	}

	@Override
	public Notice selectNotice(int noticeNum) throws Exception {
		return sqlSessionTemplate.selectOne("Notice.selectNoticeByNoticeNum", noticeNum);
	}

	@Override
	public List<Notice> searchNoticeByNoticeTitle(String noticeTitle)
			throws Exception {
		return sqlSessionTemplate.selectList("Notice.selectNoticeByNoticeTitle",noticeTitle);
	}

	@Override
	public List<Notice> searchNoticeByNoticeContent(String noticeContent)
			throws Exception {
		return sqlSessionTemplate.selectList("Notice.selectNoticeByNoticeContent", noticeContent);
	}

	@Override
	public List<Notice> listTabNotice(String leaderId) throws Exception {
		return sqlSessionTemplate.selectList("Notice.selectMyNoticeTab", leaderId);
	}
}