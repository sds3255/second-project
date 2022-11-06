package com.mystudy.userproject_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.userps.dao.ShopDAO;


public class DeleteCheckCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		
		String result = ShopDAO.pwd(id);
		System.out.println("result : " + result);
		request.setAttribute("id", id);
		request.setAttribute("result", result);
			
		return "delete_customer.jsp";
	}

}
