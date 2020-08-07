package com.springblgy.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.springblgy.dao.ProductDao;



@Controller
public class ProductController {
	
	@Autowired 
	private SqlSession sqlSession;
	
	@RequestMapping("/productDetatil")
	public String list(HttpServletRequest request, Model model) {
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int myseq = Integer.parseInt(request.getParameter("myseq"));
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class); // 컨트롤러는  xml을 모르기때문에 IDao.java를 만들었다.
		model.addAttribute("prdDetail", dao.productDetailDao(prdseq, myseq));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		System.out.println(userseq);
		request.setAttribute("userseq", userseq);
		
		return "productDetail/productDetailView";
	}

}
