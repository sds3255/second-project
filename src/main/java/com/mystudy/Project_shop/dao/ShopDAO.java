package com.mystudy.Project_shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.Project_shop.vo.productVO;
import com.mystudy.Project_shop.vo.qnaVO;
import com.mystudy.Project_shop.vo.reviewCommentsVO;
import com.mystudy.Project_shop.vo.reviewVO;
import com.mystudy.mybatis.DBService;

public class ShopDAO {
	
	//게시글 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.totalCount");
		ss.close();
		return totalCount;
	}
	//리뷰게시판 전체 건수 조회
	public static int RgetTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.RtotalCount");
		ss.close();
		return totalCount;
	}
	
	//검색한 게시글 갯수 조회
	public static int searchCount(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.searchCount",map);
		ss.close();
		return totalCount;
	}
	//리뷰 검색한 게시글 갯수 조회
	public static int revSearchCount(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.revSearchCount",map);
		ss.close();
		return totalCount;
	}
	
	//게시글 조회
	public static List<qnaVO> getlist(int begin, int end){
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<qnaVO> list = ss.selectList("shop.getlist", map);
		ss.close();
		
		return list;
	}
	//리뷰게시글 조회
	public static List<reviewVO> Rgetlist(int begin, int end){
		HashMap<String, Integer> map = new HashMap<>();
		
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<reviewVO> list = ss.selectList("shop.Rgetlist", map);
		ss.close();
		
		return list;
	}
	
	
	//게시글 작성
	public static int qnainsert(qnaVO qvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shop.qnainsert",qvo);
		ss.close();
		
		return result;
	}
	//리뷰게시판 작성
	public static int revInsert(reviewVO rvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shop.revInsert", rvo);
		return result;
	}
	
	//게시글 검색 조회
	public static List<qnaVO> search(Map<String, String> map){
		
		SqlSession ss = DBService.getFactory().openSession();
		List<qnaVO> list = ss.selectList("shop.search", map);
		ss.close();
		
		return list;
	}
	
	public static List<qnaVO> revSearch(Map<String, String> map){
		
		SqlSession ss = DBService.getFactory().openSession();
		List<qnaVO> list = ss.selectList("shop.revSearch", map);
		ss.close();
		
		return list;
	}
	
	//게시판 조회수 증가
	public static int upHit(int qNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.upHit", qNum);
		ss.close();
		
		return result;
	}
	public static int rUpHit(int bNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.rUpHit", bNum);
		ss.close();
		
		return result;
	}
	
	//qna 페이지 번호로 검색
	public static qnaVO selectOne(int qNum) {
		SqlSession ss =  DBService.getFactory().openSession();
		qnaVO vo = ss.selectOne("shop.selectOne", qNum);
		ss.close();
		
		return vo;
	}
	
	//리뷰.. 페이지 번호로 검색
	public static reviewVO selectOneRev(int bNum) {
		SqlSession ss =  DBService.getFactory().openSession();
		reviewVO vo = ss.selectOne("shop.selectOneRev", bNum);
		ss.close();
		
		return vo;
	}
	
	
	//게시판 수정 전 ㅂ밀번호 확인
	public static String pwdcheck(int qNum) {
		SqlSession ss = DBService.getFactory().openSession();
		String pwdok = ss.selectOne("shop.pwdcheack", qNum);
		ss.close();
		return pwdok;
	}
	
	//게시판 수정
	public static int qnaUpdate(qnaVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.qnaUpdate", vo);
		ss.close();
		
		return result;
	}
	//리뷰게시판수정
	public static int rUpdate(reviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.rUpdate", vo);
		ss.close();
		
		return result;
	}
	
	//게시판 삭제
	public static int qnaDelete(int pNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("shop.qnaDelete", pNum);
		ss.close();
		
		return result;
	}
	
	public static int rDelete(int bNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("shop.rDelete", bNum);
		ss.close();
		
		return result;
	}
	
	// 주문한 상품 리스트 가져오기
	public static List<productVO> PList(String id){
		SqlSession ss = DBService.getFactory().openSession();
		List<productVO> list = ss.selectList("shop.pList", id);
		ss.close();
		return list;
	}
	
	//댓글달기
	public static int cmtInsert(reviewCommentsVO rcvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result =  ss.insert("shop.cmtInsert", rcvo);
		ss.close();
		return result;
	}
	public static List<reviewCommentsVO> cmtList(int bNum) {
		SqlSession ss = DBService.getFactory().openSession();
		List<reviewCommentsVO> list =  ss.selectList("shop.cmtList", bNum);
		ss.close();
		return list;
		
	}
	public static int cmtDelete(int cNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("shop.cmtDelete", cNum);
		ss.close();
		return result;
	}
	public static int cmtUpdate(reviewCommentsVO rcvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.cmtUpdate", rcvo);
		ss.close();
		return result;
	}
	
	
}













