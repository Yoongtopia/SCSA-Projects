package com.seoulnori.service;

import java.util.List;

import com.seoulnori.vo.Notice;

public interface NoticeService {

	boolean addNotice(Notice notice);
	boolean updateNotice(Notice notice);
	boolean removeNotice(int noticeNum);
	Notice findNoticeByNoticeNum(int noticeNum);
	List<Notice> findNoticeList();
	List<Notice> findNoticeListWithPage(int startNo, int endNo);
	List<Notice> searchNoticeByTitle(String noticeTitle);
	int findPageCount();
}
