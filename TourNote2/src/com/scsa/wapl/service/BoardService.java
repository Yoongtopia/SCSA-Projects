package com.scsa.wapl.service;

import java.util.List;

import com.scsa.wapl.entity.Board;

public interface BoardService {

	public void createBoard(Board board);
	public void createNotice(Board board);
	public void createBoardAnswer(Board board);
	public void modifyBoard(Board board);
	public void removeBoard(int boardNum);
	public void modifyBoardCount(int boardNum);
	public List<Board> findBoardListByCategory(String boardCategory, int startNo, int endNo);
	public List<Board> findBoardListByFaq(String boardCategory);
	public Board findBoard(int boardNum);
	public List<Board> findBoardListById(String memberId);
	public List<Board> findBoardListByTitle(String boardTitle);
	
	public int listCount(String boardCategory);
	public List<Board> selectBoardbyTitleOrWriter(String boardTitle);


}//end interface