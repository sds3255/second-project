package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.qnaVO;

public class Qwrite_okCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		qnaVO qvo = new qnaVO();
		qvo.setqTitle(request.getParameter("Qtitle"));
		qvo.setId(request.getParameter("id"));
		qvo.setqPwd(request.getParameter("Qpwd"));
		qvo.setqContents(request.getParameter("Qcontent"));
		qvo.setCustid(1);
		
		int qnaInsert = ShopDAO.qnainsert(qvo);
		
		request.setAttribute("qnaInsert", qnaInsert);
		request.setAttribute("id", qvo.getId());
		
		return "/bord/qna.jsp";
	}
}
