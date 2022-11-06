package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminAnswerDAO;
import com.mystudy.dao.AdminQnaDAO;
import com.mystudy.vo.AdminAnswerVO;
import com.mystudy.vo.AdminQnaVO;

public class AdminAnswerDetailAddCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. DB연결하고 데이터 가져오기
		int qaNum = Integer.parseInt(request.getParameter("qaNum"));
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		
		AdminAnswerVO vo = AdminAnswerDAO.selectAnswerOne(qaNum);
		AdminQnaVO vo2 = AdminQnaDAO.selectQnAVO(qNum);
		
		//2.데이터를 응답할 페이지에 전달
		request.setAttribute("vo", vo);
		request.setAttribute("vo2", vo2);
		
		//3. 페이지 전환 - 응답할 페이지
		return "admin-answerDetailAdd.jsp";
	}

}
