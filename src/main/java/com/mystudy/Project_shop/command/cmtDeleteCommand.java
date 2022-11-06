package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.reviewCommentsVO;

public class cmtDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		int cNum = Integer.parseInt(request.getParameter("cNum"));
		String cPage = request.getParameter("cPage");
		String id = request.getParameter("id");
		
		int cmtDel = ShopDAO.cmtDelete(cNum);
		
		System.out.println("cmtDre : " + cmtDel);
		
		request.setAttribute("cmtDre", cmtDel);
		
		return "Rview.jsp?id=" + id + "&cPage=" + cPage + "&bNum=" + bNum ;
	}

}