package com.springblgy.dao;

import java.util.ArrayList;

import com.springblgy.dto.ProductCommentDto;
import com.springblgy.dto.ProductDetailDto;


public interface ProductDao {
	
	//list select
	public ProductDetailDto productDetailDao(int prdseq, int userseq);
	
	public ArrayList<ProductCommentDto> productCMTDao(int prdseq, int userseq);
	public void updateViewDao(int prdseq);
		

}
