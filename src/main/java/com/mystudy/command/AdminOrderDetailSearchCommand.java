package com.mystudy.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.dao.AdminOrderDAO;
import com.mystudy.vo.AdminOrderVO;

public class AdminOrderDetailSearchCommand implements AdminCommand{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. DB연결하고 데이터 가져오기
		int oNum = Integer.parseInt(request.getParameter("oNum"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		String select = request.getParameter("select");
		String keyword = request.getParameter("keyword");
		
		List<AdminOrderVO> list = AdminOrderDAO.adminDetailOrderList(oNum);

		int totalPrice = 0;
		for (int i = 0; i < list.size(); i ++) {
			if (list.get(i).getSaleprice() == 0) {
				totalPrice += list.get(i).getPrice();
			} else {
				totalPrice += list.get(i).getSaleprice();
			}
		}
		
		//2.데이터를 응답할 페이지에 전달
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("select", select);
		request.setAttribute("keyword", keyword);
		request.setAttribute("oNum", oNum);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("id", list.get(0).getId());
		request.setAttribute("oPayment", list.get(0).getoPayment());
		request.setAttribute("receiver", list.get(0).getReceiver());
		request.setAttribute("oAddr", list.get(0).getoAddr());
		request.setAttribute("oPhone", list.get(0).getoPhone());
		request.setAttribute("memo", list.get(0).getMemo());
		request.setAttribute("oDate", list.get(0).getoDate());
		request.setAttribute("payment", list.get(0).getPayment());
		
		//3. 페이지 전환 - 응답할 페이지
		return "admin-orderDetailSearch.jsp";
	}

}
