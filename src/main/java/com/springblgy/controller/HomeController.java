package com.springblgy.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springblgy.dao.MainDao;
import com.springblgy.dto.MainDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired 
	private SqlSession sqlSession;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "mainPage/mainForm";
		public String mainPage(HttpServletRequest request, Model model) {
			int userseq = -1;
			if(request.getParameter("userseq")==null || request.getParameter("userseq").equals("0") || request.getParameter("userseq").equals("null")) {
				
			}else {
				userseq = Integer.parseInt(request.getParameter("userseq"));
			}
			request.setAttribute("userseq", userseq);
			MainDao dao = sqlSession.getMapper(MainDao.class);
			ArrayList<MainDto> maindtios = dao.mainDao();
			request.setAttribute("MainList", maindtios);
			
			return "mainPage/mainForm";
	}

	
	
	
	
	
	
	
	
	
}//------

