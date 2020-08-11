package com.springblgy.dao;

import java.util.ArrayList;

import com.springblgy.dto.BorrowDto;
import com.springblgy.dto.ProductCommentDto;
import com.springblgy.dto.ProductDetailDto;


public interface ProductDao {
	
	//list select
	public ProductDetailDto productDetailDao(int prdseq, int userseq);
	
	public ArrayList<ProductCommentDto> productCMTDao(int prdseq, int userseq);
	public void updateViewDao(int prdseq);
	public void insertBorrowDao(int prdseq, int userseq, String date1, String date2);
	public ArrayList<BorrowDto> borrowListDao(int prdseq, int userseq);
	public void deleteBorrowDao(int rentseq);

}
