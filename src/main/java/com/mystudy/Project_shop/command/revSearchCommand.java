package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.common.Paging;
import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.qnaVO;

public class revSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Paging pp = new Paging();
		String path = null;
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("idx", idx);
		
		pp.setTotalRecord(ShopDAO.revSearchCount(map));
		pp.setTotalPage();
		
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			pp.setNowPage(Integer.parseInt(cPage));
		}
		
		pp.setEnd(pp.getNowPage() * pp.getNumPerPage());
		pp.setBegin(pp.getEnd() - pp.getNumPerPage() + 1);
		
		if (pp.getEnd() > pp.getTotalRecord()) pp.setEnd(pp.getTotalRecord());
		
		int nowPage = pp.getNowPage();
		int beginPage = (nowPage - 1) / pp.getNumPerBlock() *pp.getNumPerBlock() + 1;
		pp.setBeginPage(beginPage);
		pp.setEndPage(beginPage + pp.getNumPerBlock() -1);
		
		if (pp.getEndPage() > pp.getTotalPage()) pp.setEndPage(pp.getTotalPage());
		
		Map<String,String> pmap = new HashMap<String, String>();
		
		pmap.put("idx", idx);
		pmap.put("keyword", keyword);
		
		pmap.put("begin", Integer.toString(pp.getBegin()));
		pmap.put("end", Integer.toString(pp.getEnd()));
		
		
		List<qnaVO> list = ShopDAO.revSearch(pmap);
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pvo", pp);
		request.getAttribute("id");
		
		return "/bord/RevsearchView.jsp";
	}
}
