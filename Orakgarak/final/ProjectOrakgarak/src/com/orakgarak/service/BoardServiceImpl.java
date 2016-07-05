package com.orakgarak.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.orakgarak.dao.BoardDAO;
import com.orakgarak.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	private BoardDAO boardDao;
	@Autowired	
	public void setBoardDao(BoardDAO boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public boolean create(Board board) {
		return boardDao.insert(board);
	}

	@Override
	public boolean update(Board board) {
		return boardDao.update(board);
	}

	@Override
	public boolean remove(int boardNo) {
		return boardDao.delete(boardNo);
	}

	@Override
	public List<Board> boardList() {
		return boardDao.boardList();
	}

	@Override
	public Board boardView(int boardNo) {
		return boardDao.boardView(boardNo);
	}
	@Override
	public int getNext(){
		return boardDao.getNext();
	}
	@Override
	public int getPrev(){
		return boardDao.getPrev();
	}
	@Override
	public int addHit(int boardNo){
		return boardDao.addHit(boardNo);
	}
	@Override
	public int getCount(){
		return boardDao.getCount();
	}
	@Override
	public List<Board> getList(int pageNum){
		return boardDao.getList(pageNum);
	}
	@Override
	public List<Board> findBoardTitleAndName(String search) {
		return boardDao.selectBoardTitleAndName(search);
	}

	@Override
	public Board getNextPage(int boardNo) {
		return boardDao.getNextPage(boardNo);
	}

	@Override
	public Board getPrevPage(int boardNo) {
		return boardDao.getPrevPage(boardNo);
	}
}
