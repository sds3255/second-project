package com.mystudy.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminCommentDAO;
import com.mystudy.dao.AdminReviewDAO;
import com.mystudy.vo.AdminCommentVO;
import com.mystudy.vo.AdminReviewVO;

public class AdminReviewDetailCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. DB연결하고 데이터 가져오기
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		AdminReviewVO vo = AdminReviewDAO.adminselectReview(bNum);
		AdminReviewDAO.adminupdateReviewHits(bNum);
		
		List<AdminCommentVO> list = AdminCommentDAO.adminselectComment(bNum);
		
		//2.데이터를 응답할 페이지에 전달
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		
		//3. 페이지 전환 - 응답할 페이지
		return "admin-reviewDetail.jsp";
	}

}
