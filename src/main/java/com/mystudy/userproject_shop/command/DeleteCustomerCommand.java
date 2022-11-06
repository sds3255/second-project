package com.mystudy.userproject_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.vo.customerVO;
import com.mystudy.userps.dao.ShopDAO;

public class DeleteCustomerCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		customerVO vo = new customerVO();
		
		//전달받은 파라미터 값 추출
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		
		
		//DB연동작업
		int delok = ShopDAO.delete(id);
		System.out.println("delok : " + delok);
						
		request.setAttribute("delok", delok);
		String path = "shop.jsp";
		
		return path;
		
	}


}
