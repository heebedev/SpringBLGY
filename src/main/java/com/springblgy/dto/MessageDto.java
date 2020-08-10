package com.springblgy.dto;

public class MessageDto {
	
	int userseq;
	int textseq;
	String nickname;
	String nick_send;
	String nick_receive;
	String xaxis;
	String yaxis;
	String email;
	String date;
	String message;
	
	
	public MessageDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public MessageDto(int userseq, String nickname) {
		super();
		this.userseq = userseq;
		this.nickname = nickname;
	}





	public MessageDto(String nick_receive, String nick_send, String message, String date) {
		super();
		this.nick_send = nick_send;
		this.nick_receive = nick_receive;
		this.date = date;
		this.message = message;
	}




	public MessageDto(int textseq, String nick_receive, String nick_send, String message, String date) {
		super();
		this.textseq = textseq;
		this.nick_send = nick_send;
		this.nick_receive = nick_receive;
		this.date = date;
		this.message = message;
	}



	public String getNick_send() {
		return nick_send;
	}
	public void setNick_send(String nick_send) {
		this.nick_send = nick_send;
	}
	public String getNick_receive() {
		return nick_receive;
	}
	public void setNick_receive(String nick_receive) {
		this.nick_receive = nick_receive;
	}

	public int getUserseq() {
		return userseq;
	}
	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getXaxis() {
		return xaxis;
	}
	public void setXaxis(String xaxis) {
		this.xaxis = xaxis;
	}
	public String getYaxis() {
		return yaxis;
	}
	public void setYaxis(String yaxis) {
		this.yaxis = yaxis;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getTextseq() {
		return textseq;
	}
	public void setTextseq(int textseq) {
		this.textseq = textseq;
	}

}
