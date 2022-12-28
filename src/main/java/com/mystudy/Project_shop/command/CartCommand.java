package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.common.Paging;
import com.mystudy.Project_shop.common.TotalPrice;
import com.mystudy.Project_shop.dao.CartDAO;
import com.mystudy.Project_shop.vo.CartVO;
import com.mystudy.Project_shop.vo.customerVO;
public class CartCommand implements Command {


	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String funcc = request.getParameter("funcc");
		String id = request.getParameter("id");
		String cPage = request.getParameter("cPage");
		List<CartVO> plist = new ArrayList<CartVO>();

		if(id=="") {
			request.setAttribute("id", id);
			return "/user/login.jsp";
		}

		// cart에서 결제하기클릭시
		try {
			Paging p = new Paging();
			// 1. 전체 게시물 수량 구하기
			p.setTotalRecord(CartDAO.getTotalCount(id));
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
			int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;//오류나면 PerPage로 고쳐보기
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getNumPerBlock() - 1);
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			List<CartVO> list = CartDAO.getList(p.getBegin(), p.getEnd(), id);
			// 네비게이션 바에서 cart누름
			if (funcc.equals("cartin")) {
				request.setAttribute("cPage", nowPage);
				request.setAttribute("list", list);
				request.setAttribute("pvo", p);
				request.setAttribute("id", id);
				return "/cart/cart.jsp";

				// 결제하기
			} else if (funcc.equals("cart")) {
				String[] cnum = request.getParameter("chk2").split(",");
				for (int i = 0; i < cnum.length; i++) {
					plist.add(CartDAO.search1(cnum[i]));
				}
				customerVO vo = CartDAO.searchCustomer(id);
				// (금액)
				TotalPrice tp = new TotalPrice();
				int price=0 ;
				int payprice =0;
				if (plist.size() <= 1) {
					for (CartVO pp : plist) {
						if (pp.getSaleprice() == 0) {
							price+=pp.getPrice()* pp.getcCount(); 
							payprice+=pp.getPrice()* pp.getcCount(); 

						} else {
							price+=pp.getPrice()* pp.getcCount(); 
							payprice+=pp.getSaleprice()*pp.getcCount();
						}
					}
				} else {

					for (CartVO pp : plist) {
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

				request.setAttribute("tp", tp);
				request.setAttribute("choose", "cart");
				request.setAttribute("plist", plist);
				request.setAttribute("cvo", vo);
				request.setAttribute("id", id);
				return "/cart/payment.jsp?cPage=" + cPage;

				// 장바구니 삭제시
			} else if (funcc.equals("del")) {
				String[] cnum = request.getParameter("chk2").split(",");
				for (int i = 0; i < cnum.length; i++) {
					CartDAO.delete(cnum[i]);
				}
					list = CartDAO.getList(p.getBegin(), p.getEnd(), id);
					request.setAttribute("cPage", nowPage);
					request.setAttribute("pvo", p);
					request.setAttribute("list", list);
					request.setAttribute("id", id);
					return "/cart/cart.jsp";
				

				// 장바구니 수량변경시
			} else if (funcc.equals("update")) {
				String cnumr = request.getParameter("cnum");
				String count = request.getParameter("count");
				CartDAO.update(cnumr, count);
				list = CartDAO.getList(p.getBegin(), p.getEnd(), id);
				
				request.setAttribute("cnum", cnumr);
				request.setAttribute("count", count);
				request.setAttribute("cPage", nowPage);
				request.setAttribute("pvo", p);
				request.setAttribute("list", list);
				request.setAttribute("id", id);
				return "/cart/cart.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "/cart/updateOrder.jsp";
		}
		return "/cart/payment.jsp";
	}
}
