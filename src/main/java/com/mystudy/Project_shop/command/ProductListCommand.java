package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ProductDAO;
import com.mystudy.Project_shop.vo.ProductPriceVO;
import com.mystudy.Project_shop.common.Paging;

public class ProductListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String category = request.getParameter("category");
		Paging p = new Paging();
		List<ProductPriceVO> list2 = new ArrayList<ProductPriceVO>();
		String id  = request.getParameter("id");		
		
		if (category.equals("all")) {
			p.setTotalRecord(ProductDAO.getTotalCount2());
		} else if (category.equals("PC001")||category.equals("AC002")) {
			p.setTotalRecord(ProductDAO.getTotalCount(category));
		}
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

		if (category.equals("all")) {
			list2 = ProductDAO.getList2(p.getBegin(), p.getEnd());
		} else if (category.equals("PC001")||category.equals("AC002")) {
			list2 = ProductDAO.getList(p.getBegin(), p.getEnd(), category);
		}

		request.setAttribute("paging", p);
		request.setAttribute("id",id);
		request.setAttribute("plist", list2);
		request.setAttribute("pvo", p);
		request.setAttribute("category", category);
		return "/cart/list.jsp";
	}
}
