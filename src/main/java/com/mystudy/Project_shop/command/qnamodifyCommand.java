package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.qnaVO;

public class qnamodifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		String cPage = request.getParameter("cPage");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		String pwdout = ShopDAO.pwdcheck(qNum);
		
		//비밀번호 일치하지않으면 다시 비밀번호 확인페이지로 이동
		if (!pwd.equals(pwdout)) {
			request.setAttribute("pwdout", pwdout);
			return "modify.jsp?qNum=" + qNum + "&cPage=" + cPage;
		}
		
		//일치하면 수정페이지로 이동
		request.setAttribute("cPage", cPage);
		request.setAttribute("qNum", qNum);
		request.setAttribute("id", id);

		String path = "/bord/qnaModify.jsp";

		return path;
	}
}
