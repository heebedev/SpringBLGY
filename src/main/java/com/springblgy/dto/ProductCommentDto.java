package com.springblgy.dto;

public class ProductCommentDto {
	
	int cmtseq;
	int prdseq;
	int userseq;
	String nickname;
	String comment;
	String insertdate;
	int userCheck;
	
	
	public ProductCommentDto() {
		// TODO Auto-generated constructor stub
	}


	
	public ProductCommentDto(int cmtseq,  int userseq, String nickname, String comment, String insertdate, int userCheck) {
		super();
		this.cmtseq = cmtseq;
		this.userseq = userseq;
		this.nickname = nickname;
		this.comment = comment;
		this.insertdate = insertdate;
		this.userCheck = userCheck;

	}
	
	public ProductCommentDto(int cmtseq, int prdseq, String comment, String insertdate) {
		super();
		this.cmtseq = cmtseq;
		this.prdseq = prdseq;
		this.comment = comment;
		this.insertdate = insertdate;
	}
	
	
	


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}


	public int getCmtseq() {
		return cmtseq;
	}



	public void setCmtseq(int cmtseq) {
		this.cmtseq = cmtseq;
	}



	public int getPrdseq() {
		return prdseq;
	}



	public void setPrdseq(int prdseq) {
		this.prdseq = prdseq;
	}



	public int getUserseq() {
		return userseq;
	}



	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}



	public int getUserCheck() {
		return userCheck;
	}



	public void setUserCheck(int userCheck) {
		this.userCheck = userCheck;
	}

}
