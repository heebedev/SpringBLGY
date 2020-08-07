package com.springblgy.dao;

import com.springblgy.dto.UserDataDto;

public interface UserDataDao {
	
	public int checkUser(String email, String pw);

	public int pass_kakaoUser(String email);
	
	public UserDataDto getUserData(String email);
	
	public int lookUpAcc(String name, String telno);
	
	public String getEmail(String name, String telno);
	
	public int lookUpPw(String email, String telno);

	public void changePw(String pw, String email);
	
	public int checkEmail(String email);
	
	public int checkNickname(String nickname);
	
	public void uploadUserData(String email, String name, String nickname, String birthdate, String telno, String address, String addressdt, String xaxis, String yaxis, String pw);
	
}
