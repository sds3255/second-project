package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mystudy.Project_shop.common.TotalPrice;
import com.mystudy.Project_shop.common.Paging;
import com.mystudy.Project_shop.dao.CartDAO;
import com.mystudy.Project_shop.vo.customerVO;
import com.mystudy.Project_shop.vo.OrderListVO;
import com.mystudy.Project_shop.vo.PayInfoVO;

public class PaymentCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String funcc = request.getParameter("funcc");
		String[] cnum = request.getParameterValues("cnum");
		String[] onum = request.getParameterValues("onum");
		String oNum = request.getParameter("oNum");
		String id = request.getParameter("id");
		String cPage = request.getParameter("cPage");
		String dname = request.getParameter("dname");
		String dadress = request.getParameter("dadress");
		String dphonenum = request.getParameter("dphonenum");
		String dmemo = request.getParameter("dmemo");
		String dpayment = request.getParameter("dpayment");
		String totalPrice = request.getParameter("totalPrice");
		String totalPayPrice = request.getParameter("totalPayPrice");
		
		System.out.println("totalPrice:" + totalPrice);
		System.out.println("totalPayPrice:" + totalPayPrice);
		System.out.println("cnum:" + cnum);
		System.out.println(id);
		System.out.println(funcc);

		if (funcc.equals("cansel")) {
			return "/cart/cart.jsp";
		}
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
		List<OrderListVO> olist= new ArrayList<OrderListVO>();
		try {
			if (funcc.equals("cart")) {
				if (cnum != null) {
					System.out.println("cart실행됨");
					int sequence = CartDAO.sequence()+1;
					System.out.println("sequence" + sequence);

					for (int i = 0; i < cnum.length; i++) {
						System.out.println("for문들어옴");
						CartDAO.insert(cnum[i], dname, dadress, dphonenum, dmemo, dpayment, sequence,totalPrice,totalPayPrice);
					}
				}
			} else if (funcc.equals("reorder")) {
				System.out.println("reorder실행됨");
				int sequence = CartDAO.sequence()+1;
				for (int i = 0; i < onum.length; i++) {
					System.out.println("for문들어옴");
					CartDAO.insertReorder(onum[i], dname, dadress, dphonenum, dmemo, dpayment, sequence,totalPrice,totalPayPrice);
				}
			}
			olist = CartDAO.getListOrder(p.getBegin(), p.getEnd(), id);
		} catch (Exception e) {
			return "/cart/orderlist.jsp?cPage=" + nowPage;
		}


		System.out.println(olist.get(0) + "list출력완료");
		System.out.println(nowPage);
		System.out.println("id:"+id);

		request.setAttribute("pvo", p);
		request.setAttribute("id", id);
		request.setAttribute("olist", olist);
		request.setAttribute("cPage", cPage);

		if (funcc.equals("detail")) {
			response.setContentType("text/javascript; charset=UTF-8");
			System.out.println("상세보기들어옴!!!!!!");
			List<OrderListVO> dlist = new ArrayList<OrderListVO>();
			TotalPrice tpp = new TotalPrice();
			if (onum != null) {
				System.out.println(">>DetailController doGet실행");
				System.out.println(onum[0]);


				System.out.println("detail for문들어옴" + oNum);
				
				dlist = CartDAO.getListDetail(onum[0]);
				PayInfoVO pivo = CartDAO.getpayinfo(onum[0]);
				customerVO cvo = CartDAO.searchCustomer(id);
				System.out.println("pivoonum:"+pivo.getoNum());
				System.out.println("getPayprice:"+pivo.getPayprice());
				System.out.println("getPrice:"+pivo.getPrice());
				System.out.println("pivodate:"+pivo.getoDate());
				System.out.println(dlist.get(0).getProductName());
				System.out.println(dlist.get(0).getoNum());

				tpp.setTquant(dlist.get(0).getcCount());
				tpp.setTotalPrice(dlist.get(0).getPrice());
				tpp.setTotalSalePrice(dlist.get(0).getSaleprice());
				tpp.tpp();

				request.setAttribute("dvo", dlist);
				request.setAttribute("pivo", pivo);
				request.setAttribute("cvo", cvo);
				request.setAttribute("tpp", tpp);
				
				System.out.println("이제간다");
				System.out.println("nowPage" + nowPage);
				System.out.println("cPage" + cPage);

				return "/cart/detail.jsp?cPage=" + nowPage+"&onum="+onum[0];

			}
		}
		System.out.println("페이지이동준비 완료");
		return "/cart/orderlist.jsp?cPage=" + cPage;

	}
}
