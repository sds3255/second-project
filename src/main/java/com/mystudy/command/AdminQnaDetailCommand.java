package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminQnaDAO;
import com.mystudy.vo.AdminQnaVO;

public class AdminQnaDetailCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. DB연결하고 데이터 가져오기		
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		String cPage = request.getParameter("cPage");
		AdminQnaVO vo = AdminQnaDAO.selectQnAVO(qNum);
		AdminQnaDAO.adminupdateQnaHits(qNum);

		//2.데이터를 응답할 페이지에 전달
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		
		//3. 페이지 전환 - 응답할 페이지
		return "admin-qnaDetail.jsp";
	}

}
