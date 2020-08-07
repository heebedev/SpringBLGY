package com.springblgy.dto;

public class AdminPrdDto {

	int prdseq;
	int uploaderseq;
	String title;
	String price;
	String date1;
	String date2;
	String info;
	String image1;
	String hash;
	String xaxis;
	String yaxis;
	String view;
	String name;
	String nickname;
	String email;
	
	public AdminPrdDto() {
		// TODO Auto-generated constructor stub
	}

	public AdminPrdDto(int prdseq, int uploaderseq, String title, String price, String date1, String date2, String info,
			String image1, String hash, String xaxis, String yaxis, String view, String name, String nickname,
			String email) {
		super();
		this.prdseq = prdseq;
		this.uploaderseq = uploaderseq;
		this.title = title;
		this.price = price;
		this.date1 = date1;
		this.date2 = date2;
		this.info = info;
		this.image1 = image1;
		this.hash = hash;
		this.xaxis = xaxis;
		this.yaxis = yaxis;
		this.view = view;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
	}

	public int getPrdseq() {
		return prdseq;
	}

	public void setPrdseq(int prdseq) {
		this.prdseq = prdseq;
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

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
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

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
}
