package com.scsa.wapl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.scsa.wapl.dao.BoardDAO;
import com.scsa.wapl.entity.Board;

@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
@Repository
public class BoardServiceImpl implements BoardService {
	
	private BoardDAO boardDao;
	
	@Autowired
	public void setBoardDao(BoardDAO boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public void createBoard(Board board) {
		boardDao.insertBoard(board);
	}
	
	@Override
	public void createNotice(Board board) {
		boardDao.insertNotice(board);
	}
	
	@Override
	public void createBoardAnswer(Board board) {
		boardDao.insertBoardAnswer(board);		
	}

	@Override
	public void modifyBoard(Board board) {
		boardDao.updateBoard(board);
	}

	@Override
	public void removeBoard(int boardNum) {
		boardDao.deleteBoard(boardNum);
	}
	
	@Override
	public void modifyBoardCount(int boardNum) {
		boardDao.updateBoardCount(boardNum);
	}

	@Override
	public List<Board> findBoardListByCategory(String boardCategory, int startNo, int endNo){ 
		return boardDao.selectBoardListByCategory(boardCategory, startNo, endNo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
	@Override
	public Board findBoard(int boardNum) {
		boardDao.updateBoardCount(boardNum);
		return boardDao.selectBoard(boardNum);
	}

	@Override
	public List<Board> findBoardListById(String memberId) {
		return boardDao.selectBoardListById(memberId);
	}

	@Override
	public List<Board> findBoardListByTitle(String boardTitle) {
		return boardDao.selectBoardListByTitle(boardTitle);
	}

	@Override
	public int listCount(String boardCategory) {
		return boardDao.listCount(boardCategory);
	}

	@Override
	public List<Board> findBoardListByFaq(String boardCategory) {
		return boardDao.selectBoardListByFaq(boardCategory);
	}

	@Override
	public List<Board> selectBoardbyTitleOrWriter(String boardTitle) {
		return boardDao.selectBoardbyTitleOrWriter(boardTitle);
	}

}//end class