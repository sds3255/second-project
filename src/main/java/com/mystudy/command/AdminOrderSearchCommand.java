package com.mystudy.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.common.AdminPaging;
import com.mystudy.dao.AdminOrderDAO;
import com.mystudy.vo.AdminOrderVO;

public class AdminOrderSearchCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String select = request.getParameter("select");
		String keyword = request.getParameter("keyword");
		System.out.println("> select : " + select);
		System.out.println("> keyword : " + keyword);
		
		//-----------------------------------------------
		
		AdminPaging p = new AdminPaging();
		p.setNumPerPage(10);
		
		p.setTotalRecord(AdminOrderDAO.adminSearchCountOrderfinal(select, keyword));
		p.setTotalPage();
		System.out.println("> 전체 주문 수 : " + p.getTotalRecord());
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
		
		System.out.println("> 시작페이지 : " + p.getBeginPage());
		System.out.println("> 마지막페이지 : " + p.getEndPage());
		
		//--------------------------------------------------------
		
		String path;
		if (keyword == null || keyword.equals("")) {
			System.out.println("::: admin-order.jsp 페이지로 이동");
			path = "admin-order.jsp";
			
		} else { 
			System.out.println("::: DB데이터 조회 후 admin-orderList.jsp 페이지로 이동");
			
			String title = "";
			switch (select) {
				case "0": title = "주문번호"; break;
				case "1": title = "아이디"; break;
			}
			 
			List<AdminOrderVO> list = AdminOrderDAO.adminSelectOrderListfinal(select, keyword, p.getBegin(), p.getEnd());

			request.setAttribute("list", list);
			request.setAttribute("pvo", p);
			request.setAttribute("title", title);
			request.setAttribute("keyword", keyword);
			request.setAttribute("select", select);
			
			path = "admin-orderList.jsp";
		}
		return path;
	}

}
