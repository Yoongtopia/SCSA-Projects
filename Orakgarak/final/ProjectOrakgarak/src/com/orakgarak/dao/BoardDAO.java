package com.orakgarak.dao;

import java.util.List;

import com.orakgarak.vo.Board;

public interface BoardDAO {
	public boolean insert(Board board);
	public boolean update(Board board);
	public boolean delete(int boardNo);
	public List<Board> boardList();
	public Board boardView(int boardNo);
	int getNext();
	int getPrev();
	Board getNextPage(int boardNo);
	Board getPrevPage(int boardNo);
	int addHit(int boardNo);
	int getCount();
	List<Board> getList(int pageNum);
	List<Board> selectBoardTitleAndName(String search);

}
