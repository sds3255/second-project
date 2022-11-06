package com.mystudy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatiss.DBService;
import com.mystudy.vo.AdminQnaVO;

public class AdminQnaDAO {
	
	public static List<AdminQnaVO> selectQnaAll() {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminQnaVO> list = ss.selectList("shop.adminselectQnaAll");
		ss.close();
		return list;
	}
	
	public static List<AdminQnaVO> selectQnA(String qNum) {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminQnaVO> list = ss.selectList("shop.selectQnA", qNum);
		ss.close();
		return list;
	}
	
	public static AdminQnaVO selectQnAVO(int qNum) {
		SqlSession ss = DBService.getFactory().openSession();
		AdminQnaVO vo = ss.selectOne("shop.adminselectQnAVO", qNum);
		ss.close();
		return vo;
	}
	
	//게시글 갯수
	public static int getTotalCountQna() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.admintotalCountQna");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 게시글 목록 가져오기
	public static List<AdminQnaVO> qnaList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminQnaVO> list = ss.selectList("shop.adminqnaList", map);
		ss.close();
		return list;
	}
	
	public static List<AdminQnaVO> getSearchQna(String select, String keyword, String begin, String end) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminQnaVO> list = ss.selectList("shop.adminsearchQna", map); 
		ss.close();
		return list;
	}
	
	public static int SearchCountQna(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminSearchCountQna", map); 
		ss.close();
		return totalCount;
	}
	
	//답변없는 게시글 갯수
	public static int totalCountnoAnswerQna() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.admintotalCountnoAnswerQna");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 답변없는 게시글 목록 가져오기
	public static List<AdminQnaVO> qnanoAnswerList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminQnaVO> list = ss.selectList("shop.adminqnanoAnswerList", map);
		ss.close();
		return list;
	}
	
	//키워드에 해당하는 답변없는 질문 수 조회
	public static int SearchCountnoAnswerList(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminSearchCountnoAnswerList", map); 
		ss.close();
		return totalCount;
	}
	
	//키워드에 해당하는 답변없는 질문 동적검색
	public static List<AdminQnaVO> searchnoAnswer(String select, String keyword, String begin, String end) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminQnaVO> list = ss.selectList("shop.adminsearchnoAnswer", map); 
		ss.close();
		return list;
	}
	
	//조회수수정
	public static int adminupdateQnaHits(int qNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.adminupdateQnaHits", qNum);
		ss.close();
		return result;
	}
	
}
