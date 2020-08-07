package com.springblgy.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;
import java.util.List;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springblgy.dao.AddProductDao;

@Controller
public class AddProductController {
	
	@Autowired 
	private SqlSession sqlSession;
	
	
	//상품 등록 페이지 
	@RequestMapping("/AddProduct.bill")
	public String Addproduct() {
		return "addProduct/addProduct";
	}
	
	
	//상품 등록 
	@RequestMapping("/actionAddedProduct.bill")
	public String actionAddedProduct(MultipartHttpServletRequest mtfRequest, Model model) {
		AddProductDao addProductDao = sqlSession.getMapper(AddProductDao.class);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("productImage");
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);

		
		String savePath = mtfRequest.getRealPath("");
		
		int sizeLimit = 10 * 1024 * 1024;
		
		//MultipartRequest multi = null;
		
		String pImageFile ="";
		
		try {
			//multi = new MultipartRequest(mtfRequest, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			
			for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	            pImageFile = savePath + System.currentTimeMillis() + originFileName;
	            
	            
	            try {
	                mf.transferTo(new File(pImageFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		//File pImageFile = multi.getFile("productImage");
		
		//String pImage = getImageName(pImageFile);
		
		addProductDao.addItem(mtfRequest.getParameter("userseq"), mtfRequest.getParameter("title"), mtfRequest.getParameter("price"), 
				mtfRequest.getParameter("date1"), mtfRequest.getParameter("date2"), mtfRequest.getParameter("info"), pImageFile, 
				mtfRequest.getParameter("hash"), mtfRequest.getParameter("xaxis"), mtfRequest.getParameter("yaxis"));
		
		return "addProduct/posted";
	}
	
	
	//Method 
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

}
