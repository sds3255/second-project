package com.mystudy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.AdminCommentAddCommand;
import com.mystudy.command.AdminCommentAddSearchCommand;
import com.mystudy.command.AdminCommentDeleteCommand;
import com.mystudy.command.AdminCommentDeleteSearchCommand;
import com.mystudy.command.AdminReviewCommand;
import com.mystudy.command.AdminReviewDetailCommand;
import com.mystudy.command.AdminReviewDetailSearchCommand;
import com.mystudy.command.AdminReviewrSearchCommand;
import com.mystudy.command.AdminAnswerAddCommand;
import com.mystudy.command.AdminAnswerAddResultCommand;
import com.mystudy.command.AdminAnswerDeleteCommand;
import com.mystudy.command.AdminAnswerDetailAddCommand;
import com.mystudy.command.AdminAnswerDetailCommand;
import com.mystudy.command.AdminQnaDetailExpectedCommand;
import com.mystudy.command.AdminAnswerExpectedCommand;
import com.mystudy.command.AdminAnswerUpdateCommand;
import com.mystudy.command.AdminCommand;
import com.mystudy.command.AdminMemberCommand;
import com.mystudy.command.AdminMemberSearchCommand;
import com.mystudy.command.AdminOrderCommand;
import com.mystudy.command.AdminOrderDetailCommand;
import com.mystudy.command.AdminOrderDetailSearchCommand;
import com.mystudy.command.AdminOrderSearchCommand;
import com.mystudy.command.AdminProductAddCommand;
import com.mystudy.command.AdminProductCommand;
import com.mystudy.command.AdminProductDeleteCommand;
import com.mystudy.command.AdminProductSearchCommand;
import com.mystudy.command.AdminProductUpdateCommand;
import com.mystudy.command.AdminQnaCommand;
import com.mystudy.command.AdminQnaDetailCommand;
import com.mystudy.command.AdminQnaDetailSearchCommand;
import com.mystudy.command.AdminQnaSearchCommand;

@WebServlet("/controller")
public class AdminControllerCommand extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		AdminCommand command = null;
		if ("admin-member".equals(type)) {
			command = new AdminMemberCommand();
		} else if ("admin-memberList".equals(type)) {
			command = new AdminMemberSearchCommand();
		} else if ("admin-product".equals(type)) {
			command = new AdminProductCommand();
		} else if ("admin-productList".equals(type)) {
			command = new AdminProductSearchCommand();
		} else if ("admin-productAdd".equals(type)) {
			command = new AdminProductAddCommand();
		} else if ("admin-productUpdate".equals(type)) {
			command = new AdminProductUpdateCommand();
		} else if ("admin-productDelete".equals(type)) {
			command = new AdminProductDeleteCommand();
		} else if ("admin-qna".equals(type)) {
			command = new AdminQnaCommand();
		} else if ("admin-qnaDetail".equals(type)) {
			command = new AdminQnaDetailCommand();
		} else if ("admin-answerAdd".equals(type)) {
			command = new AdminAnswerAddCommand();
		} else if ("admin-answerAddresult".equals(type)) {
			command = new AdminAnswerAddResultCommand();
		} else if ("admin-answerDetail".equals(type)) {
			command = new AdminAnswerDetailCommand();
		} else if ("admin-answerDelete".equals(type)) {
			command = new AdminAnswerDeleteCommand();
		} else if ("admin-answerUpdate".equals(type)) {
			command = new AdminAnswerUpdateCommand();
		} else if ("admin-order".equals(type)) {
			command = new AdminOrderCommand();
		} else if ("admin-orderList".equals(type)) {
			command = new AdminOrderSearchCommand();
		} else if ("admin-orderDetail".equals(type)) {
			command = new AdminOrderDetailCommand();
		} else if ("admin-qnaList".equals(type)) {
			command = new AdminQnaSearchCommand();
		} else if ("admin-answerExpected".equals(type)) {
			command = new AdminAnswerExpectedCommand();
		} else if ("admin-review".equals(type)) {
			command = new AdminReviewCommand();
		} else if ("admin-reviewList".equals(type)) {
			command = new AdminReviewrSearchCommand();
		} else if ("admin-reviewDetail".equals(type)) {
			command = new AdminReviewDetailCommand();
		} else if ("admin-commentAdd".equals(type)) {
			command = new AdminCommentAddCommand();
		} else if ("admin-commentDelete".equals(type)) {
			command = new AdminCommentDeleteCommand();
		} else if ("admin-reviewDetailSearch".equals(type)) {
			command = new AdminReviewDetailSearchCommand();
		} else if ("admin-commentAddSearch".equals(type)) {
			command = new AdminCommentAddSearchCommand();
		} else if ("admin-commentDeleteSearch".equals(type)) {
			command = new AdminCommentDeleteSearchCommand();
		} else if ("admin-qnaDetailSearch".equals(type)) {
			command = new AdminQnaDetailSearchCommand();
		} else if ("admin-answerDetailAdd".equals(type)) {
			command = new AdminAnswerDetailAddCommand();
		} else if ("admin-qnaDetailExpected".equals(type)) {
			command = new AdminQnaDetailExpectedCommand();
		} else if ("admin-orderDetailSearch".equals(type)) {
			command = new AdminOrderDetailSearchCommand();
		}
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost() 실행");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
