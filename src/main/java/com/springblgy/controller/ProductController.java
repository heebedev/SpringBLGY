package com.springblgy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.springblgy.dao.MainDao;
import com.springblgy.dao.ProductDao;
import com.springblgy.dto.MainDto;
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
	

	@RequestMapping("/commentAdd")
	public void commentAdd(HttpServletRequest request, Model model) {
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		String comment = request.getParameter("cmtTxt");
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		dao.addComment(prdseq, userseq, comment);
		
	}
	
	@RequestMapping("/commentDetail")
	public String commentDetail(HttpServletRequest request, Model model) {
		
		int cmtseq = Integer.parseInt(request.getParameter("cmtseq"));
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		model.addAttribute("cmtCheck", dao.commentDetail(cmtseq));
		
		return "productDetail/commentDetail";
	}
	
	@RequestMapping("/commentRevDel")
	public String commentRevDel(HttpServletRequest request, Model model) {
		
		int cmtseq = Integer.parseInt(request.getParameter("cmtseq"));
		int cmtIntstate = Integer.parseInt(request.getParameter("cmtIntstate"));
		String comment = "";
		
		String result = "";
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		
		if (cmtIntstate == 0) {
			comment = request.getParameter("comment");
			dao.commentRevision(cmtseq, comment);
			result = "수정";
		} else {
			dao.commentDelete(cmtseq);
			result = "삭제";
		}
		
		model.addAttribute("cmtstate", result);
		
		return "productDetail/commentConfirm";
	}
	
	@RequestMapping("/productReviseView")
	public String productRevise(HttpServletRequest request, Model model) {
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class); // 컨트롤러는  xml을 모르기때문에 IDao.java를 만들었다.
		
		model.addAttribute("pdDetail", dao.productDetailDao(prdseq, userseq));

		return "productDetail/productRevise";
	}
	
	@RequestMapping("/productRevision")
	public String productRevision(HttpServletRequest request, Model model) {
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		
		String savePath = request.getRealPath("");
		
		int sizeLimit = 10 * 1024 * 1024;
		
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
		File pImageFile = multi.getFile("productImage");
		
		//Method
		
		String pImage = getImageName(pImageFile);
		int prdseq = Integer.parseInt(multi.getParameter("prdseq"));
		int userseq = Integer.parseInt(multi.getParameter("userseq"));
		String title = multi.getParameter("title");
		String price = multi.getParameter("price");
		String date1 = multi.getParameter("date1");
		String date2 = multi.getParameter("date2");
		String hash = multi.getParameter("hash");
		String info = multi.getParameter("info");
		
		dao.productRevision(prdseq, title, price, date1, date2, hash, info, pImage);
		
		model.addAttribute("pdDetail", dao.productDetailDao(prdseq, userseq));
		model.addAttribute("cmtDetail", dao.productCMTDao(prdseq, userseq));
		model.addAttribute("userseq", userseq);

		
		return "productDetail/productDetailView";
	}
	
	@RequestMapping("/productDeleteConfirmView")
	public String productDeleteConfirm(HttpServletRequest request, Model model) {
		
		model.addAttribute("prdseq", request.getParameter("prdseq"));
		model.addAttribute("userseq", request.getParameter("userseq"));
		
		return "productDetail/productDeleteConfirm";
		
	}
	
	@RequestMapping("/productDelete")
	public String productDelete(HttpServletRequest request, Model model) {
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		int userseq = Integer.parseInt(request.getParameter("userseq"));
		
		ProductDao prddao = sqlSession.getMapper(ProductDao.class);
		
		prddao.productDelete(prdseq);
		
		model.addAttribute("prdseq", request.getParameter("prdseq"));
		model.addAttribute("userseq", request.getParameter("userseq"));
		
		return "productDetail/productDeleteResult";
		
	}
	
	//FTP 업로드 + 파일이름 받아오기 
		public String getImageName(File pImageFile){
			FTPClient ftp = null;
			String result = "";
			
			try
			{
			    ftp = new FTPClient();
			    ftp.setControlEncoding("UTF-8");
			    ftp.connect("119.207.169.213");			// 접속할 ip
			    ftp.login("tj","1234");	// 접속할 아이디, 비밀번호
			    
			    ftp.setFileType(FTPClient.BINARY_FILE_TYPE);	// 파일 깨짐 방지
			   
			    // ftp 저장할 장소 (루트의 imgs 폴더)
			    ftp.changeWorkingDirectory("/");
			   
			    File file = pImageFile;
			    
			   	// 저장할 파일 선택
			    File uploadFile = file;
			    FileInputStream fis = null;
			   
			    try{
			        fis = new FileInputStream(uploadFile);
			        
			        // ftp 서버에 파일을 저장한다. (저장한 이름, 파일)
			        boolean isSuccess = ftp.storeFile(uploadFile.getName(), fis);
		            result = uploadFile.getName();
		
			        if (isSuccess){
			            System.out.println("Upload Success");
			        }
			    } catch (IOException ex) {
			        System.out.println("ERR : "+ ex.getMessage());
			    } finally {
			        if (fis != null)
			            try
			            {
			                fis.close();
			            } catch (IOException ex) {
			    	        System.out.println("ERR2 : "+ ex.getMessage());
			            }
			    }
			    ftp.logout();
			    
			} catch (SocketException e) {
			    System.out.println("Socket:" + e.getMessage());
			} catch (IOException e)	{
			    System.out.println("IO:" + e.getMessage());
			} finally {
			    if (ftp != null && ftp.isConnected()){
			        try{
			            ftp.disconnect();
			        } catch (IOException e){
		    	        System.out.println("ERR3 : "+ e.getMessage());
			        }
			    }
			}
			
			return result;
		}
		
	@RequestMapping("/borrowChk")
	public String borrowChk(HttpServletRequest request, Model model) {
		
		int prdseq = Integer.parseInt(request.getParameter("prdseq"));
		String date1 = request.getParameter("sdate");
		String date2 = request.getParameter("edate");
		
		
		ProductDao dao = sqlSession.getMapper(ProductDao.class);
		int count = dao.borrowChkDao(prdseq, date1, date2);
		model.addAttribute("count",dao.borrowChkDao(prdseq, date1, date2));
		
		return "productDetail/borrowChk";
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
