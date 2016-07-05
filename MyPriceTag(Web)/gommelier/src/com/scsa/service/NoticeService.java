package com.scsa.service;

import java.util.List;

import com.scsa.vo.Notice;

public interface NoticeService {
	
	List<Notice> findNoticeList();
	List<Notice> findNoticeListByPage(int start_num, int end_num);
	Notice findNoticeByNum (int notice_num);
	boolean noticeRemoveByNum (int notice_num);
	boolean noticeCreate (Notice notice);
	boolean noticeModifyByNum (int notice_num, String notice_title, String notice_content);
	int listCount();
}
