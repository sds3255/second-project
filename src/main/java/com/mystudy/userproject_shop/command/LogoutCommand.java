package com.mystudy.userproject_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LogoutCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null; 
		
		//1. 전달받은 파라미터값(아이디, 패스워드) 추출(확인)
		String id = request.getParameter("id");
		
		
		//조회된 데이터를 응답페이지에서 사용토록 속성에 저장(scope상에 등록)

		request.setAttribute("id", id);
		path = "logout.jsp";
		
		return path;
	}

	
	
	
	
}
