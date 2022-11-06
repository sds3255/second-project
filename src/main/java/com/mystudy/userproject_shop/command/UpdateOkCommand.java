package com.mystudy.userproject_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.userps.dao.ShopDAO;
import com.mystudy.Project_shop.vo.*;

public class UpdateOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		customerVO vo = new customerVO();
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		vo.setId(id);
		vo.setName(request.getParameter("name"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setAddr(request.getParameter("addr"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		
		System.out.println("vo : " + vo);
		
		//2. DB연동작업 : 회원정보 수정내역 조회(DAO 사용)
		int result = ShopDAO.updateok(vo);
		System.out.println("result : " + result);
		
		//3. 조회된 데이터를 응답페이지에서 사용토록 속성에 저장(scope상에 등록)
		request.setAttribute("result", result);
		String path = "controller?type=detail_customer&id=" + id;
		
		return path;	
	}
}
