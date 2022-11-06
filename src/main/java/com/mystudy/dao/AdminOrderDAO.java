package com.mystudy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatiss.DBService;
import com.mystudy.vo.AdminOrderVO;

public class AdminOrderDAO {
	
	public static List<AdminOrderVO> selectOrderAll() {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminOrderVO> list = ss.selectList("shop.adminselectOrderAll");
		ss.close();
		return list;
	}
	
	public static AdminOrderVO selectOrderOnum(int oNum) {
		SqlSession ss = DBService.getFactory().openSession();
		AdminOrderVO vo = ss.selectOne("shop.adminselectOrderOnum", oNum);
		ss.close();
		return vo;
	}
	
	//전체 주문수 조회
	public static int totalCountOrder() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.admintotalCountOrder");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 주문목록 가져오기
	public static List<AdminOrderVO> orderList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminOrderVO> list = ss.selectList("shop.adminorderList", map);
		ss.close();
		return list;
	}
	
	//키워드에 해당하는 주문 수 조회
	public static int SearchCountorderList(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminSearchCountorderList", map); 
		ss.close();
		return totalCount;
	}
	
	
	//키워드에 해당하는 주문 동적검색
	public static List<AdminOrderVO> searchOrder(String select, String keyword, String begin, String end) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminOrderVO> list = ss.selectList("shop.adminsearchOrder", map); 
		ss.close();
		return list;
	}
	
	//주문번호에 따른 주문 수 조회
	public static int selectCountOrder(int orderNum) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminselectCountOrder", orderNum);
		ss.close();
		return totalCount;
	}
	
	//============================================================================추가됨
	//주문조회
	public static int adminSelectOrderCnt() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminSelectOrderCnt");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 주문목록 가져오기
	public static List<AdminOrderVO> adminSelectOrderList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminOrderVO> list = ss.selectList("shop.adminSelectOrderList", map);
		ss.close();
		return list;
	}
	
	//주문 상세보기
	public static List<AdminOrderVO> adminDetailOrderList(int oNum) {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminOrderVO> list = ss.selectList("shop.adminDetailOrderList", oNum);
		ss.close();
		return list;
	}
	
	//키워드에 해당하는 주문 수 조회
	public static int adminSearchCountOrderfinal(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminSearchCountOrderfinal", map); 
		ss.close();
		return totalCount;
	}
	
	
	//키워드에 해당하는 주문 동적검색
	public static List<AdminOrderVO> adminSelectOrderListfinal(String select, String keyword, int begin, int end) {
		Map<Object, Object> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminOrderVO> list = ss.selectList("shop.adminSelectOrderListfinal", map); 
		ss.close();
		return list;
	}
	
}
