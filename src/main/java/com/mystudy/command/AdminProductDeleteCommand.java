package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminCustomerDAO;
import com.mystudy.dao.AdminProductDAO;

public class AdminProductDeleteCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginUserId = request.getParameter("adId");
		System.out.println("command loginUserId : " + loginUserId);
		
		String isertPwd =  request.getParameter("ad_pwd");
		System.out.println("command isertPwd : " + isertPwd);
		
		String productNum =  request.getParameter("productNum");
		System.out.println("command productNum : " + productNum);
		
		String loginUserPwd = AdminCustomerDAO.getAdinPwd(loginUserId);
		System.out.println("command ad_pwd : " + loginUserPwd);
		
		Boolean b;
		
		if (isertPwd.equals(loginUserPwd)) {
			AdminProductDAO.deleteProduct(productNum);
			b = true;
			request.setAttribute("b", b);
			return "admin-productDeleteResult.jsp";
		} else {
			b = false;
			request.setAttribute("b", b);
			return "admin-productDeleteResult.jsp";
			
		}

	}

}
