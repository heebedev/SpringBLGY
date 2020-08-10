package com.springblgy.dao;

import java.util.ArrayList;

import com.springblgy.dto.MainDto;
import com.springblgy.dto.SearchDto;

public interface MainDao {
	
	public ArrayList<MainDto> mainDao();

	public ArrayList<SearchDto> searchDao(String Keyword, String Startdate1, String Finishdate2, String selection, int userseq, int distance, String xaxis, String yaxis);
	public void likeInsert(int userseq, int prdseq);


}
