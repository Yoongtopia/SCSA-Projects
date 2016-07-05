package com.scse.service;

import java.util.List;

import com.scse.entity.Notice;

public interface NoticeService {

	boolean addNotice(Notice notice) throws Exception;
	boolean removeNotice(int noticeNum) throws Exception;
	boolean modifyNotice(String noticeContent, int noticeNum) throws Exception;
	
	
	List<Notice> viewNotice(int groupNum) throws Exception;
	List<Notice> viewTabNotice(String leaderId) throws Exception;
	
	Notice viewNoticeByNoticeNum(int noticeNum) throws Exception;
	List<Notice> findNoticeByTitle(String noticeTitle) throws Exception;
	List<Notice> findNoticeByContent(String noticeContent) throws Exception;
	
	
	
}
