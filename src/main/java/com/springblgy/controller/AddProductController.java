package com.springblgy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
	public String actionAddedProduct(HttpServletRequest request, Model model) {
		AddProductDao addProductDao = sqlSession.getMapper(AddProductDao.class);
		
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
		
		addProductDao.addItem(multi.getParameter("userseq"), multi.getParameter("title"), multi.getParameter("price"), 
				multi.getParameter("date1"), multi.getParameter("date2"), multi.getParameter("info"), pImage, 
				multi.getParameter("hash"), multi.getParameter("xaxis"), multi.getParameter("yaxis"));
		
		return "addProduct/posted";
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

}
