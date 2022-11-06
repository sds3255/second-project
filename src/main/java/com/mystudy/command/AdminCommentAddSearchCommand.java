package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminCommentDAO;
import com.mystudy.vo.AdminCommentVO;

public class AdminCommentAddSearchCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("content");
		String cPage = request.getParameter("cPage");
		String select = request.getParameter("select");
		String keyword = request.getParameter("keyword");
		String id = request.getParameter("id");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		
		AdminCommentVO vo = new AdminCommentVO();
		vo.setbNum(bNum);
		vo.setContent(content);
		vo.setId(id);

		AdminCommentDAO.admininsertComment(vo);
		System.out.println("add vo : " + vo);
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("select", select);
		request.setAttribute("keyword", keyword);
		
		return "controller?type=admin-reviewDetailSearch";
	
	}

}
