package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminCommentDAO;

public class AdminCommentDeleteCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cNum = Integer.parseInt(request.getParameter("cNum"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		AdminCommentDAO.admindeleteComment(cNum);
		
		request.setAttribute("cPage", cPage);

		return "controller?type=admin-reviewDetail";
		
		
	}

}
