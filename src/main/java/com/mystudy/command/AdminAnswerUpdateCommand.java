package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminAnswerDAO;
import com.mystudy.dao.AdminQnaDAO;
import com.mystudy.vo.AdminAnswerVO;
import com.mystudy.vo.AdminQnaVO;

public class AdminAnswerUpdateCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String qaTitle = request.getParameter("qaTitle");
		String qaContents = request.getParameter("qaContents");
		int qaNum = Integer.parseInt(request.getParameter("qaNum"));
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		
		AdminAnswerVO avo = AdminAnswerDAO.selectAnswerOne(qaNum);
		String qaDate = avo.getQaDate();
		
		AdminAnswerVO vo = new AdminAnswerVO();
		vo.setQaTitle(qaTitle);
		vo.setQaContents(qaContents);
		vo.setQaNum(qaNum);
		vo.setQaDate(qaDate);
		int result = AdminAnswerDAO.updateAnswer(vo);
		
		System.out.println("답변 수정 처리건수 : " + result);
		
		AdminQnaVO vo2 = AdminQnaDAO.selectQnAVO(qNum);		
		request.setAttribute("vo", vo);
		request.setAttribute("vo2", vo2);
		
		//3. 페이지 전환 - 응답할 페이지
		return "admin-answerDetailAdd.jsp";
	}

}
