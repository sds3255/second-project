package com.mystudy.Project_shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.Project_shop.vo.ProductPriceVO;
import com.mystudy.mybatis.DBService;

public class ProductDAO {

	
	//검색한 상품 갯수 조회
	public static int searchCount(String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int searchCount = ss.selectOne("shop.searchCount1", map);
		ss.close();
		return searchCount;
	}
	
	//상품 검색
	public static List<ProductPriceVO> getSearchList(String keyword, int begin, int end) {
		Map<Object, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductPriceVO> list = ss.selectList("shop.searchPro", map);
		
		ss.close();
		return list;
	}
	
	// 상품 전체 조회
	public static List<ProductPriceVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductPriceVO> list = ss.selectList("shop.list");
		ss.close();
		return list;
	}

	// 제품번호 사용 1개 데이터 조회
	public static ProductPriceVO selectOne(String productNum) {
		SqlSession ss = DBService.getFactory().openSession();
		ProductPriceVO vo = ss.selectOne("shop.one", productNum);
		ss.close();

		return vo;
	}

	// 품목 분류별 데이터 조회
	public static List<ProductPriceVO> list(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductPriceVO> list = ss.selectList("shop.ca", category);
		ss.close();

		return list;
	}

	// 케이스의 카테고리별 전체 개수 조회
	public static int getTotalCount(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.totalCount1", category);
		ss.close();

		return totalCount;
	}

	// 케이스의 전체 개수 조회
	public static int getTotalCount2() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.totalCount2");
		ss.close();

		return totalCount;
	}

	// 페이지에 해당하는 케이스 가져오기
	public static List<ProductPriceVO> getList(int begin, int end, String category) {
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("begin", begin);
		map.put("end", end);

		SqlSession ss = DBService.getFactory().openSession();
		List<ProductPriceVO> list = ss.selectList("shop.clist", map);
		ss.close();
		return list;
	}

	// 페이지에 해당하는 케이스 가져오기
	public static List<ProductPriceVO> getList2(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);

		SqlSession ss = DBService.getFactory().openSession();
		List<ProductPriceVO> list = ss.selectList("shop.plist", map);
		ss.close();
		return list;

	}
	//장바구니 담기
	public static void cartadd(String productnum, String id, String count,String model) {
		Map<String, Object> map = new HashMap<>();
		SqlSession ss = DBService.getFactory().openSession(true);
		int productnumm = Integer.parseInt(productnum);
		int countt = Integer.parseInt(count);
		map.put("productnum", productnumm);
		map.put("id", id);
		map.put("count", countt);
		map.put("model", model);
		ss.insert("shop.cartadd", map);
		ss.close();
	}

	//가격낮은순 조회
	public static List<ProductPriceVO> lowprice(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);

		SqlSession ss = DBService.getFactory().openSession();
		List<ProductPriceVO> list = ss.selectList("shop.lowprice", map);
		ss.close();
		return list;

	}
}
