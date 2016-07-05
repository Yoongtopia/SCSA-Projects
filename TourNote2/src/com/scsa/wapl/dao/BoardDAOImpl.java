package com.scsa.wapl.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scsa.wapl.entity.Board;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public void insertBoard(Board board) {
		sqlSessionTemplate.insert("Board.insertBoard", board);
	}
	
	@Override
	public void insertNotice(Board board) {
		sqlSessionTemplate.insert("Board.insertNotice", board);
	}

	@Override
	public void insertBoardAnswer(Board board) {
		sqlSessionTemplate.insert("Board.insertBoardAnswer", board);		
	}

	@Override
	public void updateBoard(Board board) {
		sqlSessionTemplate.update("Board.updateBoard", board);
	}

	@Override
	public void deleteBoard(int boardNum) {
		sqlSessionTemplate.update("Board.deleteBoard", boardNum);
	}
	
	@Override
	public void updateBoardCount(int boardNum) {
		sqlSessionTemplate.update("Board.updateBoardCount", boardNum);
	}

	@Override
	public List<Board> selectBoardListByCategory(String boardCategory, int startNo, int endNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardCategory", boardCategory);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		return sqlSessionTemplate.selectList("Board.selectBoardListByCategory", map);
	}

	@Override
	public Board selectBoard(int boardNum) {
		return sqlSessionTemplate.selectOne("Board.selectBoard", boardNum);
	}

	@Override
	public List<Board> selectBoardListById(String memberId) {
		return sqlSessionTemplate.selectList("Board.selectBoardListById", memberId);
	}

	@Override
	public List<Board> selectBoardListByTitle(String boardTitle) {
		return sqlSessionTemplate.selectList("Board.selectBoardListByTitle", boardTitle);
	}

	@Override
	public int listCount(String boardCategory) {
		return sqlSessionTemplate.selectOne("Board.listCount", boardCategory);
	}

	@Override
	public List<Board> selectBoardListByFaq(String boardCategory) {
		return sqlSessionTemplate.selectList("Board.selectBoardListByFaq", boardCategory);
	}

	
	public List<Board> selectBoardbyTitleOrWriter(String boardTitle){
		return sqlSessionTemplate.selectList("Board.selectBoardbyTitleOrWriter", boardTitle);
	}

}//end class