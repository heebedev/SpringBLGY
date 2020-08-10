package com.springblgy.dao;

import java.util.ArrayList;

import com.springblgy.dto.BorrowDto;
import com.springblgy.dto.LikeDto;
import com.springblgy.dto.ProductDetailDto;

public interface MyPageDao {
	
	//등록 상품 목록 
	public ArrayList<ProductDetailDto> MyProductList(String userseq);
	
	public ArrayList<BorrowDto> MyBorrowList(String userseq);
		
	public ArrayList<LikeDto> MyLikeList(String userseq);

	
	
	
//	public String getImageName(File pImageFile) {
//		FTPClient ftp = null;
//		String result = "";
//		
//		try
//		{
//		    ftp = new FTPClient();
//		    ftp.setControlEncoding("UTF-8");
//		    ftp.connect("119.207.169.213");			// 접속할 ip
//		    ftp.login("tj","1234");	// 접속할 아이디, 비밀번호
//		    
//		    ftp.setFileType(FTPClient.BINARY_FILE_TYPE);	// 파일 깨짐 방지
//		   
//		    // ftp 저장할 장소 (루트의 imgs 폴더)
//		    ftp.changeWorkingDirectory("/");
//		   
//		    File file = pImageFile;
//		    
//		   	// 저장할 파일 선택
//		    File uploadFile = file;
//		    FileInputStream fis = null;
//		   
//		    try{
//		        fis = new FileInputStream(uploadFile);
//		        
//		        // ftp 서버에 파일을 저장한다. (저장한 이름, 파일)
//		        boolean isSuccess = ftp.storeFile(uploadFile.getName(), fis);
//	            result = uploadFile.getName();
//	
//		        if (isSuccess){
//		            System.out.println("Upload Success");
//		        }
//		    } catch (IOException ex) {
//		        System.out.println("ERR : "+ ex.getMessage());
//		    } finally {
//		        if (fis != null)
//		            try
//		            {
//		                fis.close();
//		            } catch (IOException ex) {
//		    	        System.out.println("ERR2 : "+ ex.getMessage());
//		            }
//		    }
//		    ftp.logout();
//		    
//		} catch (SocketException e) {
//		    System.out.println("Socket:" + e.getMessage());
//		} catch (IOException e)	{
//		    System.out.println("IO:" + e.getMessage());
//		} finally {
//		    if (ftp != null && ftp.isConnected()){
//		        try{
//		            ftp.disconnect();
//		        } catch (IOException e){
//	    	        System.out.println("ERR3 : "+ e.getMessage());
//		        }
//		    }
//		}
//		
//		return result;
//	}
//	public void addItem(String userseq, String title, String price, String date1, String date2, String info, String hash, String productImage, String xaxis, String yaxis) {
//		
//		Connection connection = null;
//		PreparedStatement preparedStatement = null;
//		
//		
//		try {
//			connection = dataSource.getConnection();
//			String query = "insert into product(uploaderseq, title, price, date1, date2, info, image1, hash, xaxis, yaxis, insertdate) values(?,?,?,?,?,?,?,?,?,?, now())";
//			preparedStatement = connection.prepareStatement(query);
//			preparedStatement.setString(1, userseq);
//			preparedStatement.setString(2, title);
//			preparedStatement.setString(3, price);
//			preparedStatement.setString(4, date1);
//			preparedStatement.setString(5, date2);
//			preparedStatement.setString(6, info);
//			preparedStatement.setString(7, productImage);
//			preparedStatement.setString(8, hash);
//			preparedStatement.setString(9, xaxis);
//			preparedStatement.setString(10, yaxis);
//			preparedStatement.executeUpdate();
//		
//		} catch(Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(preparedStatement != null) preparedStatement.close();
//				if(connection != null) connection.close();
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}



}
