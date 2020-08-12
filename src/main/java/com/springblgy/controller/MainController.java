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

		if(request.getParameter("userseq") == null || request.getParameter("userseq").equals("0") || request.getParameter("userseq").equals("null")) {
	
		}
		else {
			userseq = Integer.parseInt(request.getParameter("userseq"));
		}
		model.addAttribute("userseq", userseq);
		MainDao dao = sqlSession.getMapper(MainDao.class);
		ArrayList<MainDto> maindtios = dao.mainDao();
		model.addAttribute("MainList", maindtios);
		
		return "mainPage/mainForm";
	}
	
	@RequestMapping("/searchAfter.bill")
	public String searchAfter(HttpServletRequest request, Model model) {
		MainDao dao = sqlSession.getMapper(MainDao.class);
		
		String keyword = request.getParameter("search");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String select = request.getParameter("selectsearch");
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		
		if(date1.length()<5) {
			date1 = "2100-12-12";
			date2 = "1945-08-15";
		}
		
		if(userseq>0) {
			int distance = Integer.parseInt(request.getParameter("distance"));
			String xaxis = request.getParameter("xaxis");
			String yaxis = request.getParameter("yaxis");
			request.setAttribute("SearchList", dao.searchDao(keyword, date1, date2, select, userseq, distance, xaxis, yaxis));
		}else {
			request.setAttribute("SearchList", dao.searchDao(keyword, date1, date2, select, 0, 500, "127.289195338093", "36.4800685159754"));
		}
		

		
		return "mainPage/searchAfter";
	}
	
	@RequestMapping("/like.bill")
	public String like(HttpServletRequest request, Model model) {
		MainDao dao = sqlSession.getMapper(MainDao.class);
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		
		if(userseq == 0 || userseq == -1) {
			
		}else {
			dao.likeInsert(userseq, prdseq);	
		}
		return "mainPage/likeChk";
	}
	
}
