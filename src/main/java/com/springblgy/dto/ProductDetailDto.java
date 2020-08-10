package com.springblgy.dto;

public class ProductDetailDto {
	
	int prdseq;
	int uploaderseq;
	
	String title;
	String price;
	String info;
	String nickname;
	
	String insertdate;
	
	String date1;
	String date2;
	
	String image1;
	
	String hash;
	
	String xaxis;
	String yaxis;
	
	int view;
	int liked;
	
	int uploaderCheck;
	
	public ProductDetailDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ProductDetailDto(int prdseq, int uploaderseq, String nickname, String title, String price, String info, String insertdate, String date1,
			String date2, String image1, String hash,
			String xaxis, String yaxis, int view, int liked, int uploaderCheck) {
		super();
		this.prdseq = prdseq;
		this.uploaderseq = uploaderseq;
		this.nickname = nickname;
		this.title = title;
		this.price = price;
		this.info = info;
		this.insertdate = insertdate;
		this.date1 = date1;
		this.date2 = date2;
		this.image1 = image1;
		this.hash = hash;
		this.xaxis = xaxis;
		this.yaxis = yaxis;
		this.view = view;
		this.liked = liked;
		this.uploaderCheck = uploaderCheck;
	}
	

	public int getPrdseq() {
		return prdseq;
	}
	public void setPrdseq(int prdseq) {
		this.prdseq = prdseq;
	}
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getUploaderseq() {
		return uploaderseq;
	}
	public void setUploaderseq(int uploaderseq) {
		this.uploaderseq = uploaderseq;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
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
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
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

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getUploaderCheck() {
		return uploaderCheck;
	}

	public void setUploaderCheck(int uploaderCheck) {
		this.uploaderCheck = uploaderCheck;
	}


	public int getLiked() {
		return liked;
	}


	public void setLiked(int liked) {
		this.liked = liked;
	}
	
	

}
