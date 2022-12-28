 package com.mystudy.Project_shop.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.command.CartAddCommand;
import com.mystudy.Project_shop.command.CartCommand;
import com.mystudy.Project_shop.command.Command;
import com.mystudy.Project_shop.command.DetailCommand;
import com.mystudy.Project_shop.command.PaymentCommand;
import com.mystudy.Project_shop.command.ProductContentCommand;
import com.mystudy.Project_shop.command.ProductListCommand;
import com.mystudy.Project_shop.command.SearchNameCommand;

@WebServlet("/ccontroller")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String func = request.getParameter("func");
			Command command = null;

			if ("cart".equals(func)) {
				command = new CartCommand();
			} else if ("payment".equals(func)) {
				command = new PaymentCommand();
			} else if ("detail".equals(func)) {
				command = new DetailCommand();
			} else if ("all".equals(func)) {
				command = new ProductListCommand();
			} else if ("content".equals(func)){
				command = new ProductContentCommand();
			} else if("cartadd".equals(func)) {
				command = new CartAddCommand();				
			} else if ("search".equals(func)) {
				command = new SearchNameCommand();
			} 

			String path =  command.exec(request, response);
			request.getRequestDispatcher(path).forward(request, response);			
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd =  request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
