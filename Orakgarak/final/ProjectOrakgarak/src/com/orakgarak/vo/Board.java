package com.orakgarak.vo;

public class Board {

	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private int boardHits;
	private String boardCategory;
	private boolean boardNotice;
	private String userId;
	
	public Board() {
		super();
	}


	

	public Board(String boardWriter, String boardTitle, String boardContent,
			String boardCategory, String userId) {
		super();
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCategory = boardCategory;
		this.userId = userId;
	}




	public Board(String boardTitle, String boardContent, String boardCategory,
			String userId) {
		super();
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCategory = boardCategory;
		this.userId = userId;
	}



	public Board(int boardNo, String boardWriter, String boardTitle,
			String boardContent, String boardDate, int boardHits,
			String boardCategory, boolean boardNotice, String userId) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardHits = boardHits;
		this.boardCategory = boardCategory;
		this.boardNotice = boardNotice;
		this.userId = userId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardHits() {
		return boardHits;
	}

	public void setBoardHits(int boardHits) {
		this.boardHits = boardHits;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public boolean isBoardNotice() {
		return boardNotice;
	}

	public void setBoardNotice(boolean boardNotice) {
		this.boardNotice = boardNotice;
	}

	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter
				+ ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardDate=" + boardDate + ", boardHits="
				+ boardHits + ", boardCategory=" + boardCategory
				+ ", boardNotice=" + boardNotice + ", userId=" + userId + "]";
	}
	
		
}
