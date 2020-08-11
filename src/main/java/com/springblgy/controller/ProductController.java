package com.springblgy.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.springblgy.dao.ProductDao;
import com.springblgy.dto.ProductCommentDto;
import com.springblgy.dto.ProductDetailDto;

@Controller
public class ProductController {
	
	@Autowired 
	private SqlSession sqlSession;
	
	@RequestMapping("/productDetail")
	public String list(HttpServletRequest request, Model model) {
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class); // 컨트롤러는  xml을 모르기때문에 IDao.java를 만들었다.
		dao.updateViewDao(prdseq);
		
		model.addAttribute("pdDetail", dao.productDetailDao(prdseq, userseq));
		model.addAttribute("cmtDetail", dao.productCMTDao(prdseq, userseq));
		model.addAttribute("userseq", userseq);
		model.addAttribute("borrowList", dao.borrowListDao(prdseq, userseq));
		
		
		return "productDetail/productDetailView";
	}
	
	@RequestMapping("/borrow")
	public String borrow(HttpServletRequest request, Model model) {
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		dao.insertBorrowDao(prdseq, userseq, date1, date2);
		
		model.addAttribute("prdseq",prdseq);
		model.addAttribute("userseq",userseq);
		
		return "redirect:productDetail";
		
	}
	@RequestMapping("/borrowDelete")
	public String borrowDelete(HttpServletRequest request, Model model) {
	
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		int rentseq = Integer.parseInt(request.getParameter("rentseq"));
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		dao.deleteBorrowDao(rentseq);
		
		model.addAttribute("prdseq",prdseq);
		model.addAttribute("userseq",userseq);
		
		return "redirect:productDetail";
		
	}
}
