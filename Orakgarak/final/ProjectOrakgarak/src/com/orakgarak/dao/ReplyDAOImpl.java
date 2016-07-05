package com.orakgarak.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sun.security.action.PutAllAction;

import com.orakgarak.vo.Reply;


@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insert(Reply reply) {
		return sqlSessionTemplate.insert("Reply.insertReply", reply)>0;
	}

	@Override
	public boolean update(Reply reply) {
		return sqlSessionTemplate.update("Reply.updateReply", reply)>0;
	}

	@Override
	public boolean delete(int replyNo) {
		return sqlSessionTemplate.delete("Reply.deleteReply", replyNo)>0;
	}

	@Override
	public List<Reply> replyList() {
		return sqlSessionTemplate.selectList("Reply.selectReplyList");
	}

	@Override
	public List<Reply> selectReply(int boardNo) {
		return sqlSessionTemplate.selectList("Reply.selectReply", boardNo);
	}

	@Override
	public List<Reply> selectReplyNo(int replyNo) {
		return sqlSessionTemplate.selectList("Reply.selectReplyNo", replyNo);
	}

	@Override
	public int getCount(int boardNo) {
		return sqlSessionTemplate.selectOne("Reply.getCount", boardNo);
	}

	@Override
	public List<Reply> getReplyList(int boardNo, int pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("pageNum", pageNum);
		return sqlSessionTemplate.selectList("Reply.getReplyList", map);
	}

}
