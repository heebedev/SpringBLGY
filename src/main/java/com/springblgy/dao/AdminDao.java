package com.springblgy.dao;

import java.util.ArrayList;

import com.springblgy.dto.AdminPrdDto;
import com.springblgy.dto.AdminUserDto;

public interface AdminDao {
	
		//메인 
		//어드민 메인 회원가입 수 카운트 
		public String AdminMainCountUser();
			
		//어드민 메인 상품등록 수 카운트 
		public String AdminMainCountProduct();
		
		//어드민 메인 빌린상품 카운트 
		public String AdminMainCountBorrow();

		
		//회원관리
		//회원정보 불러오기 
		public ArrayList<AdminUserDto> AdminUserList();
	
		//어드민 클릭한 회원정보 불러오기
		public AdminUserDto AdminViewUserInfo(String userseq);
		
		//어드민 회원정보 수정 
		public void AdminUserModify(String userseq, String newname, String newnickname, String newpw, String newbirthdate, String newemail, String newtelno, String newaddress, String newaddressdt);
		
		//회원정보 삭제 
		public void AdminUserDelete(String userseq); 
		
		
		//상품관리
		//상품 불러오기  AProductList
		public  ArrayList<AdminPrdDto> AdminProductList();
			
		//클릭한 상품 정보 불러오기 
		public AdminPrdDto AdminViewPrdInfo(String prdseq);

		//상품 정보 수정
		public void AdminPrdModify(String newtitle, String newprice, String newdate1, String newdate2, String newinfo, String newhash, String prdseq);
			
		//상품 삭제
		public void AdminProductDelete(String prdseq);
		
		//고객검색 결과 
		public ArrayList<AdminUserDto> AdminUserSearchList(String selection, String adminUserSearchText);
		
		//상품검색 결과 
		public ArrayList<AdminPrdDto> AdminProductSearchList(String selection, String adminProductSearchText);
	
	

}//-----
