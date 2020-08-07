package com.springblgy.dto;


public class AdminUserDto {

	UserDto userdto = new UserDto();
	
	//field
	int userseq;
	String email;
	String name;
	String nickname;
	String birthdate;
	String telno;
	String address;
	String addressdt;
	String xaxis;
	String yaxis;
	String pw;
	String insertdate;
	
	
	//상품등록 수 변수 추가 시 
	int countPrd;
	
	//constructor
	public AdminUserDto() {
		// TODO Auto-generated constructor stub
	}

	// 기본 field 생성자
	public AdminUserDto(int userseq, String email, String name, String nickname, String birthdate, String telno,
			String address, String addressdt, String xaxis, String yaxis, String pw, String insertdate) {
		super();
		this.userseq = userseq;
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.telno = telno;
		this.address = address;
		this.addressdt = addressdt;
		this.xaxis = xaxis;
		this.yaxis = yaxis;
		this.pw = pw;
		this.insertdate = insertdate;
	}

	// 상품등록 수 변수 추가 전체 생성자
	public AdminUserDto(int userseq, String email, String name, String nickname, String birthdate, String telno,
			String address, String addressdt, String xaxis, String yaxis, String pw, String insertdate, int countPrd) {
		super();
		this.userseq = userseq;
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.telno = telno;
		this.address = address;
		this.addressdt = addressdt;
		this.xaxis = xaxis;
		this.yaxis = yaxis;
		this.pw = pw;
		this.insertdate = insertdate;
		this.countPrd = countPrd;
	}

	public AdminUserDto(int userseq, String name, String nickname, int countPrd) {
		super();
		this.userseq = userseq;
		this.name = name;
		this.nickname = nickname;
		this.countPrd = countPrd;
	}

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressdt() {
		return addressdt;
	}

	public void setAddressdt(String addressdt) {
		this.addressdt = addressdt;
	}

	public String getXaxis() {
		return xaxis;
	}

	public void setXaxis(String xaxis) {
		this.xaxis = xaxis;
	}

	public String getTaxis() {
		return yaxis;
	}

	public void setTaxis(String yaxis) {
		this.yaxis = yaxis;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public int getCountPrd() {
		return countPrd;
	}

	public void setCountPrd(int countPrd) {
		this.countPrd = countPrd;
	}
	
	
	
	
	
	
}//---------
