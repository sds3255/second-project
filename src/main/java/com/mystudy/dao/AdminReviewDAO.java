package com.mystudy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatiss.DBService;
import com.mystudy.vo.AdminReviewVO;

public class AdminReviewDAO {
	//리뷰 갯수
	public static int admin_totalCountReview() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.admin_totalCountReview");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 리뷰 목록 가져오기
	public static List<AdminReviewVO> admin_reviewList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminReviewVO> list = ss.selectList("shop.admin_reviewList", map);
		ss.close();
		return list;
	}
	
	//해당 번호로 리뷰 하나 가져오기
	public static AdminReviewVO adminselectReview(int bNum) {
		SqlSession ss = DBService.getFactory().openSession();
		AdminReviewVO vo = ss.selectOne("shop.adminselectReview", bNum);
		ss.close();
		return vo;
	}
	
	//키워드에 해당하는 리뷰수 조회
	public static int adminSearchCountReview(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminSearchCountReview", map); 
		ss.close();
		return totalCount;
	}
	
	//키워드에 해당하는 리뷰조회
	public static List<AdminReviewVO> admingetSearchReview(String select, String keyword, String begin, String end) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminReviewVO> list = ss.selectList("shop.admingetSearchReview", map); 
		ss.close();
		return list;
	}
	
	//조회수수정
	public static int adminupdateReviewHits(int bNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.adminupdateReviewHits", bNum);
		ss.close();
		return result;
	}
	
}
