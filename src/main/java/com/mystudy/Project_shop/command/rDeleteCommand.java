package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;

public class rDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		String cPage = request.getParameter("cPage");
		
		int result = ShopDAO.rDelete(bNum);
		
		request.setAttribute("Deleteresult", result);
		
		return "/bord/review.jsp?cPage=" + cPage;
	}
}
