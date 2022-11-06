package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;

public class deleteQnaCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		String cPage = request.getParameter("cPage");
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		
		ShopDAO.qnaDelete(qNum);
		
		String path = "/bord/qna.jsp?id=" + id;
		return path;
	}

}
