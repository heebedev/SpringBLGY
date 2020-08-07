package com.springblgy.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springblgy.dao.AdminDao;


@Controller //
public class AdminController {

	
	@Autowired 
	private SqlSession sqlSession;
	
	
	//어드민 메인 + 카운트 
	@RequestMapping("/adminmain.bill")
	public String adminMain(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("adminMainCountUser", adminDao.AdminMainCountUser());
		model.addAttribute("adminMainCountProduct", adminDao.AdminMainCountProduct());
		model.addAttribute("adminMainCountBorrow", adminDao.AdminMainCountBorrow());
		return "admin/adminMainpage";
	}
	
	//회원 관리 
	//회원관리 리스트
	@RequestMapping("/adminUser.bill")
	public String adminUser(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("AdminUserList", adminDao.AdminUserList());
		return "admin/adminUser";
	}
	
	//회원검색
	@RequestMapping("/adminusersearch.bill")
	public String adminUserSearch(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("AdminUserSearchList", adminDao.AdminUserSearchList(request.getParameter("selection"), request.getParameter("adminUserSearchText")));
		return "admin/adminUserSearch";

	}

	//회원정보 수정_view
	@RequestMapping("/adminuserview.bill")
	public String AdminUserModifyGetInfo(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("AdminUserUpdate", adminDao.AdminViewUserInfo(request.getParameter("userseq")));
		return "admin/adminUserView";
	}

	//회원정보 수정
	@RequestMapping("/adminusermodify.bill")
	public String AdminUserModify(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		adminDao.AdminUserModify(request.getParameter("newname"), 
			request.getParameter("newnickname"), request.getParameter("newpw"), 
			request.getParameter("newbirthdate"), request.getParameter("newemail"), 
			request.getParameter("newtelno"), request.getParameter("newaddress"), 
			request.getParameter("newaddressdt"), request.getParameter("userseq"));
		return "redirect:adminUser.bill";
	}

	//회원정보 삭제
	@RequestMapping("/adminuserdelete.bill")
	public String AdminUserDelete(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		adminDao.AdminUserDelete(request.getParameter("userseq"));
		return "redirect:adminUser.bill";
	}

	//상품 관리
	//어드민 상품관리 리스트
	@RequestMapping("/adminproductlist.bill")
	public String AdminProduct(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("AdminProductList" ,adminDao.AdminProductList());
		return "admin/adminProductList";
	}

	//상품 검색
	@RequestMapping("/adminproductsearch.bill")
	public String AdminProductSearch(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("AdminProductSearchList", adminDao.AdminProductSearchList(request.getParameter("selection"), request.getParameter("adminProductSearchText")));
		return "admin/adminProductSearch";
	}
	
	//상품관리 수정_view
	@RequestMapping("/adminproductview.bill")
	public String AdminProductModifyGetInfo(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		model.addAttribute("AdminPrdUpdate", adminDao.AdminViewPrdInfo(request.getParameter("prdseq")));
		return "admin/adminProductView";
	}

	//상품관리 수정
	@RequestMapping("/adminproductmodify.bill")
	public String AdminProductModify(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		adminDao.AdminPrdModify(request.getParameter("newtitle"), request.getParameter("newprice"), 
				request.getParameter("newdate1"), request.getParameter("newdate2"), request.getParameter("newinfo"), 
				request.getParameter("newhash"), request.getParameter("prdseq"));
		return "redirect:adminproductlist.bill";
	}


	//어드민 상품관리 삭제
	@RequestMapping("/adminproductdelete.bill")
	public String AdminProductDeleteCommand(HttpServletRequest request, Model model) {
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		adminDao.AdminProductDelete(request.getParameter("prdseq"));
		return "redirect:adminproductlist.bill";
	}

	
	
	
	
	
	
}//---------