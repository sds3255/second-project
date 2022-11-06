package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ProductDAO;
import com.mystudy.Project_shop.vo.ProductPriceVO;

public class ProductContentCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("content들어옴");
		
		request.setAttribute("replaceChar", "\n");
		String id  = request.getParameter("id");		
		String productNum = request.getParameter("productNum");
		System.out.println("productNum : " + productNum);	

		
		ProductPriceVO vo = ProductDAO.selectOne(productNum);
		System.out.println("dao갔다옴");
		System.out.println("vo:"+vo);
		System.out.println("id:"+id);
		request.setAttribute("vo",vo);
		request.setAttribute("id",id);

	   
		return "/cart/product_content.jsp";
	}

}
