package com.mystudy.userproject_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.userps.dao.ShopDAO;
import com.mystudy.Project_shop.vo.customerVO;

public class UpdateCustomerCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		
		//DB연동작업
		customerVO upok = ShopDAO.select(id);
		System.out.println("upok : " + upok);
		
		request.setAttribute("vo", upok);
		String path = "update_customer.jsp";
		
		return path;
	}

}

