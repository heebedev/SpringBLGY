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
		
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		String nickname = request.getParameter("nickname");
		String message = request.getParameter("message");
		
		MessageDao dao = sqlSession.getMapper(MessageDao.class);
		
		dao.messageSend(nickname, userseq, message);
		model.addAttribute("msgList", dao.messageList(userseq, "", "", ""));
		
		return "message/messageList";
	}
	
	//쪽지 검
		@RequestMapping("/message")
		public String message(HttpServletRequest request, Model model) {

			int userseq = Integer.parseInt(request.getParameter("userseq"));
			
			String selection = "";
			String search = "";
			String searchText= "";
			
			if (request.getParameter("selection") != null) {
				selection = request.getParameter("selection");
			}
			
			if (request.getParameter("search") != null) {
				search = request.getParameter("search");
			}
			
			if (request.getParameter("searchText") != null) {
				searchText= request.getParameter("searchText");
			}		
			
			MessageDao dao = sqlSession.getMapper(MessageDao.class);
			
			if (selection.trim().length() != 0) {
				if (selection.equals("total")) {
					model.addAttribute("msgList", dao.messageList(userseq, "", "", ""));
				} else if (selection.equals("receive")) {
					model.addAttribute("msgList", dao.messageListReceive(userseq));
				} else {
					model.addAttribute("msgList", dao.messageListSend(userseq));
				}
			}
			
			if (search.trim().length() != 0) {
				String nick_send = "";
				String nick_receive = "";
				String message = "";
				if (search.equals("nick_send")) {
					nick_send = searchText;
				} else if (search.equals("nick_receive")) {
					nick_receive = searchText;
				} else {
					message = searchText;
				}
				
				model.addAttribute("msgList", dao.messageList(userseq, message, nick_receive, nick_send));
			}
			return "message/messageList";
			
		}
		
		
	

}
