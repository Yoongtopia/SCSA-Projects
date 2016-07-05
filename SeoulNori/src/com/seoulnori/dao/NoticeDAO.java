package com.seoulnori.dao;

import java.util.List;


import com.seoulnori.vo.Notice;



public interface NoticeDAO {
	
	
	
	boolean insertNotice(Notice notice);
	boolean updateNotice(Notice notice);
	boolean deleteNotice(int noticeNum);
	Notice selectNoticeByNoticeNum(int noticeNum);
	List<Notice> selectNoticeList();
	List<Notice> selectNoticeListWithPage(int startNo, int endNo);
	List<Notice> searchNoticeByTitle(String noticeTitle);
	int selectPageCount();
}
