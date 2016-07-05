package com.scsa.vo;

public class Msg {
	private int msg_num;
	private String msg_content;
	private String msg_date;
	private String user_id_sender;
	private String user_id_receiver;
	private int msg_status;
	
	public Msg() {
		super();
	}
	
	public Msg(String msg_content, String user_id_sender,
			String user_id_receiver) {
		super();
		this.msg_content = msg_content;
		this.user_id_sender = user_id_sender;
		this.user_id_receiver = user_id_receiver;
	}

	public Msg(int msg_num, String msg_content, String msg_date,
			String user_id_sender, String user_id_receiver, int msg_status) {
		super();
		this.msg_num = msg_num;
		this.msg_content = msg_content;
		this.msg_date = msg_date;
		this.user_id_sender = user_id_sender;
		this.user_id_receiver = user_id_receiver;
		this.msg_status = msg_status;
	}

	public int getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}
	public String getUser_id_sender() {
		return user_id_sender;
	}
	public void setUser_id_sender(String user_id_sender) {
		this.user_id_sender = user_id_sender;
	}
	public String getUser_id_receiver() {
		return user_id_receiver;
	}
	public void setUser_id_receiver(String user_id_receiver) {
		this.user_id_receiver = user_id_receiver;
	}
	public int isMsg_status() {
		return msg_status;
	}
	public void setMsg_status(int msg_status) {
		this.msg_status = msg_status;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Msg [msg_num=");
		builder.append(msg_num);
		builder.append(", msg_content=");
		builder.append(msg_content);
		builder.append(", msg_date=");
		builder.append(msg_date);
		builder.append(", user_id_sender=");
		builder.append(user_id_sender);
		builder.append(", user_id_receiver=");
		builder.append(user_id_receiver);
		builder.append(", msg_status=");
		builder.append(msg_status);
		builder.append("]");
		return builder.toString();
	}

	
	
}