package com.springblgy.dao;

import java.util.ArrayList;

import com.springblgy.dto.MainDto;
import com.springblgy.dto.SearchDto;

public interface MainDao {
	
	public ArrayList<MainDto> mainDao();
	public ArrayList<SearchDto> searchDao(String Keyword, String Startdate1, String Finishdate2, int userseq);
	public ArrayList<SearchDto> searchDao2(String Keyword, String Startdate1, String Finishdate2, int userseq);
	public void likeInsert(int userseq, int prdseq, int liked);
	public void likeDelete(int userseq, int prdseq, int liked);
	
	
}
