package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.qnaVO;

public class modifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		String cPage = request.getParameter("cPage");
		String id = request.getParameter("id");
		
		String path = null;
		request.setAttribute("qNum", qNum);
		request.setAttribute("cPage", cPage);
			path = "/bord/modify.jsp?qNum=" + qNum + "&cPage=" + cPage + "&id=" + id;
			return path;
	}

}
