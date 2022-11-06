package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminProductDAO;
import com.mystudy.vo.AdminProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminProductAddCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String path = "c:/MyStudy/60_web/Project_shop/WebContent/images";

		MultipartRequest mr = new MultipartRequest(
			request, 
			path, 
			10 * 1024 * 1024,
			"UTF-8", 
			new DefaultFileRenamePolicy()
			);
		
		AdminProductVO vo = new AdminProductVO();
		
		String str = mr.getFilesystemName("image");
		vo.setImage(str.substring(0, str.length()-4));
	 	vo.setCategory(mr.getParameter("category"));
	 	vo.setContent(mr.getParameter("content"));
	 	vo.setModel(mr.getParameter("model"));
	 	vo.setPrice(Integer.parseInt(mr.getParameter("price")));
	 	vo.setSaleprice(Integer.parseInt(mr.getParameter("saleprice")));
		vo.setProductName(mr.getParameter("productName"));
		
		System.out.println("add vo : " + vo);
		
		AdminProductDAO.insertProduct(vo);
		
		
		return "controller?type=admin-product";
	}

}
