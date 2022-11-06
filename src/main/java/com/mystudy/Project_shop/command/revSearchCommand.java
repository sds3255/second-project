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
		
		/* int cnt = Integer.parseInt(); */
		//int sdf =  Integer.parseInt(request.getParameter("cnt"));
		 
		String path = null;
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println("idx : ~!~!!" + idx);
		System.out.println("keyword" + keyword);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("idx", idx);
		
		//전체 게시물 수량 구하기
		pp.setTotalRecord(ShopDAO.revSearchCount(map));
		pp.setTotalPage();
		System.out.println(">전체 게시글 수 확인 : " + pp.getTotalRecord());
		System.out.println(">전체 페이지 수 확인 : " + pp.getTotalPage());
		
		//현재페이지 구하기
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			pp.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + pp.getNowPage());
		
		// 3. 현재 페이지 표시할 게시글 시작번호(begin) 끝번호(end) 구하기
		pp.setEnd(pp.getNowPage() * pp.getNumPerPage());
		pp.setBegin(pp.getEnd() - pp.getNumPerPage() + 1);
		
		// 3-1. 끝 번호가 건수보다 많으면 -> 끝번호 = 건수 로 처리
		if (pp.getEnd() > pp.getTotalRecord()) pp.setEnd(pp.getTotalRecord());
		
		System.out.println(">> 시작번호(begin) : " + pp.getBegin());
		System.out.println(">> 끝번호(end) : " + pp.getEnd());
		
		// ------블록(block) 계산하기 ---------------------------
			// 4. 블록의 시작 페이지, 끝 페이지 구하기 (우리가 쓸 수 있는 것은 현제페이지 번호)
		int nowPage = pp.getNowPage();
		int beginPage = (nowPage - 1) / pp.getNumPerBlock() *pp.getNumPerBlock() + 1;
		pp.setBeginPage(beginPage);
		pp.setEndPage(beginPage + pp.getNumPerBlock() -1);
		
		// 끝페이지(endPage)가 전체 페이지 수 (totalPage)보다 크면 -> 끝페이지 = 전체페이지수
		if (pp.getEndPage() > pp.getTotalPage()) pp.setEndPage(pp.getTotalPage());
		
		System.out.println("> beginPage : " + pp.getBeginPage());
		System.out.println("> endPage : " + pp.getEndPage());
		
		//데이터 가져오기!!!!!!!!!!!!!!!!!
		/* List<qnaVO> list = ShopDAO.getlist(pp.getBegin(), page.getEnd());
		System.out.println(list); */
		
		System.out.println("연결!?!?@?!?@!@");
		
		Map<String,String> pmap = new HashMap<String, String>();
		
		pmap.put("idx", idx);
		pmap.put("keyword", keyword);
		
		pmap.put("begin", Integer.toString(pp.getBegin()));
		pmap.put("end", Integer.toString(pp.getEnd()));
		
		System.out.println("!!!!!!!!!!!end : " + pp.getEnd());
		
		List<qnaVO> list = ShopDAO.revSearch(pmap);
	/* 	List<qnaVO> list = request.getParameter("list");
		pageContext.setAttribute("list", list);
		pageContext.setAttribute("pvo", p); */
		System.out.println("map : " + pmap);
		System.out.println("list : " + list);
		
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pvo", pp);
		

		request.getAttribute("id");
		
		return "/bord/RevsearchView.jsp";
	}

}
