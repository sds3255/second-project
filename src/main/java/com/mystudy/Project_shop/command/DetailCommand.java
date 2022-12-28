package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.common.Paging;
import com.mystudy.Project_shop.common.TotalPrice;
import  com.mystudy.Project_shop.dao.CartDAO;
import com.mystudy.Project_shop.vo.CartVO;
import  com.mystudy.Project_shop.vo.customerVO;
import  com.mystudy.Project_shop.vo.OrderListVO;

public class DetailCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String funcc = request.getParameter("funcc");
		String[] onum = request.getParameterValues("onum");
		String oNum = request.getParameter("oNum");
		String cPage = request.getParameter("cPage");
		String id = request.getParameter("id");

		Paging p = new Paging();
		p.setTotalRecord(CartDAO.getTotalCnt(id));
		p.setTotalPage();
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		// 장바구니담기 -완료
		if (funcc.equals("cartadd")) {
			CartDAO.CartAdd(oNum);
			List<CartVO> list = CartDAO.getList(p.getBegin(), p.getEnd(), id);
			request.setAttribute("pvo", p);
			request.setAttribute("list", list);
			request.setAttribute("id", id);
			return "/cart/cart.jsp";
			// 결제취소(환불) -완료
		} else if (funcc.equals("refund")) {
			CartDAO.refund(oNum);
			CartDAO.refundpayinfo(oNum);
			List<OrderListVO> olist = CartDAO.getListOrder(p.getBegin(), p.getEnd(), id);
			request.setAttribute("pvo", p);
			request.setAttribute("olist", olist);
			request.setAttribute("id", id);
			return "/cart/orderlist.jsp?cPage=" + cPage;
			// 재구매 -완료
		} else if (funcc.equals("reorder")) {
			List<OrderListVO> ovo = CartDAO.getListDetail(onum[0]);
			TotalPrice tp = new TotalPrice();
			int price=0 ;
			int payprice =0;
			if (ovo.size() <= 1) {
				for (OrderListVO pp : ovo) {
					if (pp.getSaleprice() == 0) {
						price+=pp.getPrice()* pp.getcCount(); 
						payprice+=pp.getPrice()* pp.getcCount(); 
					} else {
						price+=pp.getPrice()* pp.getcCount(); 
						payprice+=pp.getSaleprice()*pp.getcCount();
					}
				}
			} else {
				for (OrderListVO pp : ovo) {
					if (pp.getSaleprice() == 0) {	
						price+=pp.getPrice()* pp.getcCount(); 
						payprice+=pp.getPrice()* pp.getcCount(); 
					} else {
						price+=pp.getPrice()* pp.getcCount(); 
						payprice+=pp.getSaleprice()*pp.getcCount();
					}
				}
			}
			tp.setTotalPrice(price);
			tp.setTotalPayPrice(payprice);

			customerVO vo = CartDAO.searchCustomer(id);

			request.setAttribute("tp", tp);
			request.setAttribute("cvo", vo);
			request.setAttribute("ovo", ovo);
			request.setAttribute("choose", "reorder");
			request.setAttribute("id", id);
			return "/cart/payment.jsp";
		} else if (funcc.equals("review")) {
			return "/bord/revWrite.jsp?id=" + id;
		} else if (funcc.equals("qna")) {
			return "/bord/qnaWrite.jsp?id=" + id;
		}
		return "/cart/cart.jsp";
	}
}
