package com.scse.entity;

public class Message {

	private int msNum;
	private String msTitle;
	private String msContent;
	private String msDate;
	private String msWriter;
	private String msTarget;
	
	private char msRead;
	
	public int getMsNum() {
		return msNum;
	}
	public void setMsNum(int msNum) {
		this.msNum = msNum;
	}
	public String getMsTitle() {
		return msTitle;
	}
	public void setMsTitle(String msTitle) {
		this.msTitle = msTitle;
	}
	public String getMsContent() {
		return msContent;
	}
	public void setMsContent(String msContent) {
		this.msContent = msContent;
	}
	public String getMsDate() {
		return msDate;
	}
	public void setMsDate(String msDate) {
		this.msDate = msDate;
	}
	public String getMsWriter() {
		return msWriter;
	}
	public void setMsWriter(String msWriter) {
		this.msWriter = msWriter;
	}
	public String getMsTarget() {
		return msTarget;
	}
	public void setMsTarget(String msTarget) {
		this.msTarget = msTarget;
	}
	public Message() {
		super();
	}
	public char getMsRead() {
		return msRead;
	}
	public void setMsRead(char msRead) {
		this.msRead = msRead;
	}
	public Message(int msNum, String msTitle, String msContent, String msDate,
			String msWriter, String msTarget, char msRead) {
		super();
		this.msNum = msNum;
		this.msTitle = msTitle;
		this.msContent = msContent;
		this.msDate = msDate;
		this.msWriter = msWriter;
		this.msTarget = msTarget;
		this.msRead = msRead;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Message [msNum=");
		builder.append(msNum);
		builder.append(", msTitle=");
		builder.append(msTitle);
		builder.append(", msContent=");
		builder.append(msContent);
		builder.append(", msDate=");
		builder.append(msDate);
		builder.append(", msWriter=");
		builder.append(msWriter);
		builder.append(", msTarget=");
		builder.append(msTarget);
		builder.append(", msRead=");
		builder.append(msRead);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
	
}
