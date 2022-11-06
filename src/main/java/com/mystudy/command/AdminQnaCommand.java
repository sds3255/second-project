package com.mystudy.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.common.AdminPaging;
import com.mystudy.dao.AdminAnswerDAO;
import com.mystudy.dao.AdminQnaAnswerDAO;
import com.mystudy.dao.AdminQnaDAO;
import com.mystudy.vo.AdminAnswerVO;
import com.mystudy.vo.AdminQnaAnswerVO;
import com.mystudy.vo.AdminQnaVO;

public class AdminQnaCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminPaging p = new AdminPaging();
		p.setNumPerPage(6); //한페이지에 출력될 게시글수
		
		p.setTotalRecord(AdminQnaDAO.getTotalCountQna());
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
		
		//=============================================================
		
		List<AdminQnaVO> nowpageList = AdminQnaDAO.qnaList(p.getBegin(), p.getEnd());
		System.out.println(">> 현재페이지 게시글목록 : " + nowpageList);
		System.out.println(">> 현재페이지 게시글갯수 : " + nowpageList.size());
		
		//=============================================================
	
		List<AdminQnaVO> qnaList = AdminQnaDAO.selectQnaAll();
		List<AdminAnswerVO> answer = AdminAnswerDAO.AnswerAllList();
		
		//=============================================================

		List<AdminQnaAnswerVO> all = new ArrayList<AdminQnaAnswerVO>();
		List<Integer> yesAnswerQuestionNum = new ArrayList<>();
		
		for (int i = 0; i < nowpageList.size(); i++) {
			AdminQnaAnswerVO qnaAnswerVo = AdminQnaAnswerDAO.selectQnaAnswer(nowpageList.get(i).getqNum());
			if (qnaAnswerVo != null) {
				all.add(qnaAnswerVo);
				yesAnswerQuestionNum.add(nowpageList.get(i).getqNum());
			} 
		}

		//2.데이터를 응답할 페이지에 전달
	 	request.setAttribute("nowpageList", nowpageList);
	 	request.setAttribute("QnaSize", qnaList.size());
	 	request.setAttribute("AnswerSize", answer.size());
	 	request.setAttribute("all", all);
	 	request.setAttribute("yesAnswerQuestionNum", yesAnswerQuestionNum);
		request.setAttribute("pvo", p);
		request.setAttribute("cPage", p.getNowPage());
		System.out.println("cPage : " + p.getNowPage());
		
		//3. 페이지 전환 - 응답할 페이지
		return "admin-qna.jsp";
	}

}
