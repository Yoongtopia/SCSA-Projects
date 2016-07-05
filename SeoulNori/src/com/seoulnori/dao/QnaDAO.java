package com.seoulnori.dao;

import java.util.List;

import com.seoulnori.vo.Qna;

public interface QnaDAO {
	
	boolean insertQna(Qna qna);
	boolean insertReply(Qna qna);
	boolean updateQna(Qna qna);
	boolean deleteQna(int eventQnaNum);
	Qna selectQnaByEventQnaNum(int eventQnaNum);
	List<Qna> selectQnaList();
	List<Qna> selectQnaListByEventId(String eventId);
	String selectManagerIdByEventId(String eventId);

}
