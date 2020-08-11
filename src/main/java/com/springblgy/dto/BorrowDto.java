package com.springblgy.dto;

public class BorrowDto {
	
	int rentseq;
	int prdseq;
	int userseq;
	int  usercheck;

	String nickname;
	String date1;
	String date2;
	
	String insertdate;
	
	// PrdDto 필드값 추가 //import 안해서 )
	String title;
	String price;
	String image1;
	
	
	public BorrowDto() {
		// TODO Auto-generated constructor stub
	}
	


	public BorrowDto(int rentseq, int prdseq, int userseq, int usercheck, String nickname, String date1, String date2,
			String insertdate, String title, String price, String image1) {
		super();
		this.rentseq = rentseq;
		this.prdseq = prdseq;
		this.userseq = userseq;
		this.usercheck = usercheck;
		this.nickname = nickname;
		this.date1 = date1;
		this.date2 = date2;
		this.insertdate = insertdate;
		this.title = title;
		this.price = price;
		this.image1 = image1;
	}

	


	public BorrowDto(int rentseq, String nickname, String date1, String date2) {
		super();
		this.rentseq = rentseq;
		this.nickname = nickname;
		this.date1 = date1;
		this.date2 = date2;
	}



	//
//	public BorrowDto(int rentseq, int prdseq, int userseq, String date1, String date2, String insertdate) {
//		super();
//		this.rentseq = rentseq;
//		this.prdseq = prdseq;
//		this.userseq = userseq;
//		this.date1 = date1;
//		this.date2 = date2;
//		this.insertdate = insertdate;
//	}
//
//	public BorrowDto(int prdseq, String date1, String date2, String title, String price, String image1) {
//		super();
//		this.prdseq = prdseq;
//		this.date1 = date1;
//		this.date2 = date2;
//		this.title = title;
//		this.price = price;
//		this.image1 = image1;
//	}
	public int getUsercheck() {
		return usercheck;
	}

	public void setUsercheck(int usercheck) {
		this.usercheck = usercheck;
	}
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getRentseq() {
		return rentseq;
	}

	public void setRentseq(int rentseq) {
		this.rentseq = rentseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
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

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
	

}
