package com.mystudy.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.common.AdminPaging;
import com.mystudy.dao.AdminQnaDAO;
import com.mystudy.vo.AdminQnaVO;


public class AdminQnaSearchCommand implements AdminCommand {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String select = request.getParameter("select");
		String keyword = request.getParameter("keyword");
		System.out.println("> select : " + select);
		System.out.println("> keyword : " + keyword);
		
		//--------------------------------------------
		AdminPaging p = new AdminPaging();
		p.setNumPerPage(4); //한페이지에 출력될 게시글수
		
		p.setTotalRecord(AdminQnaDAO.SearchCountQna(select, keyword));
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
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
			System.out.println("::: admin-qna.jsp 페이지로 이동");
			path = "admin-qna.jsp";
		} else { 
			System.out.println("::: DB데이터 조회 후 admin-memberList.jsp 페이지로 이동");
			
			String title = "";
			switch (select) {
				case "0": title = "제목"; break;
				case "1": title = "아이디"; break;
			}
			
			List<AdminQnaVO> nowpageList = AdminQnaDAO.getSearchQna(select, keyword, Integer.toString(p.getBegin()), Integer.toString(p.getEnd()));
			System.out.println(">> 현재페이지 게시글목록 : " + nowpageList);
			System.out.println(">> 현재페이지 게시글갯수 : " + nowpageList.size());			
			
			request.setAttribute("nowpageList", nowpageList);
			request.setAttribute("pvo", p);
			request.setAttribute("title", title);
			request.setAttribute("keyword", keyword);
			request.setAttribute("select", select);
			request.setAttribute("cPage", p.getNowPage());
			System.out.println(">> cPage : " + nowpageList.size());			
			
			path = "admin-qnaList.jsp";
		}
		return path;
	}

}
