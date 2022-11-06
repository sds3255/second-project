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
			System.out.println("ccontroller연결");

			Command command = null;

			if ("cart".equals(func)) {
				System.out.println("cart연결");
				command = new CartCommand();
			} else if ("payment".equals(func)) {
				System.out.println("payment연결");
				command = new PaymentCommand();
			} else if ("detail".equals(func)) {
				System.out.println("detail연결");
				command = new DetailCommand();
			} else if ("all".equals(func)) {
				System.out.println("all연결");
				command = new ProductListCommand();
			} else if ("content".equals(func)){
				System.out.println("content연결");
				command = new ProductContentCommand();
			} else if("cartadd".equals(func)) {
				System.out.println("cartadd연결");
				command = new CartAddCommand();				
			} else if ("search".equals(func)) {
				System.out.println("search연결");
				command = new SearchNameCommand();
			} 

			String path =  command.exec(request, response);
			System.out.println("왔다.");
			request.getRequestDispatcher(path).forward(request, response);
			System.out.println("왔다2222.");
			
		} catch (ServletException e) {
			System.out.println("ServletException");
			e.printStackTrace();
			
		} catch (IOException e) {
			System.out.println("IOException");
			e.printStackTrace();

		} catch (Exception e) {
			System.out.println("예외발생...error들어간다~~");
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
