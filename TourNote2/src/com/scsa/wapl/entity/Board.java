package com.scsa.wapl.entity;

public class Board {

	private int boardNum;
	private String boardCategory;
	private String boardWriter;
	private String boardTitle;
	private String boardCont;
	private String boardDate;
	private int boardHit;
	private String boardStatus;
	private int boardParentNum;
	private int depth;
	private int level;
	
	public Board() {
		super();
	}
	
	public Board(int boardNum, String boardCategory, String boardWriter,
			String boardTitle, String boardCont, String boardDate,
			int boardHit, String boardStatus, int boardParentNum, int depth,
			int level) {
		super();
		this.boardNum = boardNum;
		this.boardCategory = boardCategory;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardCont = boardCont;
		this.boardDate = boardDate;
		this.boardHit = boardHit;
		this.boardStatus = boardStatus;
		this.boardParentNum = boardParentNum;
		this.depth = depth;
		this.level = level;
	}


	public Board(String boardCategory, String boardWriter, String boardTitle,
			String boardCont, String boardStatus) {
		super();
		this.boardCategory = boardCategory;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardCont = boardCont;
		this.boardStatus = boardStatus;
	}

	public Board(int boardNum, String boardCategory, String boardWriter,
			String boardTitle, String boardCont, String boardStatus) {
		super();
		this.boardNum = boardNum;
		this.boardCategory = boardCategory;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardCont = boardCont;
		this.boardStatus = boardStatus;
	}

	public Board(int boardNum, String boardCategory, String boardWriter,
			String boardTitle, String boardCont, String boardDate,
			int boardHit, String boardStatus, int boardParentNum, int depth) {
		super();
		this.boardNum = boardNum;
		this.boardCategory = boardCategory;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardCont = boardCont;
		this.boardDate = boardDate;
		this.boardHit = boardHit;
		this.boardStatus = boardStatus;
		this.boardParentNum = boardParentNum;
		this.depth = depth;
	}

	public int getBoardNum() {
		return boardNum;
	}
	
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	
	public String getBoardCategory() {
		return boardCategory;
	}
	
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	
	public String getBoardWriter() {
		return boardWriter;
	}
	
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	
	public String getBoardTitle() {
		return boardTitle;
	}
	
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	public String getBoardCont() {
		return boardCont;
	}
	
	public void setBoardCont(String boardCont) {
		this.boardCont = boardCont;
	}
	
	public String getBoardDate() {
		return boardDate;
	}
	
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	
	public int getBoardHit() {
		return boardHit;
	}
	
	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}
	
	public String getBoardStatus() {
		return boardStatus;
	}
	
	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getBoardParentNum() {
		return boardParentNum;
	}
	
	public void setBoardParentNum(int boardParentNum) {
		this.boardParentNum = boardParentNum;
	}
	
	public int getDepth() {
		return depth;
	}
	
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Board [boardNum=");
		builder.append(boardNum);
		builder.append(", boardCategory=");
		builder.append(boardCategory);
		builder.append(", boardWriter=");
		builder.append(boardWriter);
		builder.append(", boardTitle=");
		builder.append(boardTitle);
		builder.append(", boardCont=");
		builder.append(boardCont);
		builder.append(", boardDate=");
		builder.append(boardDate);
		builder.append(", boardHit=");
		builder.append(boardHit);
		builder.append(", boardStatus=");
		builder.append(boardStatus);
		builder.append(", boardParentNum=");
		builder.append(boardParentNum);
		builder.append(", depth=");
		builder.append(depth);
		builder.append(", level=");
		builder.append(level);
		builder.append("]");
		return builder.toString();
	}

	
	
}