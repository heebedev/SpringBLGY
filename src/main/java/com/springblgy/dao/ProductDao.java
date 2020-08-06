package com.springblgy.dao;

import com.springblgy.dto.ProductDetailDto;


public interface ProductDao {
	
	//list select
	public ProductDetailDto productDetailDao(int prdseq, int myseq);
		

}
