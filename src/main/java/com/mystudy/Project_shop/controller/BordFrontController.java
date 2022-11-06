package com.mystudy.Project_shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.command.Command;
import com.mystudy.Project_shop.command.Qwrite_okCommand;
import com.mystudy.Project_shop.command.RwwirteCommand;
import com.mystudy.Project_shop.command.cmtDeleteCommand;
import com.mystudy.Project_shop.command.cmtInertCommand;
import com.mystudy.Project_shop.command.cmtUpdateCommand;
import com.mystudy.Project_shop.command.deleteCommand;
import com.mystudy.Project_shop.command.deleteQnaCommand;
import com.mystudy.Project_shop.command.modifyCommand;
import com.mystudy.Project_shop.command.qnamodifyCommand;
import com.mystudy.Project_shop.command.rDeleteCommand;
import com.mystudy.Project_shop.command.rModifyCommand;
import com.mystudy.Project_shop.command.rModify_okCommand;
import com.mystudy.Project_shop.command.revSearchCommand;
import com.mystudy.Project_shop.command.searchCommand;
import com.mystudy.Project_shop.command.searchCommand2;
import com.mystudy.Project_shop.command.updateQnaCommand2;

@WebServlet("/bord")
public class BordFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		Command cm = null;
		System.out.println("type~!~!" + type);
		
		if("qna".equals(type)) {
			request.getRequestDispatcher("qna.jsp").forward(request, response);
		} else if ("modify".equals(type)) {
			cm = new modifyCommand();
		} else if("qnaModify".equals(type)) {
			cm = new qnamodifyCommand();
		} else if("update_qna".equals(type)) {
			cm = new updateQnaCommand2();
		} else if("delete".equals(type)) {
			cm = new deleteCommand();
		} else if("deleteqna".equals(type)) {
			cm = new deleteQnaCommand();
		} else if("search".equals(type)) {
			cm = new searchCommand2();
		} else if("Rwrite_ok".equals(type)) {
			cm = new RwwirteCommand();
		} else if("rModify".equals(type)) {
			cm = new rModifyCommand();
		} else if("rModify_ok".equals(type)) {
			cm = new rModify_okCommand();
		} else if("rDelete".equals(type)) {
			cm = new rDeleteCommand();
		} else if("cmtInsert".equals(type)) {
			cm = new cmtInertCommand();
		} else if("cmtDelete".equals(type)) {
			cm = new cmtDeleteCommand();
		} else if("cmtUpdate".equals(type)) {
			cm = new cmtUpdateCommand();
		} else if("revSearch".equals(type)) {
			cm = new revSearchCommand();
		} else if("Qwrite_ok".equals(type)) {
			cm = new Qwrite_okCommand();
		}
		
		
		System.out.println("여기까지 흘러내린다고??");
		String path = cm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
