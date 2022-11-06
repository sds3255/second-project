package com.mystudy.userproject_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.vo.customerVO;
import com.mystudy.userps.dao.ShopDAO;


public class DetailCustomerCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 전달받은 파라미터값(아이디, 패스워드) 추출(확인)
		String id = request.getParameter("id");

		
		//2. DB연동작업 : 해당 부서 직원정보 조회(DAO 사용)
		customerVO vo = ShopDAO.select(id);
		System.out.println("vo : " + vo);
		
		//3. 조회된 데이터를 응답페이지에서 사용토록 속성에 저장(scope상에 등록)
		request.setAttribute("vo", vo);
		
		//4. 응답페이지로 응답 위임 처리
		//request.getRequestDispatcher("detail_customer.jsp").forward(request, response);
		
		return "detail_customer.jsp";
		
	}

}
