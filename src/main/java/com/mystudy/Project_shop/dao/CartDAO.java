package com.mystudy.Project_shop.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.Project_shop.vo.CartVO;
import com.mystudy.Project_shop.vo.customerVO;
import com.mystudy.Project_shop.vo.OrderListVO;
import com.mystudy.Project_shop.vo.PayInfoVO;

public class CartDAO {

	// Cart-paging처리시 사용
	public static int getTotalCount(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.totalCount3", id);
		System.out.println("totalCount:"+totalCount);
		ss.close();
		return totalCount;
	}

	// OrderList-paging처리시 사용
	public static int getTotalCnt(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.totalCnt", id);
		ss.close();
		return totalCount;
	}

	// cart클릭시 들어오는 장바구니 첫화면 목록나열&paging처리
	public static List<CartVO> getList(int begin, int end, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<CartVO> list = ss.selectList("shop.getlist1", map);
		ss.close();
		return list;
	}

	// order내역화면 목록나열&paging처리
	public static List<OrderListVO> getListOrder(int begin, int end, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("shop.getlistorder", map);
		ss.close();
		return list;
	}

	// CartCommand.java에서 사용(체크데이터만 불러와서 출력)
	public static CartVO search1(String cnum) {
		System.out.println("search들어옴");
		SqlSession ss = DBService.getFactory().openSession();
		int cnumm = Integer.parseInt(cnum);
		CartVO vo = ss.selectOne("shop.search1", cnumm);
		ss.close();
		return vo;
	}

	// UpdateCommand.java에서 사용(체크데이터만 수량변경시)
	public static void update(String cnum, String count) {
		SqlSession ss = DBService.getFactory().openSession(true);
		Map<String, Integer> map = new HashMap<String, Integer>();

		int cnumm = Integer.parseInt(cnum);
		int countt = Integer.parseInt(count);
		map.put("cNum", cnumm);
		map.put("cCount", countt);
		int u = ss.update("shop.update", map);
		ss.close();
	}

	// DeleteCommand.java에서 사용(체크데이터만 장바구니에서 삭제시)
	// PaymentCommand.java에서 사용(결제하기 누르면 장바구니에서 삭제)
	public static void delete(String cnum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int cnumm = Integer.parseInt(cnum);
		ss.delete("shop.delete", cnumm);
		ss.close();
	}

	// PaymentCommand.java에서 사용(장바구니->결제진행시)
	public static void insert(String cnum, String dname, String dadress, String dphonenum, String dmemo,
			String dpayment,int sequence, String totalPrice, String totalPayPrice) throws SQLException, Exception {
		SqlSession ss = DBService.getFactory().openSession(true);
		Map<String, Object> map = new HashMap<String, Object>();
		int cnumm = Integer.parseInt(cnum);
		int totalprice = Integer.parseInt(totalPrice);
		int totalpayprice = Integer.parseInt(totalPayPrice);
		System.out.println("dao들어롬");
		System.out.println("totalpayprice:"+totalpayprice);
		System.out.println("totalPrice:"+totalPrice);
		map.put("cNum", cnumm);
		map.put("dName", dname);
		map.put("dAdress", dadress);
		map.put("dPhonenum", dphonenum);
		map.put("dMemo", dmemo);
		map.put("dPayment", dpayment);
		map.put("sequence", sequence);
		map.put("totalprice", totalprice);
		map.put("totalpayprice", totalpayprice);
		ss.insert("shop.insert", map);

		ss.close();
		
	}

	// PaymentCommand.java에서 아이디로 주문자 찾기시에 사용
	public static customerVO searchCustomer(String id) {
		System.out.println("dao:"+id);
		SqlSession ss = DBService.getFactory().openSession();
		customerVO vo = ss.selectOne("shop.searchCustomer", id);
		ss.close();
		return vo;
	}

	// 주문/결제내역에서 장바구니담기시
	public static void CartAdd(String onum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int onumm = Integer.parseInt(onum);
		ss.insert("shop.CartAdd", onumm);
		ss.close();

	}

	// 재구매시(DetailCommand에서 실행)
	public static List<OrderListVO> getListDetail(String onum) {
		SqlSession ss = DBService.getFactory().openSession();
		System.out.println("dao:"+onum);
		int onumm = Integer.parseInt(onum);
		List<OrderListVO> vo = ss.selectList("shop.detail", onumm);
		ss.close();
		return vo;
	}

	// 재구매시(PaymentCommand에서 실행)
	public static void insertReorder(String onum, String dname, String dadress, String dphonenum, String dmemo,
			String dpayment,int sequence, String totalPrice, String totalPayPrice) {
		Map<String, Object> map = new HashMap<String, Object>();
		SqlSession ss = DBService.getFactory().openSession(true);
		int onumm = Integer.parseInt(onum);
		System.out.println("insertReorder들어옴");
		map.put("oNum", onumm);
		map.put("dName", dname);
		map.put("dAdress", dadress);
		map.put("dPhonenum", dphonenum);
		map.put("dMemo", dmemo);
		map.put("dPayment", dpayment);
		map.put("sequence", sequence);
		map.put("totalPrice", totalPrice);
		map.put("totalPayPrice", totalPayPrice);
		ss.insert("shop.insertreorder", map);
		ss.close();

	}
	public static PayInfoVO getpayinfo(String onum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int onumm = Integer.parseInt(onum);
		PayInfoVO pivo = ss.selectOne("shop.payinfo",onumm);
		return pivo;
	}

	// 결제취소(환불요청)시
	public static void refund(String onum) {
		System.out.println("dao들어옴");
		System.out.println("onum:"+onum);
		SqlSession ss = DBService.getFactory().openSession(true);
		int onumm = Integer.parseInt(onum);
		int num = ss.update("shop.refund", onumm);
		ss.close();
	}
	// 결제취소(환불요청)시
	public static void refundpayinfo(String onum) {
		System.out.println("refundpayinfoDAO들어옴");
		int onumm = Integer.parseInt(onum);
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("shop.refundpayinfo", onumm);
		ss.close();
	}

	public static List<OrderListVO> searchId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("shop.searchId", id);
		return list;
	}

	public static int sequence() {
		SqlSession ss = DBService.getFactory().openSession();
		int sequence = ss.selectOne("shop.sequence");
		ss.close();
		return sequence;
	}


}
