package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminProductDAO;
import com.mystudy.vo.AdminProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminProductUpdateCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String cPage = request.getParameter("cPage");
	
		String path = "c:/MyStudy/60_web/Shop_Controller_project/WebContent/images";

		MultipartRequest mr = new MultipartRequest(
				request, 
				path, 
				10 * 1024 * 1024,
				"UTF-8", 
				new DefaultFileRenamePolicy()
				);
		
		AdminProductVO vo = new AdminProductVO();
	 	vo.setCategory(mr.getParameter("category"));
	 	vo.setContent(mr.getParameter("content"));
	 	vo.setModel(mr.getParameter("model"));
	 	vo.setPrice(Integer.parseInt(mr.getParameter("price")));
	 	vo.setSaleprice(Integer.parseInt(mr.getParameter("saleprice")));
		vo.setProductName(mr.getParameter("productName"));
		vo.setProductNum(Integer.parseInt(mr.getParameter("productNum")));
		
		if (mr.getFile("image") != null) {
			String str = mr.getFilesystemName("image");
			vo.setImage(str.substring(0, str.length()-4));

			AdminProductDAO.updateProductAll(vo);
		} else {
			AdminProductDAO.updateProductExcept(vo);
		}
		
		System.out.println("add vo : " + vo);
		
		//2.데이터를 응답할 페이지에 전달
		request.setAttribute("cPage", cPage);
		System.out.println("cPage : " + cPage);
		
		//3. 페이지 전환 - 응답할 페이지
		return "controller?type=admin-product";
	}

}
