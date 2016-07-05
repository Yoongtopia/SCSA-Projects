package com.orakgarak.dao;

import java.util.List;

import com.orakgarak.vo.Reply;

public interface ReplyDAO {
	public boolean insert(Reply reply);
	public boolean update(Reply reply);
	public boolean delete(int replyNo);
	public List<Reply> replyList();
	List<Reply> selectReply(int boardNo);
	List<Reply> selectReplyNo(int replyNo);
	int getCount(int boardNo);
	List<Reply> getReplyList(int boardNo, int pageNum);
}
