package com.scse.dao;

import java.util.List;

import com.scse.entity.Notice;

public interface NoticeDAO {

	boolean insertNotice(Notice notice) throws Exception;
	boolean deleteNotice(int noticeNum) throws Exception;
	boolean updateNotice( String noticeContent, int noticeNum) throws Exception;
	
	
	List<Notice> listNotice(int groupNum) throws Exception;

	List<Notice> listTabNotice(String leaderId) throws Exception;
	
	Notice selectNotice(int noticeNum) throws Exception;
	
	List<Notice> searchNoticeByNoticeTitle(String noticeTitle) throws Exception;
	List<Notice> searchNoticeByNoticeContent(String noticeContent) throws Exception;
	
	
	
	
}
