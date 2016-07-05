package com.orakgarak.vo;

public class Reply {

	private int replyNo;
	private String replyDate;
	private String replyContent;
	private String replyWriter;
	private String userId;
	private int boardNo;
	
	public Reply() {
		super();
	}

	
	/**
	 * 
	 * @param replyContent 댓글내용
	 * @param replyWriter 댓글작성자
	 * @param boardNo 게시물번호
	 */
	

	public Reply(String replyContent, String replyWriter, int boardNo) {
		super();
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.boardNo = boardNo;
	}





	public Reply(int replyNo, String replyDate, String replyContent,
			String replyWriter, String userId, int boardNo) {
		super();
		this.replyNo = replyNo;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.userId = userId;
		this.boardNo = boardNo;
	}

	



	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getboardNo() {
		return boardNo;
	}

	public void setboardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyDate=" + replyDate
				+ ", replyContent=" + replyContent + ", replyWriter="
				+ replyWriter + ", userId=" + userId + ", boardNo=" + boardNo
				+ "]";
	}
	
	
}
