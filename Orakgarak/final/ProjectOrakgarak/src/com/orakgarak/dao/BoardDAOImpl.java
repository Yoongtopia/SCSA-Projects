package com.orakgarak.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.orakgarak.vo.Board;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public boolean insert(Board board) {
		return sqlSessionTemplate.insert("Board.insertBoard", board)>0;
	}
	@Override
	public boolean update(Board board) {
		return sqlSessionTemplate.update("Board.updateBoard", board)>0;
	}
	@Override
	public boolean delete(int boardNo) {
		return sqlSessionTemplate.delete("Board.deleteBoard", boardNo)>0;
	}
	@Override
	public List<Board> boardList() {
		return sqlSessionTemplate.selectList("Board.selectBoardList");
	}
	@Override
	public Board boardView(int boardNo) {
		return sqlSessionTemplate.selectOne("Board.selectBoardDetail", boardNo);
	}
	@Override
	public int getNext(){
		return sqlSessionTemplate.selectOne("Board.next");
	}
	@Override
	public int getPrev(){
		return sqlSessionTemplate.selectOne("Board.prev");
	}
	@Override
	public int addHit(int boardNo){
		return sqlSessionTemplate.update("Board.hit", boardNo);
	}
	@Override
	public int getCount(){
		return sqlSessionTemplate.selectOne("Board.getCount");
	}
	@Override
	public List<Board> getList(int pageNum){
		return sqlSessionTemplate.selectList("Board.getList", pageNum);
	}
	@Override
	public List<Board> selectBoardTitleAndName(String search) {
		
		if(search != null && search.trim().length()!= 0){
			return sqlSessionTemplate.selectList("Board.selectBoardTitleAndName", search);
		}
		return null;
		
	}
	@Override
	public Board getNextPage(int boardNo) {
		return sqlSessionTemplate.selectOne("Board.nextPage", boardNo);
	}
	@Override
	public Board getPrevPage(int boardNo) {
		return sqlSessionTemplate.selectOne("Board.previousPage", boardNo);
	}
}
