package com.mystudy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatiss.DBService;
import com.mystudy.vo.AdminAnswerVO;

public class AdminAnswerDAO {
	
	//답변 추가
	public static int insertAnswer(AdminAnswerVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shop.admininsertAnswer", vo);
		ss.close();
		return result;
	}
	
	public static List<AdminAnswerVO> selectAnswer(String qaNum) {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminAnswerVO> list = ss.selectList("shop.adminselectAnswer", qaNum);
		ss.close();
		return list;
	}
	
	public static AdminAnswerVO selectAnswerOne(int qaNum) {
		SqlSession ss = DBService.getFactory().openSession();
		AdminAnswerVO vo = ss.selectOne("shop.adminselectAnswerOne", qaNum);
		ss.close();
		return vo;
	}
	
	public static AdminAnswerVO selectAnswerQnum(int qNum) {
		SqlSession ss = DBService.getFactory().openSession();
		AdminAnswerVO vo = ss.selectOne("shop.adminselectAnswerQnum", qNum);
		ss.close();
		return vo;
	}
	
	public static void deleteAnswer(String qaNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("shop.admindeleteAnswer", qaNum);
		ss.close();
	}
	
	public static int updateAnswer(AdminAnswerVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shop.adminupdateAnswer", vo);
		ss.close();
		return result;
	}
	public static List<AdminAnswerVO> AnswerAllList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminAnswerVO> list = ss.selectList("shop.adminAnswerAllList");
		ss.close();
		return list;
	}
	

}
