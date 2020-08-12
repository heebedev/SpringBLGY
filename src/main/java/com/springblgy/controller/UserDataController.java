package com.springblgy.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.springblgy.dao.UserDataDao;


@Controller
public class UserDataController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/login.bill")
	private String login() {
		return "userdata/Login";
	}
	
	@RequestMapping("/logOut.bill")
	private String logOut() {
		return "userdata/LogOut";
	}
	
	
	@RequestMapping("/checkUser.bill")
	private String checkUser(HttpServletRequest request, Model model) {
		
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		
		int validation = userDataDao.checkUser(request.getParameter("email"), request.getParameter("pw"));
		String email = request.getParameter("email");
		if (validation == 0) {
			return("alert/userNotFound");
		}else if (validation == 1) {
			if (email.equals("admin@billil.com")) {
				model.addAttribute("validation","1");
				return("redirect:adminmain.bill");
				}
				else {
				model.addAttribute("userData", userDataDao.getUserData(request.getParameter("email")));
				return("userdata/userDataReg");
				}

		}else {
			return("alert/unknownError");
		}
	}
	
	@RequestMapping("/pass_kakaoUser.bill")
	private String pass_kakaoUser(HttpServletRequest request, Model model) {
		
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		
		int validation = userDataDao.pass_kakaoUser(request.getParameter("email"));
		
		if (validation == 0) {
			return("alert/userNotFound");
		}else if (validation == 1) {
			model.addAttribute("userData", userDataDao.getUserData(request.getParameter("email")));
			return("userdata/userDataReg");
		}else {
			return("alert/unknownError");
		}
		
	}
	
	@RequestMapping("/FindAcc.bill")
	private String FindAcc() {
		return "userdata/FindAcc";
	}
	
	@RequestMapping("/lookUpAcc.bill")
	private String lookUpAcc(HttpServletRequest request, Model model) {
		
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		
		int validation =userDataDao.lookUpAcc(request.getParameter("name"), request.getParameter("tel"));
		
		if (validation ==1) {
			String email = userDataDao.getEmail(request.getParameter("name"), request.getParameter("tel"));
			model.addAttribute("email", email);
			return("alert/FoundAcc");
		}else if(validation==0) {
			return ("alert/userNotFound");
		}else {
			return("alert/unknownError");
		}
		
	}
	
	@RequestMapping("/FindPw.bill")
	private String FindPw() {
		return "userdata/FindPw";
	}
	
	@RequestMapping("/lookUpPw.bill")
	private String lookUpPw(HttpServletRequest request, Model model) {
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		try {
			int validation = userDataDao.lookUpPw(request.getParameter("email"), request.getParameter("telno"));
			
			if (validation==1) {
				model.addAttribute("email",request.getParameter("email"));
				return("userdata/resetPw");
				}else {
					return ("alert/userNotFound");
				}
		}catch (Exception e) {
			e.printStackTrace();
			return("alert/unknownError");
		}
	}
	
	@RequestMapping("/changePw.bill")
	private String changePw(HttpServletRequest request, Model model) {
		
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		
		userDataDao.changePw(request.getParameter("pw"), request.getParameter("email"));
		
		model.addAttribute("email", request.getParameter("email"));
		
		return "alert/changedPw";
	}
	
	@RequestMapping ("/createAcc.bill")
	private String createAcc() {
		return "userdata/CreateAcc1";
	}
	
	@RequestMapping ("/createAcc2.bill")
	private String createAcc2() {
		return "userdata/CreateAcc2";
	}
	
	@RequestMapping ("/checkEmail.bill")
	private String checkEmail(HttpServletRequest request, Model model) {
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		 int validation = userDataDao.checkEmail(request.getParameter("email"));
		 if(validation ==0) {
			 return"alert/validEmail";
		 }else {
			 return "alert/invalidEmail";
		 }
	}
	
	@RequestMapping ("/checkNickname.bill")
	private String checkNickname(HttpServletRequest request, Model model) {
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		int validation = userDataDao.checkNickname(request.getParameter("nickname"));
		if(validation ==0) {
			return"alert/validNickname";
		}else {
			return "alert/invalidNickname";
		}
	}
	
	@RequestMapping ("/uploadUserData.bill")
	private String uploadUserData(HttpServletRequest request, Model model) {
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		userDataDao.uploadUserData(request.getParameter("email"), request.getParameter("name"), request.getParameter("nickname"), request.getParameter("birthdate"), request.getParameter("telno"), request.getParameter("address"), request.getParameter("addressdt"), request.getParameter("xaxis"), request.getParameter("yaxis"), request.getParameter("pw"));
		return"userdata/Login";
	}
	
	@RequestMapping("/authority.bill")
	private String authority(){
		return "alert/authority";
	}
	
	@RequestMapping("/authorize.bill")
	private String authorize(HttpServletRequest request, Model model){
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		int validation = userDataDao.authorize(request.getParameter("pw"),request.getParameter("userseq"));
		if (validation==1) {
			model.addAttribute("userdata",userDataDao.getUserData2(request.getParameter("userseq")));
			return "userdata/UpdateAcc";
		}else {
			return "alert/wrongPw";
		}
	}
	
	@RequestMapping("updateUserData.bill")
	private String updateUserData(HttpServletRequest request) {
		UserDataDao userDataDao = sqlSession.getMapper(UserDataDao.class);
		userDataDao.updateUserData(request.getParameter("pw"), request.getParameter("telno"), request.getParameter("address"), request.getParameter("addressdt"), request.getParameter("xaxis"), request.getParameter("yaxis"), request.getParameter("userseq"));
		return "alert/updated";
	}
	
	@RequestMapping ("loginRedirect")
	private String loginRedirect() {
		return "alert/loginRedirect";
	}
	
	
}
