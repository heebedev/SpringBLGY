package com.springblgy.dto;

public class LikeDto {

	private int likeseq;
	private int userseq;
	private int prdseq;
	private int liked;
	private int lastaction;
	
	
	//PrdDto 필드값 추가 
	private String title;
	private String price;
	private String image1;
	private String date1;
	private String date2;
	private int view;

	
	//Constructor 
	public LikeDto() {
		// TODO Auto-generated constructor stub
	}

	//전체 생성자
	public LikeDto(int likeseq, int userseq, int prdseq, int liked, int lastaction, String title, String price,
			String image1, String date1, String date2, int view) {
		super();
		this.likeseq = likeseq;
		this.userseq = userseq;
		this.prdseq = prdseq;
		this.liked = liked;
		this.lastaction = lastaction;
		this.title = title;
		this.price = price;
		this.image1 = image1;
		this.date1 = date1;
		this.date2 = date2;
		this.view = view;
	}

	// 나의관심목록
	public LikeDto(int prdseq, String title, String price, String image1, String date1, String date2, int view) {
		super();
		this.prdseq = prdseq;
		this.title = title;
		this.price = price;
		this.image1 = image1;
		this.date1 = date1;
		this.date2 = date2;
		this.view = view;
	}

	public int getLikeseq() {
		return likeseq;
	}

	public void setLikeseq(int likeseq) {
		this.likeseq = likeseq;
	}

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	public int getPrdseq() {
		return prdseq;
	}

	public void setPrdseq(int prdseq) {
		this.prdseq = prdseq;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getLastaction() {
		return lastaction;
	}

	public void setLastaction(int lastaction) {
		this.lastaction = lastaction;
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

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}
	
	
	
	
	
	
	
	
}//-----