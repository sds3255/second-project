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
		System.out.println("cPage:::::::::::" + cPage);
		System.out.println(funcc);
		System.out.println("detail id:"+id);

		System.out.println(onum);
		Paging p = new Paging();
		p.setTotalRecord(CartDAO.getTotalCnt(id));
		System.out.println("getTotalRecord:" + p.getTotalRecord());
		p.setTotalPage();
		System.out.println("getTotalPage:" + p.getTotalPage());
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		System.out.println(">> 시작번호(begin) : " + p.getBegin());
		System.out.println(">> 끝번호(end) : " + p.getEnd());
		
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println(">> beginPage : " + p.getBeginPage());
		System.out.println(">> endPage : " + p.getEndPage());
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
			System.out.println("refund들어옴");
			System.out.println("onum:"+oNum);
			CartDAO.refund(oNum);
			CartDAO.refundpayinfo(oNum);
			System.out.println("dao실행완료");
			List<OrderListVO> olist = CartDAO.getListOrder(p.getBegin(), p.getEnd(), id);
			System.out.println("현재페이지 글목록(list) : " + olist);
			request.setAttribute("pvo", p);
			request.setAttribute("olist", olist);
			request.setAttribute("id", id);
			return "/cart/orderlist.jsp?cPage=" + cPage;
			// 재구매 -완료
		} else if (funcc.equals("reorder")) {
			System.out.println("재구매 들어옴");
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
					System.out.println("getPrice:"+pp.getPrice());
					System.out.println("getPrice:"+pp.getSaleprice());

					if (pp.getSaleprice() == 0) {	
						price+=pp.getPrice()* pp.getcCount(); 
						payprice+=pp.getPrice()* pp.getcCount(); 

						System.out.println("payprice:"+payprice);
						System.out.println("tp : :"+tp);
					} else {
						price+=pp.getPrice()* pp.getcCount(); 
						payprice+=pp.getSaleprice()*pp.getcCount();
						System.out.println("payprice:"+payprice);
						System.out.println("price:"+price);
						System.out.println("tp : :"+tp);
					}
					System.out.println("---------------");
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
