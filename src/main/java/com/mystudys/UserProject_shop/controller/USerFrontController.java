package com.mystudys.UserProject_shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import com.mystudy.shop.command.DeleteCheckCommand;
import com.mystudy.shop.command.DeleteCustomerCommand;
import com.mystudy.shop.command.DetailCustomerCommand;
import com.mystudy.shop.command.JoinCommand;
import com.mystudy.shop.command.LoginCommand;
import com.mystudy.shop.command.Login_okCommand;
import com.mystudy.shop.command.LogoutCommand;
import com.mystudy.shop.command.MypageCommand;
import com.mystudy.shop.command.UpdateCustomerCommand;
import com.mystudy.shop.command.UpdateOkCommand;
import com.mystudy.shop.dao.ShopDAO;
import com.mystudy.shop.vo.ShopVO;*/
import com.mystudy.userproject_shop.command.Command;
import com.mystudy.userproject_shop.command.DeleteCheckCommand;
import com.mystudy.userproject_shop.command.DeleteCustomerCommand;
import com.mystudy.userproject_shop.command.DetailCustomerCommand;
import com.mystudy.userproject_shop.command.JoinCommand;
import com.mystudy.userproject_shop.command.LoginCommand;
import com.mystudy.userproject_shop.command.Login_okCommand;
import com.mystudy.userproject_shop.command.LogoutCommand;
import com.mystudy.userproject_shop.command.MypageCommand;
import com.mystudy.userproject_shop.command.UpdateCustomerCommand;
import com.mystudy.userproject_shop.command.UpdateOkCommand;
import com.mystudy.userproject_shop.command.idFindCommand;
import com.mystudy.userproject_shop.command.pwFindCommand;

@WebServlet("/user/controller")
public class USerFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행-------------");
		String type = request.getParameter("type");
		System.out.println("type : " + type);
		
		Command command = null;
		if ("join".equals(type)) { //회원가입
			command = new JoinCommand();
		} else if ("login".equals(type)) { //로그인
			command = new LoginCommand();
		} else if("shoplogin".equals(type)) { //로그인후 화면이동
			command = new Login_okCommand();
		} else if ("detail_customer".equals(type)) { //회원정보 조회
			command = new DetailCustomerCommand();
		} else if ("update_customer".equals(type)) { //회원정보 수정
			command = new UpdateCustomerCommand();
		} else if ("updateOk".equals(type)) { //회원정보 수정 완료 시
			command = new UpdateOkCommand();
		} else if ("deletecheck".equals(type)) { //회원탈퇴 전 확인
			command = new DeleteCheckCommand();
		} else if ("delete_customer".equals(type)) { //회원 탈퇴
			command = new DeleteCustomerCommand();	
		} else if ("mypage".equals(type)) { //마이페이지
			command = new MypageCommand();
		} else if ("logout".equals(type)) { //로그아웃
			command = new LogoutCommand();
		} else if ("find".equals(type)) { //로그아웃
			command = new idFindCommand();
		} else if ("findpw".equals(type)) { //로그아웃
			command = new pwFindCommand();
		}
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행-------------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
