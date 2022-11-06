package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.qnaVO;

public class deleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		String id = request.getParameter("id");
		qnaVO vo = new qnaVO();
		
		request.setAttribute("qNum", qNum);
		request.setAttribute("id", id);
		
		return "/bord/delete.jsp?qNum=" + qNum;
	}

}
