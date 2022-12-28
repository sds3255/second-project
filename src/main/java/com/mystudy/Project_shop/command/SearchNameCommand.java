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
		Paging p = new Paging();
		
		p.setTotalRecord(ProductDAO.searchCount(keyword));
		
		p.setTotalPage();
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}

		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);

		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		int begin = p.getBegin();
		int end = p.getEnd();
		
		List<ProductPriceVO> list = new ArrayList<ProductPriceVO>();
		list = ProductDAO.getSearchList(keyword, begin, end);
		request.setAttribute("id",id);
		request.setAttribute("pvo", p);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		
		return "/cart/searchList.jsp";
	}
}
