package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminAnswerDAO;
import com.mystudy.vo.AdminAnswerVO;

public class AdminAnswerAddCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		String cPage = request.getParameter("cPage");
		System.out.println("add cPage : " + cPage);
		
		String qaTitle= request.getParameter("qaTitle");
		String qaContents= request.getParameter("qaContents");
		System.out.println("qNum : " + qNum);
		System.out.println("qaTitle : " + qaTitle);
		System.out.println("qaContents : " + qaContents);

		AdminAnswerVO vo = new AdminAnswerVO();

		vo.setqNum(qNum);
		vo.setQaTitle(qaTitle);
		vo.setQaContents(qaContents);
		
		System.out.println("add vo : " + vo);
		
		AdminAnswerDAO.insertAnswer(vo);
		
		AdminAnswerVO answer = AdminAnswerDAO.selectAnswerQnum(qNum);
		request.setAttribute("vo", answer);
		
		return "controller?type=admin-answerAddresult";
	
	}

}
