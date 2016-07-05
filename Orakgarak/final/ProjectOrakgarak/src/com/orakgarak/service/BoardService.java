package com.orakgarak.service;

import java.util.List;

import com.orakgarak.vo.Board;

public interface BoardService {

	boolean create(Board board);
	boolean update(Board board);
	boolean remove(int boardNo);
	public List<Board> boardList();
	public Board boardView(int boardNo);
	int getNext();
	int getPrev();
	Board getNextPage(int boardNo);
	Board getPrevPage(int boardNo);
	int addHit(int boardNo);
	int getCount();
	List<Board> getList(int pageNum);
	List<Board> findBoardTitleAndName(String search);
}
