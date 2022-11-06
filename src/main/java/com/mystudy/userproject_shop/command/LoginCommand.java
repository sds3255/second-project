package com.mystudy.userproject_shop.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.userps.dao.ShopDAO;


public class LoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 전달받은 파라미터값(아이디, 패스워드) 추출(확인)
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pwd", pwd);
		System.out.println("map : " + map);
		 
		//2. DB연동작업 : 해당 부서 직원정보 조회(DAO 사용)
		String loginok = ShopDAO.login(map);
		System.out.println("loginok : " + loginok);
		
		//3. 조회된 데이터를 응답페이지에서 사용토록 속성에 저장(scope상에 등록)
		if (loginok == null) {
			request.setAttribute("loginok", loginok);
			return "fail.jsp";
		}
		
		request.setAttribute("id", loginok);
		String path = "success.jsp";
		
		return path;
	}

	
}
