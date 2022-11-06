package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ProductDAO;
import com.mystudy.Project_shop.vo.ProductPriceVO;
import com.mystudy.Project_shop.common.Paging;

public class SearchNameCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String keyword = request.getParameter("keyword");
		String id = request.getParameter("id");
		System.out.println("keyword : " + keyword);			
		
		Paging p = new Paging();
		
		p.setTotalRecord(ProductDAO.searchCount(keyword));
		System.out.println("검색된 상품 수 : " + ProductDAO.searchCount(keyword));	
		
		p.setTotalPage();
		System.out.println("> 전체 상품 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());

		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());

		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}

		System.out.println(">> 시작번호(begin) : " + p.getBegin());
		System.out.println(">> 끝번호(end) : " + p.getEnd());

		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);

		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println(">> beginPage : " + p.getBeginPage());
		System.out.println(">> endPage : " + p.getEndPage());

		int begin = p.getBegin();
		int end = p.getEnd();
		
		List<ProductPriceVO> list = new ArrayList<ProductPriceVO>();
		list = ProductDAO.getSearchList(keyword, begin, end);
		
		System.out.println("----------------------------------------------");
		System.out.println("search List : " + list);
		
		request.setAttribute("id",id);
		request.setAttribute("pvo", p);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		
		return "/cart/searchList.jsp";
	}
	
	

	
}
