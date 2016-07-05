package com.scsa.wapl.entity;

public class TravelRecordReply {

	private int replyNum;
	private String replyWriter;
	private String replyCont;
	private String replyDate;
	private int recordNum;
	
	public TravelRecordReply() {
		super();
	}
	
	public TravelRecordReply(int replyNum, String replyWriter,
			String replyCont, String replyDate, int recordNum) {
		super();
		this.replyNum = replyNum;
		this.replyWriter = replyWriter;
		this.replyCont = replyCont;
		this.replyDate = replyDate;
		this.recordNum = recordNum;
	}	
	
	public TravelRecordReply(String replyWriter, String replyCont, int recordNum) {
		super();
		this.replyWriter = replyWriter;
		this.replyCont = replyCont;
		this.recordNum = recordNum;
	}

	public int getReplyNum() {
		return replyNum;
	}
	
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	
	public String getReplyWriter() {
		return replyWriter;
	}
	
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	
	public String getReplyCont() {
		return replyCont;
	}
	
	public void setReplyCont(String replyCont) {
		this.replyCont = replyCont;
	}
	
	public String getReplyDate() {
		return replyDate;
	}
	
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	
	public int getRecordNum() {
		return recordNum;
	}
	
	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TravelRecordReply [replyNum=");
		builder.append(replyNum);
		builder.append(", replyWriter=");
		builder.append(replyWriter);
		builder.append(", replyCont=");
		builder.append(replyCont);
		builder.append(", replyDate=");
		builder.append(replyDate);
		builder.append(", recordNum=");
		builder.append(recordNum);
		builder.append("]");
		return builder.toString();
	}
	
}