package com.springblgy.dto;

public class UserDto {
	int userseq;
	String nickname;
	String xaxis;
	String yaxis;
	
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserDto(int userseq, String nickname, String xaxis, String yaxis) {
		super();
		this.userseq = userseq;
		this.nickname = nickname;
		this.xaxis = xaxis;
		this.yaxis = yaxis;
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
}
