package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ProductDAO;

public class CartAddCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productnum  = request.getParameter("productNum");
		String id  = request.getParameter("id");		
		String count  = request.getParameter("amount");
		String model  = request.getParameter("model");
		if(id=="") {
			request.setAttribute("id", id);
			request.setAttribute("model", model);
			return "/cart/product_content.jsp?productNum="+productnum;
		}
		request.setAttribute("id", id);
		ProductDAO.cartadd(productnum,id,count,model);
		return "/cart/addok.jsp";
	}
}
