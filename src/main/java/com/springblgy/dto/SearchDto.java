package com.springblgy.dto;


public class SearchDto {
	
	private int userseq;
	private int prdseq;
	private int uploaderseq;
	private String title;
	private String price;
	private String date1;
	private String date2;
	private String image1;
	private String liked2;
	private int liked;
	private int view;
	private int distance;
	private String xaxis;
	private String yaxis;

	public SearchDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public SearchDto(int userseq, int prdseq, int uploaderseq, String title, String price, String date1, String date2,
			String image1, String liked2, int liked, int view, int distance, String xaxis, String yaxis) {
		super();
		this.userseq = userseq;
		this.prdseq = prdseq;
		this.uploaderseq = uploaderseq;
		this.title = title;
		this.price = price;
		this.date1 = date1;
		this.date2 = date2;
		this.image1 = image1;
		this.liked2 = liked2;
		this.liked = liked;
		this.view = view;
		this.distance = distance;
		this.xaxis = xaxis;
		this.yaxis = yaxis;
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

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getLiked2() {
		return liked2;
	}

	public void setLiked2(String liked2) {
		this.liked2 = liked2;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
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
