package com.springblgy.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springblgy.dao.MessageDao;


@Controller
public class MessageController {
	
	@Autowired 
	private SqlSession sqlSession;
	
	//쪽지보내기 클릭시 닉네임 받아서 쪽지 화면으로 전송
	@RequestMapping("/messageSend")
	public String messageSend(HttpServletRequest request, Model model) {
		
		String nickname = "";
		
		if (request.getParameter("nickname") != null ) {
			nickname = request.getParameter("nickname");
		}
		
		model.addAttribute("nickname", nickname);
		
		return "message/messageSend";
	}
	
	//쪽지 보내기 완료 후 실제 DB 입력
	@RequestMapping("/messageSendAfter")
	public String messageSendAfter(HttpServletRequest request, Model model) {
		System.out.println("messageSendAfter");
		
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		String nickname = request.getParameter("nickname");
		String message = request.getParameter("message");
		
		MessageDao dao = sqlSession.getMapper(MessageDao.class);
		
//		dao.sendMessage(nickname, userseq, message);
//		
//		model.addAttribute("msgList", dao.)
		
		return "message/messageList";
	}
	
	
	

}
