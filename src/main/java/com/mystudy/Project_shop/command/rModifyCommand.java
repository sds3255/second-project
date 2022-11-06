package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class rModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		String cPage = request.getParameter("cPage");
		
		request.setAttribute("qNum", bNum);
		request.setAttribute("cPage", cPage);
		String path = "/bord/rModify.jsp?qNum=" + bNum + "&cPage=" + cPage;
		
		return path;
	}

}
