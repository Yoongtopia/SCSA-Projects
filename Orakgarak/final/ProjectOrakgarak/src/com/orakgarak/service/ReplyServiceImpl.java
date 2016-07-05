package com.orakgarak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.ReplyDAO;
import com.orakgarak.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	private ReplyDAO replyDao;
	@Autowired
	public void setReplyDao(ReplyDAO replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public boolean create(Reply reply) {
		return replyDao.insert(reply);
	}

	@Override
	public boolean update(Reply reply) {
		return replyDao.update(reply);
	}

	@Override
	public boolean remove(int replyNo) {
		return replyDao.delete(replyNo);
	}

	@Override
	public List<Reply> replyList() {
		return replyDao.replyList();
	}

	@Override
	public List<Reply> findReply(int boardNo) {
		return replyDao.selectReply(boardNo);
	}

	@Override
	public List<Reply> findReplyNo(int replyNo) {
		return replyDao.selectReplyNo(replyNo);
	}

	@Override
	public int getCount(int boardNo) {
		return replyDao.getCount(boardNo);
	}

	@Override
	public List<Reply> getReplyList(int boardNo, int pageNum) {
		return replyDao.getReplyList(boardNo,pageNum);
	}

}
