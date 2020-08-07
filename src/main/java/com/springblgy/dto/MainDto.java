package com.springblgy.dto;

public class MainDto {
	
	private int prdseq;
	private int uploaderseq;
	private String image1;
	private String title;
	private String price;
	
	public MainDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MainDto(int prdseq, int uploaderseq, String image1, String title, String price) {
		super();
		this.prdseq = prdseq;
		this.uploaderseq = uploaderseq;
		this.image1 = image1;
		this.title = title;
		this.price = price;
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
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
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


}
