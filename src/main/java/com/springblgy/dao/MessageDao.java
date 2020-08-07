package com.springblgy.dao;

import java.util.ArrayList;

import com.springblgy.dto.MessageDto;
import com.springblgy.dto.ProductDetailDto;

public interface MessageDao {
	
	
	public void messageSend(String nickname, int userseq, String message);
	
	public ArrayList<MessageDto> messageList(int userseq);

}
