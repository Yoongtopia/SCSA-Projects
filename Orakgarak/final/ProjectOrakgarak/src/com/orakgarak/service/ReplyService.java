package com.orakgarak.service;

import java.util.List;

import com.orakgarak.vo.Board;
import com.orakgarak.vo.Reply;

public interface ReplyService {

	boolean create(Reply reply);
	boolean update(Reply reply);
	boolean remove(int replyNo);
	List<Reply> replyList();
	List<Reply> findReply(int boardNo);
	List<Reply> findReplyNo(int replyNo);
	int getCount(int boardNo);
	List<Reply> getReplyList(int boardNo, int pageNum);
}
