package com.scse.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scse.dao.NoticeDAO;
import com.scse.entity.Notice;
import com.scse.service.NoticeService;

@Component("notice")
public class NoticeServiceImpl implements NoticeService {

	NoticeDAO noticeDao;
	
	@Autowired
	public void setNoticeDao(NoticeDAO noticeDao) {
		this.noticeDao = noticeDao;
	}

	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addNotice(Notice notice) throws Exception {
		return noticeDao.insertNotice(notice);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean removeNotice(int noticeNum) throws Exception {
		return noticeDao.deleteNotice(noticeNum);
	}

	@Override
	public boolean modifyNotice(String noticeContent, int noticeNum) throws Exception {
		return noticeDao.updateNotice(noticeContent, noticeNum);
	}

	@Override
	public List<Notice> viewNotice(int groupNum)
			throws Exception {
		return noticeDao.listNotice(groupNum);
	}

	@Override
	public Notice viewNoticeByNoticeNum(int noticeNum) throws Exception {
		return noticeDao.selectNotice(noticeNum);
	}

	@Override
	public List<Notice> findNoticeByTitle(String noticeTitle)
			throws Exception {
		return noticeDao.searchNoticeByNoticeTitle(noticeTitle);
	}

	@Override
	public List<Notice> findNoticeByContent(String noticeContent)
			throws Exception {
		return noticeDao.searchNoticeByNoticeContent(noticeContent);
	}

	@Override
	public List<Notice> viewTabNotice(String leaderId) throws Exception {
		return noticeDao.listTabNotice(leaderId);
	}
}