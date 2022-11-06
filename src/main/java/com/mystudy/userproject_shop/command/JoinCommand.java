package com.mystudy.userproject_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.vo.customerVO;
import com.mystudy.userps.dao.ShopDAO;

public class JoinCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customerVO vo = new customerVO();
		String path = null;
		
		String id = request.getParameter("id");
		
		//파라미터값 추출해서 vo에 저장
		vo.setName(request.getParameter("name"));
		vo.setId(id);
		vo.setPwd(request.getParameter("pwd"));
		vo.setAddr(request.getParameter("addr"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		
		String idok = ShopDAO.idcheck(id);
		//int join = ShopDAO.join(vo);
		
		//조회된 데이터를 응답페이지에서 사용토록 속성에 저장
		//request.getRequestDispatcher("join");
		
		if (idok == null) { //회원가입 시 기존에 가입된 id와 중복되지 않으면 로그인 페이지로
			ShopDAO.join(vo);
			request.setAttribute("idok", idok);
			path = "login.jsp";
			return path;
		} else if (idok != null) { //기존 가입된 id와 중복될 경우 다시 회원가입 페이지로
			request.setAttribute("idok", idok);
			path = "join.jsp";
			return path;
		}
		return path;
	}

	
	
}
