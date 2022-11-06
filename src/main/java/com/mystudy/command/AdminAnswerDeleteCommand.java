package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminAnswerDAO;
import com.mystudy.dao.AdminCustomerDAO;

public class AdminAnswerDeleteCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginUserId = request.getParameter("adId");
		
		String isertPwd =  request.getParameter("ad_pwd");
		
		String qaNum =  request.getParameter("qaNum");
		
		String loginUserPwd = AdminCustomerDAO.getAdinPwd(loginUserId);
		
		Boolean b;
		
		if (isertPwd.equals(loginUserPwd)) {
			AdminAnswerDAO.deleteAnswer(qaNum);
			b = true;
			request.setAttribute("b", b);
			return "admin-answerDeleteResult.jsp";
		} else {
			b = false;
			request.setAttribute("b", b);
			return "admin-answerDeleteResult.jsp";
			
		}

	}

}
