package com.springblgy.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springblgy.dao.MainDao;
import com.springblgy.dto.MainDto;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession; // 해줘야함***
	
	@RequestMapping("/mainForm.bill")
	public String mainPage(HttpServletRequest request, Model model) {
		int userseq = -1;
		if(request.getParameter("userseq")==null || request.getParameter("userseq").equals("0") || request.getParameter("userseq").equals("null")) {
			
		}
		else {
			userseq = Integer.parseInt(request.getParameter("userseq"));
		}
		request.setAttribute("userseq", userseq);
		System.out.println(userseq);
		MainDao dao = sqlSession.getMapper(MainDao.class);
		ArrayList<MainDto> maindtios = dao.mainDao();
		request.setAttribute("MainList", maindtios);
		
		return "mainPage/mainForm";
	}
	
	@RequestMapping("/searchAfter.bill")
	public String searchAfter(HttpServletRequest request, Model model) {
		MainDao dao = sqlSession.getMapper(MainDao.class);
		
		String keyword = request.getParameter("search");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String select = request.getParameter("selectsearch");
		
		if(date1.length()<5) {
			date1 = "2100-12-12";
		}if(date2.length()<5) {
			date2 = "1945-08-15";
		}			
		
		int userseq = -1;
		
		if(request.getParameter("userseq")==null || request.getParameter("userseq").equals("0") || request.getParameter("userseq").equals("null")) {
			
		}
		else {
			userseq = Integer.parseInt(request.getParameter("userseq"));
		}
		request.setAttribute("userseq", userseq);
		System.out.println(userseq);
		if(select.equals("조회수순")) {
			request.setAttribute("SearchList", dao.searchDao(keyword, date1, date2, userseq));
		}else {
			request.setAttribute("SearchList", dao.searchDao2(keyword, date1, date2, userseq));
		}
		
		return "mainPage/searchAfter";
	}
	
	@RequestMapping("/like.bill")
	public String like(HttpServletRequest request, Model model) {
		MainDao dao = sqlSession.getMapper(MainDao.class);
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		int liked = Integer.parseInt(request.getParameter("liked"));
		String search = request.getParameter("search");
		request.setAttribute("search", search); 
		request.setAttribute("userseq", userseq); 
		if(userseq == 0 || userseq == -1) {
			
		}else {
			if(liked == 1) {
				dao.likeDelete(userseq, prdseq, liked);
			}else {
				dao.likeInsert(userseq, prdseq, liked);
			}
		}
		return "mainPage/likeForm";
	}
}
