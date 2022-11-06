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
		System.out.println(category);
		String id  = request.getParameter("id");		
		System.out.println("id:"+id);

		
		if (category.equals("all")) {
			System.out.println("all들어옴");
			p.setTotalRecord(ProductDAO.getTotalCount2());
		} else if (category.equals("PC001")||category.equals("AC002")) {
			System.out.println("PC001들어옴");
			p.setTotalRecord(ProductDAO.getTotalCount(category));
		}
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

		if (category.equals("all")) {
			System.out.println("all222222222222");
			list2 = ProductDAO.getList2(p.getBegin(), p.getEnd());
		} else if (category.equals("PC001")||category.equals("AC002")) {
			System.out.println("PC0012222222222222");
			System.out.println("category:"+category);
			list2 = ProductDAO.getList(p.getBegin(), p.getEnd(), category);
		}

		System.out.println(">> 현재페이지 글목록(list) : " + list2);
		//request.setAttribute("category", list2);
		request.setAttribute("paging", p);
		request.setAttribute("id",id);
		request.setAttribute("plist", list2);
		request.setAttribute("pvo", p);
		request.setAttribute("category", category);
		return "/cart/list.jsp";

	}

}
