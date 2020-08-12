package com.springblgy.dao;

import java.util.ArrayList;
import java.util.List;

import com.springblgy.dto.AdminPrdDto;
import com.springblgy.dto.AdminUserDto;
import com.springblgy.dto.PagingVO;

public interface AdminDao {
	
		//메인 
		//어드민 메인 회원가입 수 카운트 
		public String AdminMainCountUser();
			
		//어드민 메인 상품등록 수 카운트 
		public String AdminMainCountProduct();
		
		//어드민 메인 빌린상품 카운트 
		public String AdminMainCountBorrow();

		//회원관리
//		//회원정보 불러오기 -->페이징으로 변경
//		public ArrayList<AdminUserDto> AdminUserList();
		
		// 총 고객 수 카운트 
		public int countUserList();
		// 회원관리 페이징 + 게시글 조회
		public ArrayList<AdminUserDto> AdminUserList(PagingVO vo);
		
//		//고객검색 결과-->페이징으로 변경
//		public ArrayList<AdminUserDto> AdminUserSearchList(String selection, String adminUserSearchText);
		// 고객 검색 수 카운트 
		public int countUserSearchList(String selection, String adminUserSearchText);
		
		// 고객검색 + 페이징 					
		public ArrayList<AdminUserDto> AdminUserSearchList(String selection, String adminUserSearchText, PagingVO vo);
				
		//어드민 클릭한 회원정보 불러오기
		public AdminUserDto AdminViewUserInfo(String userseq);
		
		//어드민 회원정보 수정 
		public void AdminUserModify(String userseq, String newname, String newnickname, String newpw, String newbirthdate, String newemail, String newtelno, String newaddress, String newaddressdt);
		
		//회원정보 삭제 
		public void AdminUserDelete(String userseq); 
		
		
		//상품관리
//		//상품 불러오기  -->페이징으로 변경
//		public ArrayList<AdminPrdDto> AdminProductList();
		// 총 상품 갯수 카운트 
		public int countProductList();
		// 회원관리 페이징 + 게시글 조회
		public ArrayList<AdminPrdDto> AdminProductList(PagingVO vo);
		
		
//		//상품검색 결과 --> 페이징으로 변경
//		public ArrayList<AdminPrdDto> AdminProductSearchList(String selection, String adminProductSearchText);
		
		//상품검색 결과 + 페이징
		// 고객 검색 수 카운트 
		public int countProductSearchList(String selection, String adminProductSearchText);
						
		// 고객검색 + 페이징 					
		public ArrayList<AdminPrdDto> AdminProductSearchList(String selection, String adminProductSearchText, PagingVO vo);
								
			
		
			
		//클릭한 상품 정보 불러오기 
		public AdminPrdDto AdminViewPrdInfo(String prdseq);

		//상품 정보 수정
		public void AdminPrdModify(String newtitle, String newprice, String newdate1, String newdate2, String newinfo, String newhash, String prdseq);
			
		//상품 삭제
		public void AdminProductDelete(String prdseq);
		
		
		
		
		
		
		
		
		
		
		
		
		

}//-----
