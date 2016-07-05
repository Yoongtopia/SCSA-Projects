package com.seoulnori.service;

import java.util.List;

import com.seoulnori.vo.Qna;

public interface QnaService {

	boolean addQna(Qna qna);
	boolean addReply(Qna qna);
	boolean updateQna(Qna qna);
	boolean deleteQna(int eventQnaNum);
	Qna findQnaByEventQnaNum(int eventQnaNum);
	List<Qna> findQnaList();
	List<Qna> findQnaListByEventId(String eventId);
	String findManagerIdByEventId(String eventId);

}
