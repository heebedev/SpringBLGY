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
		
		System.out.println(prdseq);
		System.out.println(userseq);
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class); // 컨트롤러는  xml을 모르기때문에 IDao.java를 만들었다.
		dao.updateViewDao(prdseq);
		
		model.addAttribute("pdDetail", dao.productDetailDao(prdseq, userseq));
		model.addAttribute("cmtDetail", dao.productCMTDao(prdseq, userseq));
		model.addAttribute("userseq", userseq);

		
		return "productDetail/productDetailView";
	}
	
	@RequestMapping("/commentAdd")
	public void commentAdd(HttpServletRequest request, Model model) {
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		System.out.println(prdseq);
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		String comment = request.getParameter("cmtTxt");
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		dao.addComment(prdseq, userseq, comment);
		
	}

}
