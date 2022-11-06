package com.mystudy.Project_shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.qnaVO;

//@WebServlet("/Qwrite_ok")
public class QwriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		qnaVO qvo = new qnaVO();
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("Qtitle"));
		qvo.setqTitle(request.getParameter("Qtitle"));
		qvo.setId(request.getParameter("id"));
		qvo.setqPwd(request.getParameter("Qpwd"));
		qvo.setqContents(request.getParameter("Qcontent"));
		qvo.setCustid(1);
		
		
		ShopDAO.qnainsert(qvo);
		
		request.getRequestDispatcher("qna.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
