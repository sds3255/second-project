package com.mystudy.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.common.AdminPaging;
import com.mystudy.dao.AdminReviewDAO;
import com.mystudy.vo.AdminReviewVO;

public class AdminReviewCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminPaging p = new AdminPaging();
		p.setNumPerPage(10);
		
		p.setTotalRecord(AdminReviewDAO.admin_totalCountReview());
		p.setTotalPage();
		System.out.println("> 전체 리뷰 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> current page : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		System.out.println("> 시작번호 : " + p.getBegin());
		System.out.println("> 끝번호 : " + p.getEnd());
		
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		System.out.println("> beginPage : " + p.getBeginPage());
		System.out.println("> endPage : " + p.getEndPage());
		
		List<AdminReviewVO> list = AdminReviewDAO.admin_reviewList(p.getBegin(), p.getEnd());
		System.out.println(">> 현재페이지 리뷰목록 : " + list);
		
		//2.데이터를 응답할 페이지에 전달
		request.setAttribute("list", list);
		request.setAttribute("pvo", p);
		
		//3. 페이지 전환 - 응답할 페이지
		return "admin-review.jsp";
	}

}
