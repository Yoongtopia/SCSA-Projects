package com.seoulnori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.seoulnori.dao.NoticeDAO;
import com.seoulnori.vo.Notice;

@Service
@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDao;
	
	@Autowired
	public void setNoticeDao(NoticeDAO noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public boolean addNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public boolean updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public boolean removeNotice(int noticeNum) {
		return noticeDao.deleteNotice(noticeNum);
	}

	@Override
	public Notice findNoticeByNoticeNum(int noticeNum) {
		return noticeDao.selectNoticeByNoticeNum(noticeNum);
	}

	@Override
	public List<Notice> findNoticeList() {
		return noticeDao.selectNoticeList();
	}

	@Override
	public List<Notice> searchNoticeByTitle(String noticeTitle) {
		return noticeDao.searchNoticeByTitle(noticeTitle);
	}

	@Override
	public int findPageCount() {
		return noticeDao.selectPageCount();
	}

	@Override
	public List<Notice> findNoticeListWithPage(int startNo, int endNo) {
		return noticeDao.selectNoticeListWithPage(startNo, endNo);
	}

}
