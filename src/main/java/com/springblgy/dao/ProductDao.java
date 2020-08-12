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

	public void addComment(int prdseq, int userseq, String comment);
	
	public ProductCommentDto commentDetail(int cmtseq);
	
	public void commentRevision(int cmtseq, String comment);
	
	public void commentDelete(int cmtseq);
	
	public void productRevision(int prdseq, String title, String price, String date1, String date2, String hash, String info, String image);
	
	public void productDelete(int prdseq);
	
	public void insertBorrowDao(int prdseq, int userseq, String date1, String date2);
	
	public ArrayList<BorrowDto> borrowListDao(int prdseq, int userseq);
	
	public void deleteBorrowDao(int rentseq);
	
	public int borrowChkDao(int prdseq, String date1, String date2);


}
