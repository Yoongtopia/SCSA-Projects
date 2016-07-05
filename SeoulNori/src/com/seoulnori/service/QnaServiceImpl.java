package com.seoulnori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seoulnori.dao.QnaDAO;
import com.seoulnori.vo.Qna;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
	private QnaDAO qnaDAO;
	
	@Autowired
	public void setQnaDAO(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}

	@Override
	public boolean addQna(Qna qna) {
		return qnaDAO.insertQna(qna);
	}
	
	@Override
	public boolean addReply(Qna qna) {
		return qnaDAO.insertReply(qna);
	}

	@Override
	public boolean updateQna(Qna qna) {
		return qnaDAO.updateQna(qna);
	}

	@Override
	public boolean deleteQna(int eventQnaNum) {
		return qnaDAO.deleteQna(eventQnaNum);
	}

	@Override
	public Qna findQnaByEventQnaNum(int eventQnaNum) {
		return qnaDAO.selectQnaByEventQnaNum(eventQnaNum);
	}

	@Override
	public List<Qna> findQnaList() {
		return qnaDAO.selectQnaList();
	}
	
	@Override
	public List<Qna> findQnaListByEventId(String eventId){
		return qnaDAO.selectQnaListByEventId(eventId);
	}

	@Override
	public String findManagerIdByEventId(String eventId) {
		return qnaDAO.selectManagerIdByEventId(eventId);
	}

}
