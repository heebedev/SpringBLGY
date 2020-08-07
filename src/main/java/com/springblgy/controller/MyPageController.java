package com.springblgy.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springblgy.dao.MyPageDao;

@Controller
public class MyPageController {
	
	@Autowired 
	private SqlSession sqlSession;
	
	//등록 상품 목록
	@RequestMapping("/MyProductList.bill")
	public String MyProductList(HttpServletRequest request, Model model) {
		MyPageDao myPageDao = sqlSession.getMapper(MyPageDao.class);
		model.addAttribute("MyProductList", myPageDao.MyProductList(request.getParameter("userseq")));
		return "myPage/myProductList";
	}
	
	//대여 상품 목록
	@RequestMapping("/MyBorrowList.bill")
	public String MyBorrowList(HttpServletRequest request, Model model) {
		MyPageDao myPageDao = sqlSession.getMapper(MyPageDao.class);
		model.addAttribute("MyBorrowList", myPageDao.MyBorrowList(request.getParameter("userseq")));
		return "myPage/myBorrowList";
	}

	//관심 상품 목록
	@RequestMapping("/MyInterestList.bill")
	public String MyLikeList(HttpServletRequest request, Model model) {
		MyPageDao myPageDao = sqlSession.getMapper(MyPageDao.class); 
		model.addAttribute("MyLikeList", myPageDao.MyLikeList(request.getParameter("userseq")));
		return "myPage/myInterestList";
	}
	
	

	

}
