package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminCommentDAO;

public class AdminCommentDeleteSearchCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cNum = Integer.parseInt(request.getParameter("cNum"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		String keyword = request.getParameter("keyword");
		String select = request.getParameter("select");
		AdminCommentDAO.admindeleteComment(cNum);
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("keyword", keyword);
		request.setAttribute("select", select);

		return "controller?type=admin-reviewDetailSearch";
		
		
	}

}
