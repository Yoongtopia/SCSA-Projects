package com.scsa.dao;

import java.util.List;

import com.scsa.vo.Notice;

public interface NoticeDAO {
	List<Notice> selectNoticeList();
	List<Notice> selectNoticeListWithPage(int start_num, int end_num);
	Notice selectNoticeByNum (int notice_num);
	boolean noticeDeleteByNum (int notice_num);
	boolean noticeInsert (Notice notice);
	boolean noticeUpdateByNum (int notice_num, String notice_title, String notice_content);
	int listCount();
}
