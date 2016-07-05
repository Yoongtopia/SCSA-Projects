package com.seoulnori.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seoulnori.vo.Qna;

@Repository("qnaDAO")
public class QnaDAOImpl implements QnaDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public boolean insertQna(Qna qna) {
		return sqlSessionTemplate.insert("Qna.insertQna", qna) > 0;
	}
	
	@Override
	public boolean insertReply(Qna qna) {
		return sqlSessionTemplate.insert("Qna.insertReply", qna) > 0;
	}

	@Override
	public boolean updateQna(Qna qna) {
		return sqlSessionTemplate.update("Qna.updateQna", qna) > 0;
	}

	@Override
	public boolean deleteQna(int eventQnaNum) {
		return sqlSessionTemplate.delete("Qna.deleteQna", eventQnaNum) > 0;
	}

	@Override
	public Qna selectQnaByEventQnaNum(int eventQnaNum) {
		return sqlSessionTemplate.selectOne("Qna.selectQnaByEventQnaNum", eventQnaNum);
	}

	@Override
	public List<Qna> selectQnaList() {
		return sqlSessionTemplate.selectList("Qna.selectQnaList");
	}
	
	@Override
	public List<Qna> selectQnaListByEventId(String eventId){
		return sqlSessionTemplate.selectList("Qna.selectQnaListByEventId", eventId);
	}

	@Override
	public String selectManagerIdByEventId(String eventId) {
		return sqlSessionTemplate.selectOne("Qna.selectManagerIdByEventId", eventId);
	}
}
