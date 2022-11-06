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

		if(id=="") {
			request.setAttribute("id", id);
			System.out.println("if문들어옴, id=null");
			return "/user/login.jsp";
		}

		System.out.println("cart들어옴");
		System.out.println("------------------------");
		System.out.println(id);
		System.out.println("funcc:" + funcc);

		List<CartVO> plist = new ArrayList<CartVO>();
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
			System.out.println(p.getTotalRecord());
			// 네비게이션 바에서 cart누름
			if (funcc.equals("cartin")) {
				System.out.println("cartin들어옴");
				System.out.println("cPage:" + nowPage);
				System.out.println("list" + list);
				System.out.println("id:" + id);

				request.setAttribute("cPage", nowPage);
				request.setAttribute("list", list);
				request.setAttribute("pvo", p);
				request.setAttribute("id", id);
				return "/cart/cart.jsp";

				// 결제하기
			} else if (funcc.equals("cart")) {
				System.out.println("cart들어옴");
				String[] cnum = request.getParameter("chk2").split(",");
				for (int i = 0; i < cnum.length; i++) {
					System.out.println(cnum[i]+",");
					System.out.println("if문들어옴");
					plist.add(CartDAO.search1(cnum[i]));
				}
				customerVO vo = CartDAO.searchCustomer(id);
				System.out.println("list실행완료");
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

						System.out.println("size:" + plist.size());
						System.out.println("quant:" + pp.getcCount());

						System.out.println("---------------");
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
				System.out.println("삭제들어옴");
				String[] cnum = request.getParameter("chk2").split(",");
				System.out.println(cnum.length);
				for (int i = 0; i < cnum.length; i++) {
					System.out.println("cnum[i]" + cnum[i]);
					System.out.println("if문들어옴");
					CartDAO.delete(cnum[i]);
				}
					list = CartDAO.getList(p.getBegin(), p.getEnd(), id);
					System.out.println(cPage);
					request.setAttribute("cPage", nowPage);
					request.setAttribute("pvo", p);
					request.setAttribute("list", list);
					request.setAttribute("id", id);
					return "/cart/cart.jsp";
				

				// 장바구니 수량변경시
			} else if (funcc.equals("update")) {
				System.out.println("수정들어옴");
				String cnumr = request.getParameter("cnum");
				String count = request.getParameter("count");
				System.out.println("cnum:"+cnumr);
				System.out.println("count:"+count);
				System.out.println("update들어옴");
				CartDAO.update(cnumr, count);
				list = CartDAO.getList(p.getBegin(), p.getEnd(), id);
				System.out.println(nowPage);
				
				request.setAttribute("cnum", cnumr);
				request.setAttribute("count", count);
				request.setAttribute("cPage", nowPage);
				request.setAttribute("pvo", p);
				request.setAttribute("list", list);
				request.setAttribute("id", id);
				return "/cart/cart.jsp";
			}
		} catch (Exception e) {
			System.out.println("exception발생");
			e.printStackTrace();
			return "/cart/updateOrder.jsp";
		}
		return "/cart/payment.jsp";
	}
}
