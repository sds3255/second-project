package com.mystudy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatiss.DBService;
import com.mystudy.vo.AdminProductVO;


public class AdminProductDAO {
	//상퓸전체 가져오기
	public static List<AdminProductVO> productAllList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminProductVO> list = ss.selectList("shop.adminproductAllList");
		ss.close();
		return list;
	}
	
	//상품의 전체 갯수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.admintotalCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 상품목록 가져오기
	public static List<AdminProductVO> productList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminProductVO> list = ss.selectList("shop.adminproductList", map);
		ss.close();
		return list;
	}
	
	//상품번호 받아서 조회
	public static AdminProductVO selectProduct(int productNum) {
		SqlSession ss = DBService.getFactory().openSession();
		AdminProductVO vo = ss.selectOne("shop.adminselectProduct", productNum);
		ss.close();
		return vo;
	}
	
	//상품 수정(전체)
	public static int updateProductAll(AdminProductVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.adminupdateProductAll", vo);
		ss.close();
		return result;
	}
	
	//상품 수정(이미지파일제외)
	public static int updateProductExcept(AdminProductVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.adminupdateProductExcept", vo);
		ss.close();
		return result;
	}
	
	//상품번호 받아서 상품 삭제
	public static void deleteProduct(String productNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("shop.admindeleteProduct", productNum);
		ss.close();
	}
	
	//상품 추가
	public static int insertProduct(AdminProductVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shop.admininsertProduct", vo);
		ss.close();
		return result;
	}
	
	//페이지에 해당하는 상품수 조회
	public static int SearchCountProduct(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminSearchCountProduct", map); 
		ss.close();
		return totalCount;
	}
	
	public static List<AdminProductVO> getSearchProduct(String select, String keyword, String begin, String end) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminProductVO> list = ss.selectList("shop.adminsearchProduct", map); 
		ss.close();
		return list;
	}
	
}
