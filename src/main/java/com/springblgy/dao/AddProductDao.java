package com.springblgy.dao;

import java.io.File;

public interface AddProductDao {
	
	public void addItem(String userseq, String title, String price, String date1, String date2, String info, String productImage, String hash, String xaxis, String yaxis);
	
}
