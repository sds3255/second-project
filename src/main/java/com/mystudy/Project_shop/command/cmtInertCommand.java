package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.reviewCommentsVO;

public class cmtInertCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		String cPage = request.getParameter("cPage");
		String content = request.getParameter("cmtCnt");
		String id = request.getParameter("id");
		
		reviewCommentsVO rcVO = new reviewCommentsVO();
		rcVO.setbNum(bNum);
		rcVO.setId(id);
		rcVO.setContent(content);
		
		int mresult = ShopDAO.cmtInsert(rcVO);
		request.setAttribute("mresult", mresult);
		
		return "Rview.jsp?cPage=" +cPage + "&bNum=" + bNum + "&id=" + id ;
	}
}
