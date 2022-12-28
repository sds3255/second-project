package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.qnaVO;

public class updateQnaCommand2 implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		qnaVO vo = new qnaVO();
		
		String cPage = request.getParameter("cPage");
		vo.setqContents(request.getParameter("Qcontent"));
		vo.setqTitle(request.getParameter("Qtitle"));
		vo.setqPwd(request.getParameter("Qpwd"));
		vo.setqNum(qNum);
		
		int result = ShopDAO.qnaUpdate(vo);
		request.setAttribute("result", result);
		
		path = "/bord/Qnaview.jsp?cPage=" + cPage + "&qNum="+ qNum;
		return path;
	}
}
