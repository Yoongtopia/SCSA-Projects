package com.scsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scsa.dao.NoticeDAO;
import com.scsa.vo.Notice;

@Service("notice")
public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDao;
	
	@Autowired
	public void setNoticeDao(NoticeDAO noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public List<Notice> findNoticeList() {
		return noticeDao.selectNoticeList();
	}

	@Override
	public Notice findNoticeByNum(int notice_num) {
		return noticeDao.selectNoticeByNum(notice_num);
	}

	@Override
	public boolean noticeRemoveByNum(int notice_num) {
		return noticeDao.noticeDeleteByNum(notice_num);
	}	

	@Override
	public boolean noticeCreate(Notice notice) {
		return noticeDao.noticeInsert(notice);
	}

	@Override
	public boolean noticeModifyByNum(int notice_num, String notice_title, String notice_content) {
		return noticeDao.noticeUpdateByNum(notice_num, notice_title, notice_content);
	}

	@Override
	public int listCount() {
		return noticeDao.listCount();
	}

	@Override
	public List<Notice> findNoticeListByPage(int start_num, int end_num) {
		return noticeDao.selectNoticeListWithPage(start_num, end_num);
	}

}
