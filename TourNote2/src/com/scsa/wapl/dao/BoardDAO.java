package com.scsa.wapl.dao;

import java.util.List;

import com.scsa.wapl.entity.Board;

public interface BoardDAO {

	public void insertBoard(Board board);
	public void insertNotice(Board board);	
	public void insertBoardAnswer(Board board);
	public void updateBoard(Board board);
	public void deleteBoard(int boardNum);
	public void updateBoardCount(int boardNum);
	public List<Board> selectBoardListByCategory(String boardCategory, int startNo, int endNo);
	public List<Board> selectBoardListByFaq(String boardCategory);
	public Board selectBoard(int boardNum);
	public List<Board> selectBoardListById(String memberId);
	public List<Board> selectBoardListByTitle(String boardTitle);
	
	public int listCount(String boardCategory);
	
	public List<Board> selectBoardbyTitleOrWriter(String boardTitle);
	
}//end interface